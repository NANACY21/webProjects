package model.impl;

import dao.IDao;
import dao.impl.BankCardDaoImpl;
import dao.impl.RateDaoImpl;
import model.RateService;
import util.reader.DbReader;
import vo.Rate;
import vo.card.BankCard;

import java.util.*;

public class RateServiceImpl implements RateService {

    private RateDaoImpl dao;

    public RateServiceImpl() {
        this.dao = new RateDaoImpl();
    }

    /**
     * ok
     *
     * @return
     */
    @Override
    public ArrayList<Rate> getAllRate() {
        ArrayList<Rate> rates = new ArrayList<>();
        List all = dao.findAll();
        for (int i = 0; i < all.size(); i++) {
            Rate rate = (Rate) all.get(i);
            rates.add(rate);
        }
        return rates;
    }

    @Override
    public Vector<String> getAllCurrencyName() {
        return dao.getAllCurrencyName();
    }

    @Override
    public Rate getRate(String countryName) {
        return dao.find(countryName);
    }

    @Override
    public String FES(long cardID, double money, String currencyName) {
        Rate rate = dao.find(currencyName);
        IDao iDao = new BankCardDaoImpl();
        BankCard bc = (BankCard) iDao.find(cardID);
        int index = 0;
        if ("���ô�Ԫ".equals(currencyName)) {
            index = 0;
        } else if ("��Ԫ".equals(currencyName)) {
            index = 1;
        } else if ("��Ԫ".equals(currencyName)) {
            index = 2;
        }
        Vector<String> waiBi = DbReader.getWaiBi(cardID);
        String s = waiBi.elementAt(index);//�ұ�������Щ���
        if (Double.parseDouble(s) < money) {
            return "���ʧ�ܣ��������";
        }
        if (bc != null) {
            double needMoney = money * (rate.getSellMoney() / 100);

            BankCardServiceImpl service = new BankCardServiceImpl();
            String takeMoney = service.saveMoney(cardID, needMoney, "���");

            if (takeMoney.indexOf("ʧ��") == -1) {
                //������������Щ���

                String write = DbReader.write(cardID, money, index, 0);
                if ("�ɹ�".equals(write)) {
                    return "���ɹ�";
                }
            }
        }
        return "���ʧ��";
    }

    /**
     * ����
     *
     * @param cardID �˺�
     * @param money  Ҫ����Щ��Ԫ
     * @return
     */
    @Override
    public String FEP(long cardID, double money, String currencyName) {
        Rate rate = dao.find(currencyName);
        IDao iDao = new BankCardDaoImpl();
        BankCard bc = (BankCard) iDao.find(cardID);
        if (bc != null) {
            double needMoney = money * (rate.getSellMoney() / 100);

            BankCardServiceImpl service = new BankCardServiceImpl();
            String takeMoney = service.takeMoney(cardID, needMoney, "����");

            if (takeMoney.indexOf("ʧ��") == -1) {
                //������������Щ���
                int index = 0;
                if ("���ô�Ԫ".equals(currencyName)) {
                    index = 0;
                } else if ("��Ԫ".equals(currencyName)) {
                    index = 1;
                } else if ("��Ԫ".equals(currencyName)) {
                    index = 2;
                }
                String write = DbReader.write(cardID, money, index, 1);
                if ("�ɹ�".equals(write)) {
                    return "����ɹ�";
                }
            }
        }
        return "����ʧ��";
    }
}
