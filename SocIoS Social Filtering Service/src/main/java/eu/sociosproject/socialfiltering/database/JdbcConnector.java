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

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import eu.sociosproject.socialfiltering.database.StringUtil.IVariableProvider;

/**
 * This class contains utility methods to work with plain JDBC connections.
 * 
 * @author kotelnikov
 */
public class JdbcConnector {

    public interface ISqlAction<T> {
        T run(Connection connection) throws SQLException;
    }

    private static Logger log = Logger.getLogger(JdbcConnector.class.getName());

    private int fCounter;

    private String fJdbcLogin;

    private String fJdbcPassword;

    private String fJdbcURL;

    private IVariableProvider fPropertyResolver;

    public JdbcConnector() {
    }

    public JdbcConnector(IVariableProvider provider) {
        this();
        open(provider);
    }

    public JdbcConnector(final Map<String, String> params) {
        this();
        open(params);
    }

    public boolean checkTable(String tableName) throws SQLException {
        Connection connection = createConnection();
        DatabaseMetaData dmd = connection.getMetaData();
        ResultSet tables = dmd.getTables(
            connection.getCatalog(),
            null,
            tableName,
            null);
        try {
            return tables.next();
        } finally {
            tables.close();
            closeConnection(connection);
        }
    }

    public void closeConnection(Connection connection) {
        try {
            connection.close();
        } catch (Throwable t) {
            throw handleError("Can not close the DB connection.", t);
        }
    }

    public Connection createConnection() {
        try {
            Connection connection = DriverManager.getConnection(
                fJdbcURL,
                fJdbcLogin,
                fJdbcPassword);
            connection.setAutoCommit(false);
            return connection;
        } catch (Exception e) {
            throw handleError("Can not open JDBC connection", e);
        }
    }

    public String getParam(String key) {
        String result = StringUtil.resolvePropertyByKey(key, fPropertyResolver);
        return result;

    }

    public RuntimeException handleError(String msg, Throwable e) {
        log.log(Level.WARNING, msg, e);
        return new RuntimeException(e);
    }

    public void open(IVariableProvider propertyResolver) {
        try {
            fPropertyResolver = propertyResolver;
            String driver = getParam("jdbc.driver");
            Class.forName(driver);
            fJdbcURL = getParam("jdbc.url");
            fJdbcLogin = getParam("jdbc.login");
            fJdbcPassword = getParam("jdbc.password");
        } catch (Exception e) {
            throw handleError("Cannot load JDBC driver.", e);
        }
    }

    public void open(final Map<String, String> params) {
        open(new IVariableProvider() {
            @Override
            public String getValue(String name) {
                String result = System.getProperty(name);
                if (result == null) {
                    result = params.get(name);
                }
                return result;
            }
        });
    }

    public synchronized <T> T run(ISqlAction<T> action) throws SQLException {
        Connection connection = createConnection();
        fCounter++;
        boolean commit = false;
        try {
            T result = action.run(connection);
            commit = true;
            return result;
        } finally {
            fCounter--;
            if (fCounter == 0) {
                if (commit) {
                    connection.commit();
                } else {
                    connection.rollback();
                }
            }
            closeConnection(connection);
        }
    }

    public synchronized <T> T run(String msg, ISqlAction<T> action) {
        try {
            return run(action);
        } catch (Throwable t) {
            throw handleError("ERROR! " + msg, t);
        }
    }

}