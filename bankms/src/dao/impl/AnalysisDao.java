package dao.impl;

import util.pool.DBConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

public class AnalysisDao {

    //    public static void main(String[] args) {
//        AnalysisDao ad = new AnalysisDao();
//        int year = 2018;
//        int cardID = 111111;
//        String type = "工资";
//        String command = "YEAR (time)= "+year+" and destinationID= "+cardID+" and note='"+type+"'";
//        String command1 = "YEAR (time)= "+year+" and destinationID= "+cardID;
//        Map<String,Object> map = ad.getObjectsByMonth(command1);
//
//        for(int i = 1;i<=12;i++){
//            if(map.get(String.valueOf(i)) != null){
//                System.out.println(i+" " +map.get(String.valueOf(i)));
//            }
//        }
//    }
    //SELECT MONTH (time) AS MONTHS,SUM(money) FROM smtr WHERE YEAR (time)=2019 and SourceID = 222222 GROUP BY MONTH ( time ) ORDER BY MONTHS
    // 支出:YEAR (time)=? and SourceID=? and note=?
    // 收入YEAR (time)=? and destinationID=? and note=?
    public Map<String, Object> getObjectsByMonth(String command) {
        Map<String, Object> data = new HashMap<>();
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "SELECT MONTH (time) AS MONTHS,SUM(money) FROM smtr WHERE " + command + " GROUP BY MONTH ( time ) ORDER BY MONTHS";
        //System.out.println(sql);
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String key = rs.getString(1);
                double values = rs.getDouble(2);
                data.put(key, values);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }
        return data;
    }
//    public Map<String, Object> getObjectsByType(int year,String type) {
//        Map<String, Object>  data = new HashMap<>();
//        Connection con = DBConnectionPool.getInstance().getConnection();
//        String sql = "SELECT MONTH (time) AS MONTHS,SUM(money) FROM smtr WHERE YEAR (time)="+year+" and SourceID = "+type+" GROUP BY MONTH ( time ) ORDER BY MONTHS";
//        System.out.println(sql);
//        PreparedStatement ps=null;
//        ResultSet rs=null;
//        try {
//            ps = con.prepareStatement(sql);
//            rs = ps.executeQuery();
//            while(rs.next()){
//                String key = rs.getString(1);
//                double values = rs.getDouble(2);
//                data.put(key,values);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        finally{
//            DBConnectionPool.close(rs, ps);
//            DBConnectionPool.getInstance().release(con);
//        }
//        return data;
//    }
}
