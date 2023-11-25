package com.projekat.wrapper;

import com.projekat.model.Drzava;
import com.projekat.util.DBUtil;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WrapperDrzava
{
    private static final String SQL_SELECT_ALL = "select * from drzava";
    private static final String SQL_INSERT = "insert into drzava(idDrzava, drzava, kod) values(null, ?, ?)";
    private static final String SQL_UPDATE = "Update drzava set drzava = ?, kod = ? where idDrzava = ?";
    private static final String SQL_DELETE = "delete from drzava where (idDrzava = ?)";

    public static List<Drzava> selectAll()
    {
        List<Drzava> retVal = new ArrayList<>();
        //Connection
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;

        try {
            c = DBUtil.getConnection();
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
            DBUtil.close(rs, s, c);
        }
        return retVal;
    }

    public static int insert(Drzava d)
    {
        int retVal = 0;
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            c = DBUtil.getConnection();
            ps = c.prepareStatement(SQL_INSERT, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, d.getDrzava());
            ps.setString(2, d.getKod());
            retVal = ps.executeUpdate();
            if(retVal != 0)
            {
                rs = ps.getGeneratedKeys();
                if(rs.next())
                {
                    d.setIdDrzava(rs.getInt(1));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rs, ps, c);
        }
        return retVal;
    }

    public static int update(Drzava d)
    {
        int retVal = 0;
        Connection c = null;
        PreparedStatement ps = null;

        try {
            c = DBUtil.getConnection();
            Object values[] = {d.getDrzava(), d.getKod(), d.getIdDrzava()};
            ps = DBUtil.preparedStatement(c, SQL_UPDATE, false, values);
            retVal = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(ps, c);
        }
        return retVal;
    }

    public static int delete(int id)
    {
        int retVal = 0;
        Connection c = null;
        PreparedStatement ps = null;
        try {
            c = DBUtil.getConnection();
            ps = c.prepareStatement(SQL_DELETE, Statement.NO_GENERATED_KEYS);
            ps.setInt(1, id);
            retVal = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(ps, c);
        }
        return retVal;
    }
}
