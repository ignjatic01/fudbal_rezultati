package com.projekat.wrapper;

import com.projekat.model.Gol;
import com.projekat.model.Utakmica;
import com.projekat.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WrapperGol
{
    private static final String SQL_SELECT_BY_UTAKMICA = "select g.*, concat(substr(i.ime, 1, 1), '. ', i.prezime) as igrac from " +
            "gol g left join igrac i on i.idIgrac = g.idIgrac where g.idUtakmica = ? order by g.minut asc";
    private static final String SQL_INSERT = "insert into gol(idGol, idUtakmica, idKlub, idIgrac, minut) values(null, ?, ?, ?, ?)";

    public static List<Gol> selectByUtakmica(int idUtakmica)
    {
        List<Gol> retVal = new ArrayList<>();
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            ps = c.prepareStatement(SQL_SELECT_BY_UTAKMICA, Statement.NO_GENERATED_KEYS);
            ps.setInt(1, idUtakmica);
            rs = ps.executeQuery();
            while (rs.next())
            {
                retVal.add(new Gol(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rs, ps, c);
        }
        return retVal;
    }

    public static int insert(Gol g)
    {
        int retVal = 0;
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            ps = c.prepareStatement(SQL_INSERT, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, g.getIdUtakmica());
            ps.setInt(2, g.getIdKlub());
            ps.setInt(3, g.getIdIgrac());
            ps.setInt(4, g.getMinut());
            retVal = ps.executeUpdate();
            if(retVal != 0)
            {
                rs = ps.getGeneratedKeys();
                if(rs.next())
                {
                    g.setIdGol(rs.getInt(1));
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
}
