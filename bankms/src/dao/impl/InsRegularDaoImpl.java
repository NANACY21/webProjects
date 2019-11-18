package dao.impl;

import dao.IDao;
import util.pool.DBConnectionPool;
import vo.insProduct.InsRegular;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class InsRegularDaoImpl implements IDao {

    @Override
    public String insert(Object obj) {
        return null;
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
        List allirp = new ArrayList();//存储所有期交保险产品
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from insregular";
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //database事先有data，由外存传到内存模型，内存模型的产生，参数需要自增id；
//                先有内存模型，传到外存，参数则不需要自增id
                InsRegular irp = new InsRegular(rs.getLong("ID"), rs.getString("name"), rs.getString("InsCompanyName"), rs.getLong("TotalPremium"),
                        rs.getString("detail"),
                        rs.getInt("f"), rs.getInt("flag"));
                allirp.add(irp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                DBConnectionPool.getInstance().release(con);
            }
        }

        return allirp;
    }

    @Override
    public List getObjects() {
        return null;
    }
}
