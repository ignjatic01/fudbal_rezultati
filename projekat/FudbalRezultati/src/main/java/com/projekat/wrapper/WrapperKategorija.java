package com.projekat.wrapper;

import com.projekat.model.Kategorija;
import com.projekat.util.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class WrapperKategorija
{
    private static final String SQL_SELECT = "select * from kategorija";

    public static List<Kategorija> selectAll()
    {
        List<Kategorija> retVal = new ArrayList<>();
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            s = c.createStatement();
            rs = s.executeQuery(SQL_SELECT);

            while (rs.next())
            {
                retVal.add(new Kategorija(rs.getInt("idKategorija"), rs.getString("starosnaKategorija"),
                        rs.getString("nivoTakmicenja")));
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
