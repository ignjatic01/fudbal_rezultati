package com.projekat.wrapper;

import com.projekat.model.Liga;
import com.projekat.util.DBUtil;

import javax.security.auth.login.AccountLockedException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WrapperLiga
{
    private static final String SQL_SELECT_ALL = "select * from liga_prikaz";
    private static final String SQL_INSERT = "insert into liga(idLiga, nazivLige, idDrzava, datumPocetka, datumKraja, idKategorija) values(null, ?, ?, ?, ?, ?)";
    private static final String SQL_UPDATE = "update liga set nazivLige = ?, idDrzava = ?, datumPocetka = ?, datumKraja = ?, idKategorija = ? where idLiga = ?";
    private static final String SQL_DELETE = "delete from liga where idLiga = ?";

    public static List<Liga> selectAll()
    {
        List<Liga> retVal = new ArrayList<>();

        Connection c = null;
        Statement s = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            s = c.createStatement();
            rs = s.executeQuery(SQL_SELECT_ALL);

            while (rs.next())
            {
                retVal.add(new Liga(rs.getInt(1), rs.getString(4), rs.getInt(2), rs.getDate(6), rs.getDate(7), rs.getInt(3),
                        rs.getString(5), rs.getString(8)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rs, s, c);
        }

        return retVal;
    }

    public static int insert(Liga l)
    {
        int retVal = 0;
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            ps = c.prepareStatement(SQL_INSERT, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, l.getNazivLige());
            if(l.getIdDrzava() != null)
            {
                ps.setInt(2, l.getIdDrzava());
            }
            else
            {
                ps.setObject(2, null);
            }
            ps.setDate(3, l.getDatumPocetka());
            ps.setDate(4, l.getDatumKraja());
            ps.setInt(5, l.getIdKategorija());
            retVal = ps.executeUpdate();
            if(retVal != 0)
            {
                rs = ps.getGeneratedKeys();
                if(rs.next())
                {
                    l.setIdLiga(rs.getInt(1));
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

    public static  int update(Liga l)
    {
        int retVal = 0;
        Connection c = null;
        PreparedStatement ps = null;
        try {
            c = DBUtil.getConnection();
            Object values[] = {l.getNazivLige(), l.getIdDrzava(), l.getDatumPocetka(), l.getDatumKraja(), l.getIdKategorija(), l.getIdLiga()};
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
