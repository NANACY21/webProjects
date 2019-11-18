package model;

import vo.TR;

import java.util.List;

public interface TRService {

    /**
     * 添加一条交易记录
     *
     * @param tr
     * @return
     */
    public String addTR(TR tr);

    /**
     * 显示该账户的交易记录
     *
     * @param cardID 银行卡号
     * @param time   最近time分钟的
     * @return
     */
    List<TR> getTR(long cardID, long time);
}