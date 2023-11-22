package com.projekat.wrapper;

import com.projekat.model.Drzava;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WrapperDrzava
{
    private static final String SQL_SELECT_ALL = "select * from drzava";

    public static List<Drzava> selectAll()
    {
        List<Drzava> retVal = new ArrayList<>();
        //Connection
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;

        try {
            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fudbal_rezultati", "student", "mysql#356A");
            s = c.createStatement();
            rs = s.executeQuery(SQL_SELECT_ALL);

            while (rs.next())
            {
                retVal.add(new Drzava(rs.getInt("idDrzava"), rs.getString("drzava"), rs.getString("kod")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        finally {
            if(rs != null)
            {
                try {
                    rs.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if(s != null)
            {
                try {
                    s.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if(c != null)
            {
                try {
                    c.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        return retVal;
    }
}
