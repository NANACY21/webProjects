package model;

import vo.TR;

import java.util.List;

public interface TRService {

    /**
     * ���һ�����׼�¼
     *
     * @param tr
     * @return
     */
    public String addTR(TR tr);

    /**
     * ��ʾ���˻��Ľ��׼�¼
     *
     * @param cardID ���п���
     * @param time   ���time���ӵ�
     * @return
     */
    List<TR> getTR(long cardID, long time);
}