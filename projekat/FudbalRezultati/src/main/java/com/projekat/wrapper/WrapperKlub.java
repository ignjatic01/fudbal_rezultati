package com.projekat.wrapper;

import com.projekat.contoller.ControllerUtakmica;
import com.projekat.model.Klub;
import com.projekat.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WrapperKlub
{
    public static final String SQL_SELECT_ALL = "select * from klub";
    private static final String SQL_SELECT_BY_LIGA = "select * from klub where idKlub in (select idKlub from clan where idLiga = ?)";
    private static final String SQL_SELECT_BY_ID = "select * from klub where idKlub = ?";

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

    public static List<Klub> selectByLiga(int idLiga)
    {
        List<Klub> retVal = new ArrayList<>();
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            ps = c.prepareStatement(SQL_SELECT_BY_LIGA, Statement.NO_GENERATED_KEYS);
            ps.setInt(1, idLiga);
            rs = ps.executeQuery();
            while (rs.next())
            {
                retVal.add(new Klub(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rs, ps, c);
        }
        return retVal;
    }

    public static Klub selectById(int id)
    {
        Klub klub = null;
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
                klub = new Klub(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rs, ps, c);
        }
        return klub;
    }
}
