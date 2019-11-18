package dao;
import java.util.List;

/**
 * 该包即DAO设计模式
 * 该接口提供了表增删改查的db操作，即BaseDao
 */
public interface IDao {

    /**
     * 任意表添加一行元组
     *
     * @param obj
     * @return
     */
    public String insert(Object obj);

    /**
     * 删除任意表的一行元组
     *
     * @param id 主键以确定元组
     * @return
     */
    public String delete(long id);

    /**
     * 更新任意表的一行元组
     *
     * @param obj 值对象 新的值封装成对象
     * @return
     */
    public String update(Object obj);

    /**
     * 查找任意表的某一行元组
     *
     * @param id 主键
     * @return
     */
    public Object find(long id);

    /**
     * 查找任意表的某一行元组
     *
     * @param id 主键
     * @return
     */
    public Object getObjectById(long id);

    /**
     * 查找任意表的所有元组
     *
     * @return
     */
    public List findAll();

    /**
     * 查找任意表的所有元组
     *
     * @return
     */
    public List getObjects();
}