package com.projekat.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;

public class DBUtil
{
    private static String jdbcURL;
    private static String username;
    private static String password;

    private static final String BUNDLE_BASE_NAME = "com.projekat.fudbalrezultati.db";

    static
    {
        ResourceBundle bundle = PropertyResourceBundle.getBundle(BUNDLE_BASE_NAME);
        jdbcURL = bundle.getString("jdbcURL");
        username = bundle.getString("username");
        password = bundle.getString("password");
    }

    public static PreparedStatement preparedStatement(Connection c, String sql, boolean retGenKeys, Object... values) throws SQLException
    {
        PreparedStatement ps = c.prepareStatement(sql, retGenKeys ? Statement.RETURN_GENERATED_KEYS : Statement.NO_GENERATED_KEYS);
        for(int i = 0; i < values.length; i++)
            ps.setObject(i + 1, values[i]);

        return ps;
    }

    public static Connection getConnection() throws SQLException
    {
        Connection c = DriverManager.getConnection(jdbcURL, username, password);
        return c;
    }

    public static void close(Connection c)
    {
        if(c != null)
        {
            try {
                c.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void close(Statement s)
    {
        if(s != null)
        {
            try {
                s.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void close(ResultSet rs)
    {
        if(rs != null)
        {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void close(ResultSet rs, Statement s, Connection c)
    {
        close(rs);
        close(s);
        close(c);
    }

    public static void close(Statement s, Connection c)
    {
        close(s);
        close(c);
    }
}
