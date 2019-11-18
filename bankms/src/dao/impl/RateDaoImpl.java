package dao.impl;

import dao.IDao;
import util.pool.DBConnectionPool;
import vo.Rate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class RateDaoImpl implements IDao {

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
        List<Object> allRate = new ArrayList();
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from rate";//用什么查什么，避免用*
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();//执行查询
            while (rs.next()) {
                Rate rate = new Rate();
                rate.setCurrencyName(rs.getString("currencyName"));
                rate.setCountryName(rs.getString("countryName"));
                rate.setSellMoney(rs.getDouble("sellMoney"));
                rate.setBuyMoney(rs.getDouble("buyMoney"));
                allRate.add(rate);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }
        return allRate;
    }

    @Override
    public List getObjects() {
        return null;
    }

    public Vector<String> getAllCurrencyName() {
        Vector<String> vector = new Vector<>();
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from rate";//用什么查什么，避免用*
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();//执行查询
            while (rs.next()) {
                vector.addElement(rs.getString("currencyName"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }
        return vector;
    }

    public Rate find(String currencyName) {
        Connection con = DBConnectionPool.getInstance().getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Rate rate = null;
        try {
            ps = con.prepareStatement("select * from rate where currencyName=?");
            ps.setString(1, currencyName);
            rs = ps.executeQuery();
            if (rs.next()) {
                rate = new Rate();
                rate.setCurrencyName(rs.getString("currencyName"));
                rate.setCountryName(rs.getString("countryName"));
                rate.setBuyMoney(rs.getDouble("buyMoney"));
                rate.setSellMoney(rs.getDouble("sellMoney"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }
        return rate;
    }
}
