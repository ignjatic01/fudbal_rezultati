package com.projekat.wrapper;

import com.projekat.model.Kategorija;
import com.projekat.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WrapperKategorija
{
    private static final String SQL_SELECT = "select * from kategorija";
    private static final String SQL_SELECT_BY_ID = "select * from kategorija where idKategorija = ?";

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

    public static Kategorija selectById(int id)
    {
        Kategorija kategorija = null;
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            ps = c.prepareStatement(SQL_SELECT_BY_ID, Statement.NO_GENERATED_KEYS);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if(rs.next())
            {
                kategorija = new Kategorija(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rs, ps, c);
        }
        return kategorija;
    }
}
