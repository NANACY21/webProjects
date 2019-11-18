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
        if ("����ɹ�".equals(insert)) {
            return "�ɹ�";
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
     * �õ���㹺�㽻�׼�¼
     *
     * @param cardID
     * @return
     */
    public ArrayList<TR> getFFTR(long cardID) {
        return dao.getFFTR(cardID);
    }

    /**
     * �õ�����ɷѽ��׼�¼
     *
     * @param cardID
     * @return
     */
    public List<TR> getLifePayTR(long cardID) {
        return dao.getLifePayTR(cardID);
    }
}
