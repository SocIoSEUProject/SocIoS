/**
 * 
 */
package eu.sociosproject.sociosapi.server.adaptors.myspace.test;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author kotelnikov
 */
public class ObjectPrinter {

    public static void print(Object obj, StringBuilder buf) {
        print("", obj, buf);
    }

    private static void print(String shift, Object obj, StringBuilder buf) {
        String valueShift = shift + "  ";
        if (obj == null) {
            buf.append("null");
        } else if (obj instanceof String
            || obj instanceof Enum<?>
            || obj instanceof Class<?>) {
            buf.append("\"");
            String str = obj.toString();
            char[] chars = str.toCharArray();
            for (int i = 0; i < chars.length; i++) {
                char ch = chars[i];
                if (ch == '\n') {
                    buf.append("\\n");
                } else if (ch == '\r') {
                    buf.append("\\r");
                } else if (ch == '\"' || ch == '\\') {
                    buf.append("\\" + ch);
                } else {
                    buf.append(ch);
                }
            }
            buf.append("\"");
        } else if (obj instanceof Number
            || obj instanceof Boolean
            || obj.getClass().isPrimitive()) {
            buf.append(obj);
        } else if (obj instanceof Iterable<?>) {
            buf.append("[");
            boolean first = true;
            for (Object o : (Iterable<?>) obj) {
                if (first) {
                    buf.append(",");
                }
                buf.append("\n");
                first = false;
                buf.append(valueShift);
                print(valueShift, o, buf);
            }
            if (!first) {
                buf.append("\n").append(shift);
            }
            buf.append("]");
        } else {
            buf.append("{");
            List<Method> methodList = new ArrayList<Method>();
            Map<Method, String> fieldNames = new HashMap<Method, String>();
            Set<String> fieldNameSet = new HashSet<String>();
            Class<? extends Object> type = obj.getClass();
            while (type != Object.class) {
                List<Method> list = new ArrayList<Method>();
                Method[] methods = type.getDeclaredMethods();
                for (Method method : methods) {
                    if (method.getParameterTypes().length > 0) {
                        continue;
                    }
                    String fieldName = method.getName();
                    if (!fieldName.startsWith("get")) {
                        continue;
                    }
                    fieldName = fieldName.substring("get".length());
                    if (fieldName.length() == 0) {
                        continue;
                    }
                    fieldName = Character.toLowerCase(fieldName.charAt(0))
                        + fieldName.substring(1);
                    if (fieldNameSet.contains(fieldName)) {
                        continue;
                    }
                    list.add(method);
                    fieldNameSet.add(fieldName);
                    fieldNames.put(method, fieldName);
                }
                methodList.addAll(0, list);
                type = type.getSuperclass();
            }
            boolean first = true;
            for (Method method : methodList) {
                Object value = null;
                try {
                    value = method.invoke(obj);
                } catch (Throwable t) {
                    value = null;
                }
                if (value == null) {
                    continue;
                }
                if (value instanceof Collection<?>
                    && ((Collection<?>) value).isEmpty()) {
                    continue;
                }
                if (!first) {
                    buf.append(",");
                }
                buf.append("\n");
                first = false;
                String fieldName = fieldNames.get(method);
                buf
                    .append(valueShift)
                    .append("\"")
                    .append(fieldName)
                    .append("\":");
                print(valueShift, value, buf);
            }
            if (!first) {
                buf.append("\n").append(shift);
            }
            buf.append("}");
        }
    }

    public static String serialize(Object obj) {
        StringBuilder buf = new StringBuilder();
        print(obj, buf);
        return buf.toString();
    }
}
