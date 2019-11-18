package dao.base;

import util.pool.DBConnectionPool;

import java.sql.*;
import java.util.*;

/**
 * apache��dbutiljar�ѷ�װ����������д������ܲ���Ҫ��jar����д
 */
public class GeneralOperation {

    /**
     * dao�㵥����ɾ�ĵ�ͨ�÷���������ɾ�ĵķ�װ
     *
     * @param sql  sql��䣬��?��
     * @param objs ����Object���飨�����ϣ� �� null
     * @return >0 �ɹ� =0 ʧ��
     */
    public int generalUpdate(String sql, Object... objs) {
        int result = 0;
        Connection con = null;
        //�ŵ㣺����ִ����ͬ��sql��Ρ���ֹsqlע�루��֪namepwǿ�е��룩
        //select * from ���� where �ֶ���='�Լ��µ�' or '1=1' and password='�µ�' or '1=1'
        PreparedStatement ps = null;
        //CallableStatement
        try {
            con = DBConnectionPool.getInstance().getConnection();
            //����һ������ȡ���Զ��ύ����
            con.setAutoCommit(false);
            //ִ��Ԥ����
            ps = con.prepareStatement(sql);
            if (objs != null) {
                //��ֵ
                for (int i = 0; i < objs.length; i++) {
                    ps.setObject(i + 1, objs[i]);//��i+1���ʺ�
                }
            }
            //������Ӱ������� ����ֵ�ɼ����Ƿ�ɹ�
            result = ps.executeUpdate();
            con.commit();//�ύ��ǰ����
        } catch (SQLException e) {
            try {
                con.rollback();//�ع�
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
     * dao�㵥���ѯ��ͨ�÷���������ѯ�ķ�װ
     *
     * @param sql
     * @param params
     * @return
     */
    public List<Map<String, Object>> generalQuery(String sql, Object... params) {
        //1��map - һ��Ԫ��  ����ֵ - ������ֵ
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
            //��ȡ�������Ԫ���ݣ��ṹ �ֶ�����
            ResultSetMetaData rsmd = rs.getMetaData();
            //���ؽ���������� �Ի�ȡÿ�е�����
            int columnCount = rsmd.getColumnCount();
            while (rs.next()) {//�б���Ԫ��
                Map<String, Object> tuple = new HashMap<>();

                for (int i = 0; i < columnCount; i++) {
                    //�����л�ȡsql�в�ѯ���е����� �����  �������е����
                    String key = rsmd.getColumnLabel(i + 1);
                    //��ȡsql�в�ѯ���е����� ���ܻ�ȡ����  �������е����
                    //rsmd.getColumnName(i+1);
                    Object value = rs.getObject(key);//�õ�ֵ
                    tuple.put(key, value);
                }
                table.add(tuple);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //ֱ�۵�������ݱ�
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
