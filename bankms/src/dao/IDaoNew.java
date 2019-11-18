package dao;

import java.util.List;

/**
 * 该接口提供了表特殊的db操作
 */
public interface IDaoNew {

    /**
     * 查找任意表的最后一行元组
     *
     * @return
     */
    public Object findLast();

    /**
     * 查找任意表的一些元组
     *
     * @param mul 一定是外键
     * @return
     */
    public List getObjectsByMUL(long mul);
}
