package dao.base;

import util.pool.DBConnectionPool;

import java.sql.*;
import java.util.*;

/**
 * apache的dbutiljar已封装，这里是手写，而框架不需要该jar和手写
 */
public class GeneralOperation {

    /**
     * dao层单表增删改的通用方法，即增删改的封装
     *
     * @param sql  sql语句，带?的
     * @param objs 传入Object数组（？集合） 或 null
     * @return >0 成功 =0 失败
     */
    public int generalUpdate(String sql, Object... objs) {
        int result = 0;
        Connection con = null;
        //优点：可以执行相同的sql多次、防止sql注入（不知namepw强行登入）
        //select * from 表名 where 字段名='自己猜的' or '1=1' and password='猜的' or '1=1'
        PreparedStatement ps = null;
        //CallableStatement
        try {
            con = DBConnectionPool.getInstance().getConnection();
            //这是一个事务，取消自动提交事务
            con.setAutoCommit(false);
            //执行预编译
            ps = con.prepareStatement(sql);
            if (objs != null) {
                //赋值
                for (int i = 0; i < objs.length; i++) {
                    ps.setObject(i + 1, objs[i]);//第i+1个问号
                }
            }
            //返回受影响的行数 返回值可检验是否成功
            result = ps.executeUpdate();
            con.commit();//提交当前事务
        } catch (SQLException e) {
            try {
                con.rollback();//回滚
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            DBConnectionPool.getInstance().close(null, ps);
            DBConnectionPool.getInstance().release(con);
        }
        return result;
    }

    /**
     * dao层单表查询的通用方法，即查询的封装
     *
     * @param sql
     * @param params
     * @return
     */
    public List<Map<String, Object>> generalQuery(String sql, Object... params) {
        //1个map - 一行元组  键、值 - 列名、值
        List<Map<String, Object>> table = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBConnectionPool.getInstance().getConnection();
            ps = con.prepareStatement(sql);
            if (null != params) {
                for (int i = 0; i < params.length; i++) {
                    ps.setObject(i + 1, params[i]);
                }
            }
            rs = ps.executeQuery();
            //获取结果集的元数据（结构 字段名）
            ResultSetMetaData rsmd = rs.getMetaData();
            //返回结果集的列数 以获取每列的名字
            int columnCount = rsmd.getColumnCount();
            while (rs.next()) {//行遍历元组
                Map<String, Object> tuple = new HashMap<>();

                for (int i = 0; i < columnCount; i++) {
                    //运行中获取sql中查询的列的名称 或别名  参数：列的序号
                    String key = rsmd.getColumnLabel(i + 1);
                    //获取sql中查询的列的名称 不能获取别名  参数：列的序号
                    //rsmd.getColumnName(i+1);
                    Object value = rs.getObject(key);//得到值
                    tuple.put(key, value);
                }
                table.add(tuple);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //直观的输出数据表
        Set<String> allKey = table.get(0).keySet();
        Iterator<String> iterator = allKey.iterator();
        while (iterator.hasNext()) {
            System.out.print(iterator.next() + "\t");
        }
        System.out.println();
        for (Map<String, Object> tuple : table) {
            allKey = tuple.keySet();
            iterator = allKey.iterator();
            while (iterator.hasNext()) {
                String key = iterator.next();
                System.out.print((tuple.get(key).toString().length() != 0 ? tuple.get(key).toString() : "null") + "\t");
            }
            System.out.println();
        }


        return table;
    }

    public static void main(String[] args) {
        GeneralOperation go = new GeneralOperation();
        go.generalQuery("select  *  from nuser2", null);
    }
}
