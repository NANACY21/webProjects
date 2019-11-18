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
 * 对NUser类的操作
 * 对NUser表的访问
 * 继承通用类
 */
public class NUserDaoImpl extends GeneralOperation implements IDao, IDaoNew {

    public String insert(Object obj) {
        String result = "";
        NUser user = null;
        if (obj instanceof NUser) {
            user = (NUser) obj;
        }
        String sql = "insert into nuser(nickname,password) values(?,?)";

        /*新增普通用户 密码加密 双向加密
        String sql = "insert into nuser(nickname,password) values(?,ENCODE(?,'abracadabra'))";
        获取原来的密码
        select DECODE(password,'abracadabra') from nuser WHERE name='李篪';
        */
        Object[] objects = {user.getNickname(), user.getPassword()};
        int i = this.generalUpdate(sql, objects);
        NUser last = (NUser) findLast();
        sql = "insert into nuser2(uID,ID,name,sex,telephone,email) values(?,?,?,?,?,?)";
        objects = new Object[]{last.getuID(), user.getID(), user.getName(), user.getSex(), user.getTelephone(), user.getEmail()};
        i = this.generalUpdate(sql, objects);
        if (i > 0) {
            result = "插入成功";
        } else {
            result = "";//插入失败
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
                return "删除成功";
            }
        }
        return "";//删除失败
    }


    /**
     * 查找用户/好友
     *
     * @param id 主键 uID
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
     * 使用jar
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
     * 查询的封装 ok
     *
     * @return 一张表的所有内容
     */
    @Override
    public List findAll() {
        List<Object> nusers = new ArrayList();
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from nuser NATURAL JOIN nuser2";//用什么查什么，避免用*
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();//执行查询
            while (rs.next()) {
                NUser user = new NUser();
                user.setuID(rs.getLong("uID"));//jdbc中 该字段如果起了别名 就要用别名
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
     * 使用jar 1.6/1.7版本有不同
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
     * @param obj 值对象 新的值封装成对象
     * @return 仅返回更新成功 -> ok
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
                return "更新成功";
            }
        }
        return "";//更新失败
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
            rs = ps.executeQuery();//执行查询
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
     * @param ID 身份证号
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
     * @param surname 姓
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
                user.setuID(rs.getLong("uID"));//jdbc中 该字段如果起了别名 就要用别名
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
     * @return 总元组个数
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
        pageBean.setCurrentPage(1);//只需改这一个，即可实现整个分页
        pageBean.setTotalCount(dao.getTotalCount());
        pageBean.setStart();
        pageBean.setTotalPages();
        dao.getNUsers(pageBean);
        for (NUser nUser : pageBean.getItems()) {
            System.out.println(nUser.getuID());
        }
    }
}
