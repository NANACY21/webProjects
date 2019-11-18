package model.impl;
import dao.impl.TRDaoImpl;
import model.TRService;
import vo.TR;

import java.util.ArrayList;
import java.util.List;

public class TRServiceImpl implements TRService {

    private TRDaoImpl dao;

    public TRServiceImpl() {
        this.dao = new TRDaoImpl();
    }

    @Override
    public String addTR(TR tr) {
        String insert = dao.insert(tr);
        if ("插入成功".equals(insert)) {
            return "成功";
        }
        return "";
    }

    @Override
    public List<TR> getTR(long cardID, long time) {
        List result = new ArrayList<>();
        List<TR> allTR = dao.getObjectsByMUl(cardID, time);
        for (Object obj : allTR) {
            TR f = (TR) obj;
            result.add(f);
        }
        return result;
    }

    /**
     * 得到结汇购汇交易记录
     *
     * @param cardID
     * @return
     */
    public ArrayList<TR> getFFTR(long cardID) {
        return dao.getFFTR(cardID);
    }

    /**
     * 得到生活缴费交易记录
     *
     * @param cardID
     * @return
     */
    public List<TR> getLifePayTR(long cardID) {
        return dao.getLifePayTR(cardID);
    }
}
