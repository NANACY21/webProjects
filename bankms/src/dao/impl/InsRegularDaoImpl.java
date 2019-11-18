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
        List allirp = new ArrayList();//�洢�����ڽ����ղ�Ʒ
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from insregular";
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //database������data������洫���ڴ�ģ�ͣ��ڴ�ģ�͵Ĳ�����������Ҫ����id��
//                �����ڴ�ģ�ͣ�������棬��������Ҫ����id
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
