/*
 *   Copyright 2013 Cognium Systems SAS
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */
package eu.sociosproject.socialfiltering.database;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * This class contains the following utility methods:
 * <ul>
 * <li>methods used to extract information from property files</li>
 * <li>methods used to resolve variables in strings</li>
 * </ul>
 * 
 * @author MikhailKotelnikov
 */
public class StringUtil {

    /**
     * Instances of this interface are used to resolve variables reffered in
     * property strings.
     */
    public interface IVariableProvider {

        /**
         * Returns the value corresponding to the given variable name.
         * 
         * @param name the name of the variable to resolve
         * @return the value corresponding to the given variable name.
         */
        String getValue(String name);
    }

    public static int deserializeString(char[] array, int i, StringBuffer buf) {
        boolean escaped = false;
        for (; i < array.length; i++) {
            char ch = array[i];
            if (escaped) {
                switch (ch) {
                    case 'n':
                        buf.append('\n');
                        break;
                    case 'r':
                        buf.append('\r');
                        break;
                    case 't':
                        buf.append('\t');
                        break;
                    case 'f':
                        buf.append('\f');
                        break;
                    default:
                        buf.append(ch);
                        break;
                }
                escaped = false;
                continue;
            } else {
                if (ch == '\\') {
                    escaped = true;
                    continue;
                }
                if (ch == ';' || ch == '=' || ch == '\n' || ch == '\r') {
                    break;
                }
                buf.append(ch);
            }
        }
        return i;
    }

    public static String deserializeString(String str) {
        StringBuffer buf = new StringBuffer();
        deserializeString(str.toCharArray(), 0, buf);
        return buf.toString();
    }

    /**
     * Extract all key/value pairs from the given map where keys are started
     * with the specified prefix. The resulting map contains keys with removed
     * prefix. This is an utility method used to work with configuration
     * (property) files.
     * 
     * <pre>
     * Example:
     * Initial map contains the following values:
     *  abc.x=ABC
     *  toto.a=123
     *  toto.b=234
     *  toto.c=345
     *  titi.asdf=ASDF
     *  ...
     * For the prefix "toto" this method returns a map with the following values:
     *  a=123
     *  b=234
     *  c=345 
     * </pre>
     * 
     * @param map the initial map contining key/value pairs to extract
     * @param prefix the key prefix
     * @return a map with key/value pairs from the original map where keys are
     *         started with the specified prefix; keys in the returned map does
     *         not contain the prefix
     */
    public static Map<String, String> extractMapForPrefix(
        Map<String, String> map,
        String prefix) {
        if (!prefix.endsWith(".")) {
            prefix += ".";
        }
        Map<String, String> result = new HashMap<String, String>();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            String key = entry.getKey();
            if (key.startsWith(prefix)) {
                key = key.substring(prefix.length());
                String value = entry.getValue();
                result.put(key, value);
            }
        }
        return result;
    }

    /**
     * This method is used to transform a simple map of key/values to a set of
     * configurations. The first parameter in this map (<code>key</code>)
     * defines a list of configurations. For each "configuration" this method
     * returns a Map with key/value pairs. For more information see example:
     * 
     * <pre>
     *  # The first configuration: "toto"
     *  toto.a=123
     *  toto.b=234
     *  toto.c=345
     *  # The second configuration: "titi"
     *  titi.asdf=ASDF
     *  titi.qsdf=QSDF
     * </pre>
     * 
     * @param map the map with the data
     * @param key the key containing a list of "configurations"
     * @return a map of maps; keys in this map are "configuration names" and
     *         values - map of key/value pairs corresponding to the
     *         configuration
     */
    public static Map<String, Map<String, String>> extractMaps(
        Map<String, String> map,
        String key) {
        String value = map.get(key);
        Map<String, Map<String, String>> result = new HashMap<String, Map<String, String>>();
        if (value == null) {
            return result;
        }
        String[] values = split(value);
        for (String prefix : values) {
            Map<String, String> submap = extractMapForPrefix(map, prefix);
            result.put(prefix, submap);
        }
        return result;
    }

    /**
     * This method is used to extract map of maps from the specified dictionary.
     * 
     * <pre>
     * This method will transform the following  parameter list:
     *   param.a.firstName=Alex
     *   param.a.lastName=Polonsky
     *   param.b.firstName=Renaud
     *   param.b.lastName=Polly
     *   param.c.firstName=Sergey
     *   param.c.lastName=Kobitskiy
     * into:
     *   {
     *      a: { firstName: Alex, lastName: Polonsky }, 
     *      b: { firstName: Renaud, lastName: Polly },
     *      c: { firstName: Sergey, lastName: Kobitskiy } 
     *   }
     * </pre>
     * 
     * @param map
     * @param prefix
     * @param delimiter this value is used to separate individual keys
     * @param trimPrefix if this flag is <code>true</code> then key prefixes
     *        will be removed from
     * @return a map of maps containing extracted dictionaries
     */
    public static Map<String, Map<String, String>> extractMapsForPrefix(
        Map<String, String> map,
        String prefix,
        String delimiter,
        boolean trimPrefix) {
        Map<String, Map<String, String>> result = new HashMap<String, Map<String, String>>();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            String newEntryKey = entry.getKey();
            if (newEntryKey.startsWith(prefix)) {
                if (trimPrefix) {
                    newEntryKey = newEntryKey.substring(prefix.length());
                }
                int idx = newEntryKey.indexOf(delimiter);
                if (idx > 0) {
                    String entryProperty = newEntryKey.substring(idx
                        + delimiter.length());
                    newEntryKey = newEntryKey.substring(0, idx);
                    String entryValue = entry.getValue();
                    Map<String, String> m = result.get(newEntryKey);
                    if (m == null) {
                        m = new HashMap<String, String>();
                        result.put(newEntryKey, m);
                    }
                    m.put(entryProperty, entryValue);
                }
            }
        }
        return result;
    }

    /**
     * This method is used to split the given string to "fragments" and
     * "variables". Each variable is a string contained between "${" and "}"
     * symbols. For example: "${java.home}". This utility method is used to
     * resolve variables used in property files.
     * <p>
     * This code was picked up from the Ant v1.7 (class:
     * "org.apache.tools.ant.PropertyHelper"). Ant is distributed under Apache
     * License v2.
     * </p>
     * 
     * @param value the value to parse
     * @param fragments a list of fragments
     * @param properties a list of properties
     * @return <code>true</code> if the given string was successfully parsed
     */
    protected static boolean parsePropertyString(
        String value,
        List<String> fragments,
        List<String> properties) {
        int prev = 0;
        int pos;
        boolean result = true;
        // search for the next instance of $ from the 'prev' position
        while ((pos = value.indexOf("$", prev)) >= 0) {

            // if there was any text before this, add it as a fragment
            // TODO, this check could be modified to go if pos>prev;
            // seems like this current version could stick empty strings
            // into the list
            if (pos > 0) {
                fragments.add(value.substring(prev, pos));
            }
            // if we are at the end of the string, we tack on a $
            // then move past it
            if (pos == (value.length() - 1)) {
                fragments.add("$");
                prev = pos + 1;
            } else if (value.charAt(pos + 1) != '{') {
                // peek ahead to see if the next char is a property or not
                // not a property: insert the char as a literal
                /*
                 * fragments.addElement(value.substring(pos + 1, pos + 2)); prev
                 * = pos + 2;
                 */
                if (value.charAt(pos + 1) == '$') {
                    // backwards compatibility two $ map to one mode
                    fragments.add("$");
                    prev = pos + 2;
                } else {
                    // new behaviour: $X maps to $X for all values of X!='$'
                    fragments.add(value.substring(pos, pos + 2));
                    prev = pos + 2;
                }

            } else {
                // property found, extract its name or bail on a typo
                int endName = value.indexOf('}', pos);
                if (endName < 0) {
                    result = false;
                    break;
                }
                String propertyName = value.substring(pos + 2, endName);
                fragments.add(null);
                properties.add(propertyName);
                prev = endName + 1;
            }
        }
        // no more $ signs found
        // if there is any tail to the file, append it
        if (prev < value.length()) {
            fragments.add(value.substring(prev));
        }
        return result;
    }

    private static void print(StringBuffer buf, char ch) {
        buf.append(ch);
    }

    private static void print(StringBuffer buf, String string) {
        buf.append(string);
    }

    private static void println(StringBuffer buf) {
        print(buf, "\n");
    }

    public static void printPair(StringBuffer buf, String key, String value) {
        serializeString(buf, key, true);
        print(buf, "=");
        serializeString(buf, value, false);
        println(buf);
    }

    /**
     * Splits the given string to keys and corresponding values. This method
     * considers that each key/value pair is stored in a separate line. Keys and
     * values are separated by the ":" or "=" symbol. This method trims the keys
     * and values.
     * 
     * @param str the string to parse
     * @return a map of strings
     */
    public static Map<String, String> readMap(String str) {
        Map<String, String> map = new HashMap<String, String>();
        String[] lines = str.split("[\n\r]+");
        for (String line : lines) {
            if (line.startsWith("#")) {
                continue;
            }
            char[] array = line.toCharArray();
            StringBuffer buf = new StringBuffer();
            int i = deserializeString(array, 0, buf);
            i++;
            String key = buf.toString();
            buf.delete(0, buf.length());
            deserializeString(array, i, buf);
            String value = buf.toString();
            map.put(key, value);
        }
        return map;
    }

    /**
     * Resolves all variables defined in the given string and puts the
     * corresponding values instead. If the string contains variables which are
     * not defined by the given value provider then the variable will be
     * returned in the original form. Note that if the values returned by the
     * value resolver will be resolved as well. For example if for the string
     * "${project}/src" the value provider resolves the property "project" as
     * "${user.home}/toto" then the variable "user.home" will be resolved as
     * well. If variables contain cyclic references then <code>null</code> will
     * be setted instead.
     * 
     * @param str the string to resolve
     * @param provider the property value provider
     * @return the resolved string
     */
    public static String resolveProperty(String str, IVariableProvider provider) {
        Set<String> set = new HashSet<String>();
        return resolveProperty(null, str, provider, set);
    }

    /**
     * The internal method used to resolve variables in the given string.
     * 
     * @param key the key corresponding to the resolved value
     * @param value the vaue to resolve
     * @param provider the property provider used to resolve variables
     * @param set this set is used to check cyclic variable references and to
     *        avoid infinite recursive calls
     * @return the resolved string
     */
    private static String resolveProperty(
        String key,
        String value,
        IVariableProvider provider,
        Set<String> set) {
        if (set.contains(key)) {
            return null;
        }
        set.add(key);
        try {
            List<String> fragmentList = new ArrayList<String>();
            List<String> variableList = new ArrayList<String>();
            if (!parsePropertyString(value, fragmentList, variableList)) {
                return value;
            }
            StringBuffer buf = new StringBuffer();
            int variableCounter = 0;
            for (String str : fragmentList) {
                if (str == null) {
                    str = variableList.get(variableCounter++);
                    String propertyValue = provider.getValue(str);
                    if (propertyValue != null) {
                        str = resolveProperty(str, propertyValue, provider, set);
                        buf.append(str);
                    } else {
                        buf.append("${");
                        buf.append(str);
                        buf.append("}");
                    }
                } else {
                    buf.append(str);
                }
            }
            return buf.toString();
        } finally {
            set.remove(key);
        }
    }

    /**
     * Loads the property value with the specified key and resolve it using the
     * {@link #resolveProperty(String, IVariableProvider)} method.
     * 
     * @param name the key of the property which should be resolved
     * @param provider the property value provider
     * @return the resolved string
     */
    public static String resolvePropertyByKey(
        String name,
        IVariableProvider provider) {
        String value = provider.getValue(name);
        return value != null ? resolveProperty(value, provider) : null;
    }

    public static String serializeString(String str) {
        return serializeString(str, false);
    }

    public static String serializeString(String str, boolean escapeSpaces) {
        StringBuffer buf = new StringBuffer();
        serializeString(buf, str, escapeSpaces);
        return buf.toString();
    }

    public static void serializeString(
        StringBuffer buffer,
        String str,
        boolean escapeSpace) {
        if (str == null) {
            return;
        }
        int len = str.length();
        int bufLen = len * 2;
        if (bufLen < 0) {
            bufLen = Integer.MAX_VALUE;
        }
        for (int x = 0; x < len; x++) {
            char aChar = str.charAt(x);
            switch (aChar) {
                case ' ':
                    if (x == 0 || escapeSpace) {
                        print(buffer, '\\');
                    }
                    print(buffer, ' ');
                    break;
                case '\t':
                    print(buffer, '\\');
                    print(buffer, 't');
                    break;
                case '\n':
                    print(buffer, '\\');
                    print(buffer, 'n');
                    break;
                case '\r':
                    print(buffer, '\\');
                    print(buffer, 'r');
                    break;
                case '\f':
                    print(buffer, '\\');
                    print(buffer, 'f');
                    break;
                case ':': // Fall through
                case ';': // Fall through
                case '=': // Fall through
                case '!':
                    print(buffer, '\\');
                    print(buffer, aChar);
                    break;
                default:
                    if ((aChar > 61) && (aChar < 127)) {
                        if (aChar == '\\') {
                            print(buffer, '\\');
                            print(buffer, '\\');
                            continue;
                        }
                        print(buffer, aChar);
                        continue;
                    }
                    if (aChar < 0x0020) {
                        print(buffer, '\\');
                        print(buffer, 'u');
                        print(buffer, Integer.toHexString((aChar >> 12) & 0xF));
                        print(buffer, Integer.toHexString((aChar >> 8) & 0xF));
                        print(buffer, Integer.toHexString((aChar >> 4) & 0xF));
                        print(buffer, Integer.toHexString(aChar & 0xF));
                    } else {
                        print(buffer, aChar);
                    }
            }
        }
    }

    /**
     * Splits the given string to substrings separated by following symbols (one
     * or more): ',', ';', ' ', '\t', '\n', '\r'.
     * 
     * @param value the value to split
     * @return an array of string values
     */
    public static String[] split(String value) {
        List<String> list = new ArrayList<String>();
        if (value != null && !"".equals(value)) {
            char[] array = value.toCharArray();
            StringBuffer buf = new StringBuffer();
            for (char ch : array) {
                if (ch == ','
                    || ch == ';'
                    || ch == ' '
                    || ch == '\t'
                    || ch == '\n'
                    || ch == '\r') {
                    if (buf.length() > 0) {
                        list.add(buf.toString());
                        buf.delete(0, buf.length());
                    }
                } else {
                    buf.append(ch);
                }
            }
            if (buf.length() > 0) {
                list.add(buf.toString());
            }
        }
        return list.toArray(new String[list.size()]);
    }

    /**
     * Serializes the given map in a single string. Each line represents one
     * key/value pair. Keys and values are delimited by the "=" symbol. The
     * returned string can be deserialized in a map using the
     * {@link #readMap(String)} method.
     * 
     * @param map the map to serialize
     * @return the serialized representation of the given map
     */
    public static String writeMap(Map<String, String> map) {
        StringBuffer buf = new StringBuffer();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue();
            StringUtil.printPair(buf, key, value);
        }
        return buf.toString();
    }

}
