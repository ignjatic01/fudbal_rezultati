package com.projekat.wrapper;

import com.projekat.model.Igrac;
import com.projekat.model.Utakmica;
import com.projekat.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WrapperIgrac
{
    private static final String SQL_SELECT = "select i.*, k.nazivKluba, d.drzava from igrac i " +
            "left join klub k on k.idKlub = i.idKlub left join drzava d on d.idDrzava = i.idDrzava";

    private static final String SQL_SELECT_BY_KLUB = "select i.*, k.nazivKluba, d.drzava from igrac i " +
            "left join klub k on k.idKlub = i.idKlub left join drzava d on d.idDrzava = i.idDrzava where i.idKlub = ?";

    public static List<Igrac> selectAll()
    {
        List<Igrac> retVal = new ArrayList<>();
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            s = c.createStatement();
            rs = s.executeQuery(SQL_SELECT);
            while (rs.next())
            {
                retVal.add(new Igrac(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
                        rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rs, s, c);
        }
        return retVal;
    }

    public static List<Igrac> selectByKlubID(int idKlub)
    {
        List<Igrac> retVal = new ArrayList<>();
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            ps = c.prepareStatement(SQL_SELECT_BY_KLUB, Statement.NO_GENERATED_KEYS);
            ps.setInt(1, idKlub);
            rs = ps.executeQuery();
            while (rs.next())
            {
                retVal.add(new Igrac(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
                        rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
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
