package com.projekat.wrapper;

import com.projekat.model.Klub;
import com.projekat.util.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class WrapperKlub
{
    public static final String SQL_SELECT_ALL = "select * from klub";

    public static List<Klub> selectAll()
    {
        List<Klub> retVal = new ArrayList<>();
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            s = c.createStatement();
            rs = s.executeQuery(SQL_SELECT_ALL);
            while (rs.next())
            {
                retVal.add(new Klub(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rs, s, c);
        }
        return retVal;
    }
}
