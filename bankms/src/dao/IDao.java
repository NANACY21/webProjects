package dao;
import java.util.List;

/**
 * �ð���DAO���ģʽ
 * �ýӿ��ṩ�˱���ɾ�Ĳ��db��������BaseDao
 */
public interface IDao {

    /**
     * ��������һ��Ԫ��
     *
     * @param obj
     * @return
     */
    public String insert(Object obj);

    /**
     * ɾ��������һ��Ԫ��
     *
     * @param id ������ȷ��Ԫ��
     * @return
     */
    public String delete(long id);

    /**
     * ����������һ��Ԫ��
     *
     * @param obj ֵ���� �µ�ֵ��װ�ɶ���
     * @return
     */
    public String update(Object obj);

    /**
     * ����������ĳһ��Ԫ��
     *
     * @param id ����
     * @return
     */
    public Object find(long id);

    /**
     * ����������ĳһ��Ԫ��
     *
     * @param id ����
     * @return
     */
    public Object getObjectById(long id);

    /**
     * ��������������Ԫ��
     *
     * @return
     */
    public List findAll();

    /**
     * ��������������Ԫ��
     *
     * @return
     */
    public List getObjects();
}