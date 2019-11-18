package dao.impl;

import dao.IDao;
import dao.IDaoNew;
import dao.base.GeneralOperation;
import util.pool.DBConnectionPool;
import vo.card.BankCard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BankCardDaoImpl extends GeneralOperation implements IDao, IDaoNew {

    @Override
    public String insert(Object obj) {
        BankCard bc = null;
        if (obj instanceof BankCard) {
            bc = (BankCard) obj;
        }
        String sql = "insert into bankcard(password,money,state,uID) values(?,?,?,?)";
        Object[] objects = {bc.getPassword(), bc.getMoney(), bc.getState(), bc.getuID()};
        int i = this.generalUpdate(sql, objects);
        if (i > 0) {
            return "插入成功";
        }
        return "";//插入失败
    }

    @Override
    public String delete(long id) {
        String sql = "delete from bankcard where ID=?";
        Object[] objects = {id};
        int i = this.generalUpdate(sql, objects);
        if (i > 0) {
            return "删除成功";
        }
        return "";//删除失败
    }

    @Override
    public String update(Object obj) {
        BankCard bc = null;
        if (obj instanceof BankCard) {
            bc = (BankCard) obj;
        }
        String sql = "update bankcard set password=?,money=?,state=? where ID=?";
        Object[] objects = {bc.getPassword(), bc.getMoney(), bc.getState(), bc.getID()};
        int i = this.generalUpdate(sql, objects);
        if (i > 0) {
            return "更新成功";
        }
        return "";//删除失败
    }

    /**
     * 利息
     */
    public void updateAll() {
        String sql = "update bankcard set money=money+1";
        int i = this.generalUpdate(sql, null);
    }

    /**
     * @param id 主键
     * @return null->查找失败，!null->查找成功
     */
    @Override
    public Object find(long id) {
        BankCard bc = null;
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from bankcard where ID=?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setLong(1, id);
            rs = ps.executeQuery();//执行查询
            if (rs.next()) {
                bc = new BankCard(rs.getLong("uID"));
                bc.setPassword(rs.getString("password"));
                bc.setMoney(rs.getDouble("money"));
                bc.setID(rs.getLong("ID"));
                bc.setState(rs.getInt("state"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.getInstance().close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }
        return bc;
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

    /**
     * @return null->查找失败，!null->查找成功
     */
    @Override
    public Object findLast() {
        BankCard bc = null;
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from bankcard";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();//执行查询
            if (rs.next()) {
                rs.beforeFirst();
                rs.last();
                bc = new BankCard(rs.getLong("uID"));
                bc.setPassword(rs.getString("password"));
                bc.setMoney(rs.getDouble("money"));
                bc.setID(rs.getLong("ID"));
                bc.setState(rs.getInt("state"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.getInstance().close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }
        return bc;
    }

    /**
     * ok
     *
     * @param mul 非主键
     * @return 长度为0->查找失败，长度!=0->查找成功
     */
    @Override
    public List getObjectsByMUL(long mul) {
        List<Object> BankCards = new ArrayList();
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from bankcard where uID=?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setLong(1, mul);
            rs = ps.executeQuery();//执行查询
            while (rs.next()) {
                BankCard bc = new BankCard(rs.getLong("uID"));
                bc.setID(rs.getLong("ID"));
                bc.setPassword(rs.getString("password"));
                bc.setMoney(rs.getDouble("money"));
                bc.setState(rs.getInt("state"));
                BankCards.add(bc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }
        return BankCards;
    }
}
