package dao.impl;

import util.pool.DBConnectionPool;
import vo.Map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MapDaoImpl {

    public ArrayList<Map> find() {
        ArrayList<Map> flist = new ArrayList<Map>();
        Map f = null;
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from map";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                f = new Map();
                f.setx(rs.getDouble("x"));
                f.sety(rs.getDouble("y"));
                f.setname(rs.getString("name"));
                f.setContent(rs.getString("content"));
                flist.add(f);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flist;
    }
}
