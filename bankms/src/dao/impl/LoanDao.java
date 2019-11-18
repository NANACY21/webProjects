package dao.impl;
import dao.base.GeneralOperation;
import util.pool.DBConnectionPool;
import vo.loan.Loan;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LoanDao {

//    public static void main(String[] args) {
//
////
//        LoanDao l = new LoanDao();
//        Loan ln = new Loan();
////        System.out.println(l.delete(201906230001L));
//
//        ln = (Loan)l.getObjectsByLoanID(201906230003L);


//        System.out.print(ln.getLoanID()+" "+ln.getUserID()+" "+ln.getLoanType()+" "+ln.getAmount());
//        System.out.print(" "+ln.getLoanTime()+" "+ln.getCreateTime()+" "+ln.getReturnTime());
//        System.out.println(" "+ln.getCardID()+" "+ln.getState()+" "+ln.getComment());
//
//        System.out.println(l.delete(201906230005L));
//
//        ln.setLoanID(201906230003L);
//        ln.setUserID(230107199802221213L);
//        ln.setLoanType(1);
//        ln.setAmount(20000);
//        ln.setLoanTime(6);
//        ln.setCreateTime(new Date());
//        //ln.setReturnTime();
//        ln.setCardID(6616235316542201L);
//        ln.setState(2);
//        //ln.setComment("null");
//        System.out.println(l.update(ln));

//        List<Object> loans= l.getObjectsByState(1);
//        for(Object o:loans){
//            Loan ln = (Loan) o;
//            System.out.print(ln.getLoanID()+" "+ln.getUserID()+" "+ln.getLoanType()+" "+ln.getAmount());
//            System.out.print(" "+ln.getLoanTime()+" "+ln.getCreateTime()+" "+ln.getReturnTime());
//            System.out.println(" "+ln.getCardID()+" "+ln.getState()+" "+ln.getComment());
//        }
//

//        System.out.println(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));

//    }

    public String add(Object obj) {

        Loan ln = null;
        if (obj instanceof Loan) {
            ln = (Loan) obj;
        }
        GeneralOperation go = new GeneralOperation();
        String sql = "insert into loan(loanID,userID,loanType,amount,loanTime,createTime,returnTime,cardID,state,comment) values(?,?,?,?,?,?,?,?,?,?)";
        Object[] objects = {ln.getLoanID(), ln.getUserID(), ln.getLoanType(), ln.getAmount(), ln.getLoanTime(), ln.getCreateTime(), ln.getReturnTime(), ln.getCardID(), ln.getState(), ln.getComment()};
        int i = go.generalUpdate(sql, objects);
        if (i > 0) {
            return "插入成功";
        }
        return "";
    }


    public String delete(long id) {
        GeneralOperation se = new GeneralOperation();
        String sql = "delete from loan where loanID=?";
        Object[] objects = {id};
        int i = se.generalUpdate(sql, objects);
        if (i > 0) {
            return "删除成功";
        }
        return "";
    }

    public String update(Object obj) {
        Loan ln = null;
        if (obj instanceof Loan) {
            ln = (Loan) obj;
        }
        GeneralOperation go = new GeneralOperation();
        String sql = "update loan SET userID=?,loanType=?,amount=?,loanTime=?,createTime=?,returnTime=?,cardID=?,state=?,comment=? WHERE loanID = ?";
        Object[] objects = {ln.getUserID(), ln.getLoanType(), ln.getAmount(), ln.getLoanTime(), ln.getCreateTime(), ln.getReturnTime(), ln.getCardID(), ln.getState(), ln.getComment(), ln.getLoanID()};
        int i = go.generalUpdate(sql, objects);
        if (i > 0) {
            return "更新成功";
        }
        return "";
    }

    //    eg : SELECT COUNT(*) FROM loan where userID = 123456789123456789 and state = 2;
    public int getCount(String command) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBConnectionPool.getInstance().getConnection();
            String sql = "SELECT COUNT(*) FROM loan where " + command;
            //System.out.println(sql);
            ps = con.prepareStatement(sql);
            if (null == command) {
                return 0;
            }
            rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List getObjectsByUserID(long userID) {
        List<Object> loans = new ArrayList();
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from loan where userID=?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setLong(1, userID);
            rs = ps.executeQuery();//执行查询
            while (rs.next()) {
                Loan ln = new Loan();
                ln.setLoanID(rs.getLong("loanID"));
                ln.setUserID(rs.getLong("userID"));
                ln.setLoanType(rs.getInt("loanType"));
                ln.setAmount(rs.getDouble("amount"));
                ln.setLoanTime(rs.getInt("loanTime"));
                ln.setCreateTime(rs.getDate("createTime"));
                ln.setReturnTime(rs.getDate("returnTime"));
                ln.setCardID(rs.getLong("cardID"));
                ln.setState(rs.getInt("state"));
                ln.setComment(rs.getString("comment"));
                loans.add(ln);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }

        return loans;
    }

    public Object getObjectsByLoanID(long loanID) {
        Loan ln = new Loan();
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from loan where loanID=?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setLong(1, loanID);
            rs = ps.executeQuery();//执行查询
            rs.next();
            ln.setLoanID(rs.getLong("loanID"));
            ln.setUserID(rs.getLong("userID"));
            ln.setLoanType(rs.getInt("loanType"));
            ln.setAmount(rs.getDouble("amount"));
            ln.setLoanTime(rs.getInt("loanTime"));
            ln.setCreateTime(rs.getDate("createTime"));
            ln.setReturnTime(rs.getDate("returnTime"));
            ln.setCardID(rs.getLong("cardID"));
            ln.setState(rs.getInt("state"));
            ln.setComment(rs.getString("comment"));
            return ln;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }

        return null;
    }

    public List getObjectsByState(int state) {
        List<Object> loans = new ArrayList();
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from loan where state=" + String.valueOf(state);
//        System.out.println(sql);
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();//执行查询
            while (rs.next()) {
                Loan ln = new Loan();
                ln.setLoanID(rs.getLong("loanID"));
                ln.setUserID(rs.getLong("userID"));
                ln.setLoanType(rs.getInt("loanType"));
                ln.setAmount(rs.getDouble("amount"));
                ln.setLoanTime(rs.getInt("loanTime"));
                ln.setCreateTime(rs.getDate("createTime"));
                ln.setReturnTime(rs.getDate("returnTime"));
                ln.setCardID(rs.getLong("cardID"));
                ln.setState(rs.getInt("state"));
                ln.setComment(rs.getString("comment"));
                loans.add(ln);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }

        return loans;
    }
}
