package com.projekat.wrapper;

import com.projekat.model.Utakmica;
import com.projekat.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WrapperUtakmica
{
    private static final String SQL_SELECT = "select * from utakmice_prikaz";
    private static final String SQL_SELECT_BY_ID_LIGA = "select * from utakmice_prikaz where idLiga = ?";
    private static final String SQL_PRIKAZI_UTAKMICE_KOLA = "{call PrikaziUtakmiceKola(?, ?)}";
    private static final String SQL_INSERT = "insert into utakmica(idUtakmica, idDomaci, idGosti, idStadion, datum, vrijeme, goloviDomaci," +
            " goloviGosti, idLiga, kolo) values(null, ?, ?, ?, ?, ?, 0, 0, ?, ?)";

    public static List<Utakmica> selectAll()
    {
        List<Utakmica> retVal = new ArrayList<>();
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            s = c.createStatement();
            rs = s.executeQuery(SQL_SELECT);
            while (rs.next())
            {
                retVal.add(new Utakmica(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDate(5),
                        rs.getTime(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getString(11),
                        rs.getString(12), rs.getString(13), rs.getString(14)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rs, s, c);
        }
        return retVal;
    }

    public static List<Utakmica> selectByLigaID(int idLiga)
    {
        List<Utakmica> retVal = new ArrayList<>();
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            ps = c.prepareStatement(SQL_SELECT_BY_ID_LIGA, Statement.NO_GENERATED_KEYS);
            ps.setInt(1, idLiga);
            rs = ps.executeQuery();
            while (rs.next())
            {
                retVal.add(new Utakmica(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDate(5),
                        rs.getTime(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getString(11),
                        rs.getString(12), rs.getString(13), rs.getString(14)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rs, ps, c);
        }
        return retVal;
    }

    public static List<Utakmica> getByIdLigaKolo(int idLiga, int kolo)
    {
        List<Utakmica> retVal = new ArrayList<>();
        Connection c = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            cs = c.prepareCall(SQL_PRIKAZI_UTAKMICE_KOLA);
            cs.setInt(1, idLiga);
            cs.setInt(2, kolo);
            rs = cs.executeQuery();
            while (rs.next())
            {
                retVal.add(new Utakmica(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDate(5),
                        rs.getTime(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getString(11),
                        rs.getString(12), rs.getString(13), rs.getString(14)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rs, cs, c);
        }
        return retVal;
    }

    public static int insert(Utakmica u)
    {
        int retVal = 0;
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            ps = c.prepareStatement(SQL_INSERT, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, u.getIdDomaci());
            ps.setInt(2, u.getIdGosti());
            ps.setInt(3, u.getIdStadion());
            ps.setDate(4, u.getDatum());
            ps.setTime(5, u.getVrijeme());
            ps.setInt(6, u.getIdLiga());
            ps.setInt(7, u.getKolo());
            retVal = ps.executeUpdate();
            if(retVal != 0)
            {
                rs = ps.getGeneratedKeys();
                if(rs.next())
                {
                    u.setIdUtakmica(rs.getInt(1));
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
