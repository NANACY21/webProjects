package dao;

import java.util.List;

/**
 * �ýӿ��ṩ�˱������db����
 */
public interface IDaoNew {

    /**
     * �������������һ��Ԫ��
     *
     * @return
     */
    public Object findLast();

    /**
     * ����������һЩԪ��
     *
     * @param mul һ�������
     * @return
     */
    public List getObjectsByMUL(long mul);
}
