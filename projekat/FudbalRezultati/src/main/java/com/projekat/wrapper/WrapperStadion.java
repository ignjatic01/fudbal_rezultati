package com.projekat.wrapper;

import com.projekat.model.Stadion;
import com.projekat.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WrapperStadion
{
    private static final String SQL_SELECT_ALL = "select * from stadion_prikaz";
    private static final String SQL_SELECT_BY_ID = "select * from stadion_prikaz where idStadion = ?";

    public static List<Stadion> selectAll()
    {
        List<Stadion> retVal = new ArrayList<>();
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            s = c.createStatement();
            rs = s.executeQuery(SQL_SELECT_ALL);
            while (rs.next())
            {
                retVal.add(new Stadion(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getString(6)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rs, s, c);
        }
        return retVal;
    }

    public static Stadion selectById(int id)
    {
        Stadion stadion = null;
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
                stadion = new Stadion(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getString(6));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rs, ps, c);
        }
        return stadion;
    }
}
