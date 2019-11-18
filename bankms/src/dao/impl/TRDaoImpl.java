package dao.impl;

import dao.IDao;
import dao.base.GeneralOperation;
import util.pool.DBConnectionPool;
import vo.TR;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TRDaoImpl extends GeneralOperation implements IDao {

    @Override
    public String insert(Object obj) {
        TR tr = null;
        if (obj instanceof TR) {
            tr = (TR) obj;
        }
        String sql = "insert into tr(time,SourceID,money,destinationID,note) values(?,?,?,?,?)";
        Object[] objects = {tr.getTime(), tr.getSourceID(), tr.getMoney(), tr.getDestinationID(), tr.getNote()};
        if (tr.getSourceID() == -1) {
            sql = "insert into tr(time,money,destinationID,note) values(?,?,?,?)";
            objects = new Object[]{tr.getTime(), tr.getMoney(), tr.getDestinationID(), tr.getNote()};
        } else if (tr.getDestinationID() == -1) {
            sql = "insert into tr(time,SourceID,money,note) values(?,?,?,?)";
            objects = new Object[]{tr.getTime(), tr.getSourceID(), tr.getMoney(), tr.getNote()};
        }
        int i = this.generalUpdate(sql, objects);
        if (i > 0) {
            return "插入成功";
        }
        return "";//插入失败
    }

    @Override
    public String delete(long id) {
        return null;
    }

    @Override
    public String update(Object obj) {
        return null;
    }

    @Override
    public Object find(long id) {
        return null;
    }

    @Override
    public Object getObjectById(long id) {
        return null;
    }

    @Override
    public List findAll() {
        return null;
    }

    @Override
    public List getObjects() {
        return null;
    }


    public List<TR> getObjectsByMUl(long mul, long time) {
        List<TR> allTR = new ArrayList();
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from tr where (SourceID=? or destinationID=?) and (time > date_sub(now(),interval ? minute))";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setLong(1, mul);
            ps.setLong(2, mul);
            ps.setLong(3, time);
            rs = ps.executeQuery();//执行查询
            while (rs.next()) {
                TR tr = new TR(rs.getString("time"), rs.getLong("SourceID"), rs.getDouble("money"), rs.getLong("destinationID"), rs.getString("note"));
                tr.setID(rs.getInt("ID"));
                allTR.add(tr);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }

        return allTR;
    }


    public ArrayList<TR> getFFTR(long mul) {
        ArrayList<TR> allTR = new ArrayList();
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from tr where (SourceID=? or destinationID=?)";
//        String sql = "select * from tr where (SourceID=? or destinationID=?) and (note = ? or note = ?))";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setLong(1, mul);
            ps.setLong(2, mul);
//            ps.setString(3,"缁撴眹");
//            ps.setString(4,"璐?眹");
            rs = ps.executeQuery();//执行查询
            while (rs.next()) {
                TR tr = new TR(rs.getString("time"), rs.getLong("SourceID"), rs.getDouble("money"), rs.getLong("destinationID"), rs.getString("note"));
                tr.setID(rs.getInt("ID"));
                if (tr.getNote().equals("结汇") || tr.getNote().equals("购汇"))
                    allTR.add(tr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }

        return allTR;
    }

    public ArrayList<TR> getLifePayTR(long mul) {
        ArrayList<TR> allTR = new ArrayList();
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from tr where (SourceID=? or destinationID=?) and (note = ? or note = ?))";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setLong(1, mul);
            ps.setLong(2, mul);
            ps.setString(3, "手机费");
            ps.setString(4, "生活缴费");
            rs = ps.executeQuery();//执行查询
            while (rs.next()) {
                TR tr = new TR(rs.getString("time"), rs.getLong("SourceID"), rs.getDouble("money"), rs.getLong("destinationID"), rs.getString("note"));
                tr.setID(rs.getInt("ID"));
                allTR.add(tr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }

        return allTR;
    }
}
