package dao.impl;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import dao.IDao;
import dao.base.GeneralOperation;
import util.pool.DBConnectionPool;
import vo.Relation;

public class RelationDaoImpl extends GeneralOperation implements IDao {

    public String insert(Object obj) {
        Relation f = new Relation();
        if (obj instanceof Relation) {
            f = (Relation) obj;
        }
        String sql = "insert into relation(uID1,uID0) values(?,?)";
        Object[] objects = {f.getuID1(), f.getuID0()};
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

    /**
     * 删除1名好友
     *
     * @param myUID
     * @param uID
     * @return
     */
    public String delete(long myUID, long uID) {
        String sql = "delete from relation where (uID1=? and uID0=?) or (uID0=? and uID1=?)";
        Object[] objects = {myUID, uID, myUID, uID};
        int i = this.generalUpdate(sql, objects);
        if (i > 0) {
            return "删除成功";
        }
        return "";//删除失败
    }


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

    /**
     * 得到我的所有好友的id
     *
     * @param myUID
     * @return
     */
    public List findAll(long myUID) {
        List friends = new ArrayList();
        Connection con = DBConnectionPool.getInstance().getConnection();
        String sql = "select * from relation where uID1=? or uID0=?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setLong(1, myUID);
            ps.setLong(2, myUID);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getLong("uID0") == myUID) {
                    friends.add(rs.getLong("uID1"));
                } else {
                    friends.add(rs.getLong("uID0"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionPool.getInstance().close(rs, ps);
            DBConnectionPool.getInstance().release(con);
        }
        return friends;
    }

    @Override
    public List getObjects() {
        return null;
    }
}
