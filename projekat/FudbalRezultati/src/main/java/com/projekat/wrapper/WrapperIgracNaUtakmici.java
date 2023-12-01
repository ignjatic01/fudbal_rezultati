package com.projekat.wrapper;

import com.projekat.model.IgracNaUtakmici;
import com.projekat.model.Utakmica;
import com.projekat.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WrapperIgracNaUtakmici
{
    private static final String SQL_SELECT_BY_IDs = "select * from igrac_na_utakmici_prikaz where idKlub = ? and idUtakmica = ? order by uIgri desc";
    private static final String SQL_INSERT = "insert into igrac_na_utakmici(idIgrac, idUtakmica, uIgri) values(?, ?, ?)";
    private static final String SQL_DELETE = "delete from igrac_na_utakmici where idIgrac = ? and idUtakmica = ?";

    public static List<IgracNaUtakmici> selectById(int idKlub, int idUtakmica)
    {
        List<IgracNaUtakmici> retVal = new ArrayList<>();
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            ps = c.prepareStatement(SQL_SELECT_BY_IDs, Statement.NO_GENERATED_KEYS);
            ps.setInt(1, idKlub);
            ps.setInt(2, idUtakmica);
            rs = ps.executeQuery();
            while (rs.next())
            {
                retVal.add(new IgracNaUtakmici(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),
                        rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getBoolean(8)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rs, ps, c);
        }
        return retVal;
    }

    public static int insert(IgracNaUtakmici inu)
    {
        int retVal = 0;
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            ps = c.prepareStatement(SQL_INSERT, Statement.NO_GENERATED_KEYS);
            ps.setInt(1, inu.getIdIgrac());
            ps.setInt(2, inu.getIdUtakmica());
            ps.setBoolean(3, inu.getuIgri());
            retVal = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rs, ps, c);
        }
        return retVal;
    }

    public static int delete(int idIgrac, int idUtakmica)
    {
        int retVal = 0;
        Connection c = null;
        PreparedStatement ps = null;
        try {
            c = DBUtil.getConnection();
            ps = c.prepareStatement(SQL_DELETE, Statement.NO_GENERATED_KEYS);
            ps.setInt(1, idIgrac);
            ps.setInt(2, idUtakmica);
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
