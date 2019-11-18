package dao.impl;

import dao.base.GeneralOperation;
import util.pool.DBConnectionPool;
import vo.loan.LoanInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LoanInfoDao {

    public String add(Object obj) {

        LoanInfo lnf = null;
        if (obj instanceof LoanInfo) {
            lnf = (LoanInfo) obj;
        }
        GeneralOperation go = new GeneralOperation();
        String sql = "insert into loannfo(loanType,loanName,loanMsg, rate,overTimeRate) values(?,?,?,?,?)";
        Object[] objects = {lnf.getLoanType(), lnf.getLoanName(), lnf.getLoanMsg(), lnf.getRate(), lnf.getOverTimeRate()};
        int i = go.generalUpdate(sql, objects);
        if (i > 0) {
            return "插入成功";
        }
        return "";
    }


    public String delete(int loanType) {
        GeneralOperation se = new GeneralOperation();
        String sql = "delete from loaninfo  where loanType=?";
        Object[] objects = {loanType};
        int i = se.generalUpdate(sql, objects);
        if (i > 0) {
            return "删除成功";
        }
        return "";
    }

    public String update(Object obj) {
        LoanInfo lnf = null;
        if (obj instanceof LoanInfo) {
            lnf = (LoanInfo) obj;
        }
        GeneralOperation go = new GeneralOperation();
        String sql = "update loaninfo SET loanName=?,loanMsg=?, rate=?,overTimeRate=? WHERE loanType = ?";
        Object[] objects = {lnf.getLoanName(), lnf.getLoanMsg(), lnf.getRate(), lnf.getOverTimeRate(), lnf.getLoanType()};
        int i = go.generalUpdate(sql, objects);
        if (i > 0) {
            return "更新成功";
        }
        return "";
    }

    public List getAllObjects() {
        List<Object> loanInfos = new ArrayList();
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from loaninfo";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();//执行查询
            while (rs.next()) {
                LoanInfo lnf = new LoanInfo();
                lnf.setLoanType(rs.getInt("loanType"));
                lnf.setLoanName(rs.getString("loanName"));
                lnf.setLoanMsg(rs.getString("loanMsg"));
                lnf.setRate(rs.getDouble("rate"));
                lnf.setOverTimeRate(rs.getDouble("overTimeRate"));
                loanInfos.add(lnf);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }

        return loanInfos;
    }

    public Object getObjects(int loanType) {
        LoanInfo lnf = new LoanInfo();
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from loaninfo where loanType=" + loanType;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();//执行查询
            rs.next();
            lnf.setLoanType(rs.getInt("loanType"));
            lnf.setLoanName(rs.getString("loanName"));
            lnf.setLoanMsg(rs.getString("loanMsg"));
            lnf.setRate(rs.getDouble("rate"));
            lnf.setOverTimeRate(rs.getDouble("overTimeRate"));
            return lnf;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }
        return null;
    }
}
