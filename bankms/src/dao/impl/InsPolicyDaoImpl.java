package dao.impl;

import dao.IDao;
import dao.base.GeneralOperation;
import util.pool.DBConnectionPool;
import vo.InsPolicy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import static util.Tool.getTime;

public class InsPolicyDaoImpl extends GeneralOperation implements IDao {

    @Override
    public String insert(Object obj) {
        InsPolicy ip = null;
        if (obj instanceof InsPolicy) {
            ip = (InsPolicy) obj;
        }
        String sql = "insert into inspolicy(PolicyHolderName,PolicyHolderID,insuredName,insuredID,BeneficiaryName,BeneficiaryID,InsureDate,payCardID,InsProductID) values(?,?,?,?,?,?,?,?,?)";
        Object[] objects = {ip.getPolicyHolderName(), ip.getPolicyHolderID(), ip.getInsuredName(), ip.getInsuredID(), ip.getBeneficiaryName(), ip.getBeneficiaryID(), getTime(), ip.getPayCardID(), ip.getInsProductID()};
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

    public Vector<InsPolicy> getAllInsPolicy(long ID) {
        Vector<InsPolicy> policies = new Vector<>();
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from inspolicy where PolicyHolderID=?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setLong(1, ID);
            rs = ps.executeQuery();
            while (rs.next()) {
                InsPolicy f = new InsPolicy();
                f.setInsProductID(rs.getLong("InsProductID"));
                f.setPayCardID(rs.getLong("payCardID"));
                f.setBeneficiaryID(rs.getLong("BeneficiaryID"));
                f.setBeneficiaryName(rs.getString("BeneficiaryName"));
                f.setInsureDate(rs.getString("InsureDate"));
                f.setInsuredID(rs.getLong("insuredID"));
                f.setInsuredName(rs.getString("insuredName"));
                f.setID(rs.getLong("ID"));
                f.setPolicyHolderID(rs.getLong("PolicyHolderID"));
                f.setPolicyHolderName(rs.getString("PolicyHolderName"));
                policies.add(f);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.getInstance().close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }
        return policies;
    }

    @Override
    public List getObjects() {
        return null;
    }
}
