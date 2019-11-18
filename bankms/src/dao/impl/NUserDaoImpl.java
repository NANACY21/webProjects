package dao.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import dao.IDao;
import dao.IDaoNew;
import dao.base.GeneralOperation;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.PageBean;
import util.pool.DBCP;
import util.pool.DBConnectionPool;
import vo.user.NUser;

/**
 * ��NUser��Ĳ���
 * ��NUser��ķ���
 * �̳�ͨ����
 */
public class NUserDaoImpl extends GeneralOperation implements IDao, IDaoNew {

    public String insert(Object obj) {
        String result = "";
        NUser user = null;
        if (obj instanceof NUser) {
            user = (NUser) obj;
        }
        String sql = "insert into nuser(nickname,password) values(?,?)";

        /*������ͨ�û� ������� ˫�����
        String sql = "insert into nuser(nickname,password) values(?,ENCODE(?,'abracadabra'))";
        ��ȡԭ��������
        select DECODE(password,'abracadabra') from nuser WHERE name='����';
        */
        Object[] objects = {user.getNickname(), user.getPassword()};
        int i = this.generalUpdate(sql, objects);
        NUser last = (NUser) findLast();
        sql = "insert into nuser2(uID,ID,name,sex,telephone,email) values(?,?,?,?,?,?)";
        objects = new Object[]{last.getuID(), user.getID(), user.getName(), user.getSex(), user.getTelephone(), user.getEmail()};
        i = this.generalUpdate(sql, objects);
        if (i > 0) {
            result = "����ɹ�";
        } else {
            result = "";//����ʧ��
        }
        return result;
    }

    public String delete(long id) {
        String sql = "delete from nuser2 where uID=?";
        Object[] objects = {id};
        int i = this.generalUpdate(sql, objects);
        if (i > 0) {
            sql = "delete from nuser where uID=?";
            objects = new Object[]{id};
            i = this.generalUpdate(sql, objects);
            if (i > 0) {
                return "ɾ���ɹ�";
            }
        }
        return "";//ɾ��ʧ��
    }


    /**
     * �����û�/����
     *
     * @param id ���� uID
     * @return
     */
    public Object find(long id) {
        Connection con = DBConnectionPool.getInstance().getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        NUser user = null;
        try {
            ps = con.prepareStatement("select * from nuser NATURAL JOIN nuser2 where uID=?");
            ps.setLong(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                user = new NUser();
                user.setuID(id);
                user.setNickname(rs.getString("nickname"));
                user.setPassword(rs.getString("password"));
                user.setID(rs.getLong("ID"));
                user.setName(rs.getString("name"));
                user.setSex(rs.getString("sex"));
                user.setTelephone(rs.getString("telephone"));
                user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }
        return user;
    }

    /**
     * ʹ��jar
     *
     * @param id
     * @return
     */
    @Override
    public Object getObjectById(long id) {
        QueryRunner qr = new QueryRunner(DBCP.getDataSource());
        try {
            //qr.execute("delete from dept where deptno=?", 50);
            return qr.query("select * from nuser where uID=?", new ResultSetHandler<NUser>() {

                @Override
                public NUser handle(ResultSet rs) throws SQLException {
                    NUser d = null;
                    if (rs.next()) {
                        d = new NUser();
                        //d.setDeptno(rs.getInt("deptno"));
                        d.setNickname(rs.getString("nickname"));
                        d.setPassword(rs.getString("password"));
                    }
                    return d;
                }


            }, new Object[]{id});
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * ��ѯ�ķ�װ ok
     *
     * @return һ�ű����������
     */
    @Override
    public List findAll() {
        List<Object> nusers = new ArrayList();
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from nuser NATURAL JOIN nuser2";//��ʲô��ʲô��������*
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();//ִ�в�ѯ
            while (rs.next()) {
                NUser user = new NUser();
                user.setuID(rs.getLong("uID"));//jdbc�� ���ֶ�������˱��� ��Ҫ�ñ���
                user.setNickname(rs.getString("nickname"));
                user.setPassword(rs.getString("password"));
                user.setID(rs.getLong("ID"));
                user.setName(rs.getString("name"));
                user.setSex(rs.getString("sex"));
                user.setTelephone(rs.getString("telephone"));
                user.setEmail(rs.getString("email"));
                nusers.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }
        return nusers;
    }

    /**
     * ʹ��jar 1.6/1.7�汾�в�ͬ
     *
     * @return
     */
    @Override
    public List getObjects() {
        //RowMapper<Dept>
        QueryRunner qr = new QueryRunner(DBCP.getDataSource());

        ResultSetHandler<List<NUser>> h = new BeanListHandler<NUser>(NUser.class);
        try {
            return qr.query("select * from nuser", new ResultSetHandler<List<NUser>>() {
                //
                @Override
                public List<NUser> handle(ResultSet rs) throws SQLException {
                    List<NUser> depts = new LinkedList<>();
                    NUser d = null;
                    while (rs.next()) {
                        d = new NUser();
                        d.setID(rs.getLong("ID"));
                        d.setName(rs.getString("name"));
                        d.setPassword(rs.getString("password"));
                        depts.add(d);
                    }
                    return depts;
                }

            });
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * @param obj ֵ���� �µ�ֵ��װ�ɶ���
     * @return �����ظ��³ɹ� -> ok
     */
    public String update(Object obj) {
        NUser f = new NUser();
        if (obj instanceof NUser) {
            f = (NUser) obj;
        }
        String sql = "update nuser set nickname=?,password=? where uID=?";
        Object[] objects = {f.getNickname(), f.getPassword(), f.getuID()};
        int i = this.generalUpdate(sql, objects);
        if (i > 0) {
            sql = "update nuser2 set ID=?,name=?,sex=?,telephone=?,email=?,birthday=?,qq=?,address=? where uID=?";
            objects = new Object[]{f.getID(), f.getName(), f.getSex(), f.getTelephone(), f.getEmail(), f.getBirthday(), f.getQq(), f.getAddress(), f.getuID()};
            i = this.generalUpdate(sql, objects);
            if (i > 0) {
                return "���³ɹ�";
            }
        }
        return "";//����ʧ��
    }

    /**
     * ok
     *
     * @return
     */
    @Override
    public Object findLast() {
        NUser nUser = null;
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from nuser";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();//ִ�в�ѯ
            if (rs.next()) {
                rs.beforeFirst();
                rs.last();
                nUser = new NUser();
                nUser.setuID(rs.getLong("uID"));
                nUser.setNickname(rs.getString("nickname"));
                nUser.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }
        return nUser;
    }

    @Override
    public List getObjectsByMUL(long mul) {
        return null;
    }

    /**
     * @param ID ���֤��
     * @return
     */
    public NUser getNUserByID(long ID) {
        Connection con = DBConnectionPool.getInstance().getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        NUser user = null;
        try {
            ps = con.prepareStatement("select * from nuser NATURAL JOIN nuser2 where nuser2.ID=?");
            ps.setLong(1, ID);
            rs = ps.executeQuery();
            if (rs.next()) {
                user = new NUser();
                user.setuID(rs.getLong("uID"));
                user.setNickname(rs.getString("nickname"));
                user.setPassword(rs.getString("password"));
                user.setID(ID);
                user.setName(rs.getString("name"));
                user.setSex(rs.getString("sex"));
                user.setTelephone(rs.getString("telephone"));
                user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }
        return user;
    }

    /**
     * @param surname ��
     * @return
     */
    public List<NUser> findBySurname(long myUID, String surname) {
        RelationDaoImpl relationDao = new RelationDaoImpl();
        List<Long> myAllFriend = relationDao.findAll(myUID);
        List friends = new ArrayList();

        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from nuser NATURAL JOIN nuser2 where nuser2.name like '" + surname + "%'";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                if (myAllFriend.contains(rs.getLong("uID"))) {
                    NUser user = new NUser();
                    user.setuID(rs.getLong("uID"));
                    user.setNickname(rs.getString("nickname"));
                    user.setPassword(rs.getString("password"));
                    user.setID(rs.getLong("ID"));
                    user.setName(rs.getString("name"));
                    user.setSex(rs.getString("sex"));
                    user.setTelephone(rs.getString("telephone"));
                    user.setEmail(rs.getString("email"));
                    friends.add(user);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }
        return friends;
    }

    public void getNUsers(PageBean<NUser> pageBean) {
        List<NUser> nUsers = new ArrayList<>();
        Connection con = DBConnectionPool.getInstance().getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("select * from nuser NATURAL JOIN nuser2 limit ?,?");
            ps.setInt(1, pageBean.getStart());
            ps.setInt(2, pageBean.getPageSize());
            rs = ps.executeQuery();
            while (rs.next()) {
                NUser user = new NUser();
                user.setuID(rs.getLong("uID"));//jdbc�� ���ֶ�������˱��� ��Ҫ�ñ���
                user.setNickname(rs.getString("nickname"));
                user.setPassword(rs.getString("password"));
                user.setID(rs.getLong("ID"));
                user.setName(rs.getString("name"));
                user.setSex(rs.getString("sex"));
                user.setTelephone(rs.getString("telephone"));
                user.setEmail(rs.getString("email"));
                nUsers.add(user);
            }
            pageBean.setItems(nUsers);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }
    }

    /**
     *
     * @return ��Ԫ�����
     */
    public int getTotalCount() {
        Connection con = DBConnectionPool.getInstance().getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int totalCount = 0;
        try {
            ps = con.prepareStatement("select count(*) cou from nuser NATURAL JOIN nuser2");
            rs = ps.executeQuery();
            if (rs.next()) {
                totalCount = rs.getInt("cou");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }
        return totalCount;
    }

    public static void main(String[] args) {
        NUserDaoImpl dao = new NUserDaoImpl();
        PageBean<NUser> pageBean = new PageBean<>();
        pageBean.setPageSize(5);
        pageBean.setCurrentPage(1);//ֻ�����һ��������ʵ��������ҳ
        pageBean.setTotalCount(dao.getTotalCount());
        pageBean.setStart();
        pageBean.setTotalPages();
        dao.getNUsers(pageBean);
        for (NUser nUser : pageBean.getItems()) {
            System.out.println(nUser.getuID());
        }
    }
}
