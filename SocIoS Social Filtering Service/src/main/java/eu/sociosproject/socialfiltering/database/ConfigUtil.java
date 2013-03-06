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

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import eu.sociosproject.socialfiltering.database.StringUtil.IVariableProvider;
import eu.sociosproject.sociosapi.SociosException;

public class ConfigUtil {

    // "config" sub-folder name
    private static String GF_DOMAIN_CONFIG_FOLDER = "config";

    // Glassfish Instance Root folder system variable
    private static String GF_INSTANCE_ROOT_PROPERTY = "com.sun.aas.instanceRoot";

    private static ConfigUtil instance = null;

    private static Logger log = Logger.getLogger(ConfigUtil.class.getName());

    private static String SFS_CONFIG = "socios-sfs.cfg";

    public static synchronized ConfigUtil getInstance() throws SociosException {
        if (instance == null) {
            instance = new ConfigUtil();

        }
        return instance;

    }

    // Read a given file from Glassfish Domain Configuration folder
    private static File readGlassfishConfigFile(final String fileName)
        throws SociosException {
        // Instance Root folder
        final String instanceRoot = System
            .getProperty(GF_INSTANCE_ROOT_PROPERTY);
        if (instanceRoot == null) {
            throw new SociosException(
                "Cannot find Glassfish instanceRoot. Is the com.sun.aas.instanceRoot system property set?");
        }

        // Instance Root + /config folder
        File configurationFolder = new File(instanceRoot
            + File.separator
            + GF_DOMAIN_CONFIG_FOLDER);
        File configFile = new File(configurationFolder, fileName);

        // return the given file
        return configFile;
    }

    protected Properties fProperties;

    Map<Integer, String> fSnsIdMap;

    private ConfigUtil() throws SociosException {
        super();
        loadProperties();
    }

    private void copy(InputStream input, OutputStream out) throws IOException {
        try {
            try {
                byte[] buf = new byte[1024 * 10];
                int len;
                while ((len = input.read(buf)) > 0) {
                    out.write(buf, 0, len);
                }
            } finally {
                out.close();
            }
        } finally {
            input.close();
        }
    }

    public JdbcConnector getConnector() throws SociosException {

        // This property provider is used to resolve variables in the string
        IVariableProvider propertyProvider = new StringUtil.IVariableProvider() {
            @Override
            public String getValue(String name) {
                return fProperties.get(name).toString();
            }
        };

        JdbcConnector connector = new JdbcConnector(propertyProvider);

        return connector;

    }

    public Map<Integer, String> getDefaultSnsIds() {

        if (fSnsIdMap == null) {
            fSnsIdMap = new HashMap<Integer, String>();

            // 1:flickr,2:facebook,3:twitter,4:youtube,5:opensocial,6:dailymotion
            String defaultSnsIds = fProperties.get("socios.sns.ids") != null
                ? fProperties.get("socios.sns.ids").toString()
                : "";

            String[] ids = defaultSnsIds.split(",");
            for (String id : ids) {
                int idx = id.indexOf(":");
                if (idx > 0 && id.length() > idx) {
                    fSnsIdMap.put(
                        Integer.parseInt(id.substring(0, idx)),
                        id.substring(idx + 1));
                }
            }
        }
        return fSnsIdMap;

    }

    private void loadProperties() throws SociosException {
        log.log(Level.INFO, "Loading SFS properties...");
        File config = readGlassfishConfigFile(SFS_CONFIG);
        fProperties = new Properties();
        try {
            fProperties.load(new FileInputStream(config));
        } catch (FileNotFoundException e) {
            throw new SociosException("Cannot find configuration file at "
                + config.getAbsolutePath());
        } catch (IOException e) {
            throw new SociosException("Cannot read configuration file at "
                + config.getAbsolutePath());
        }
    }

}
