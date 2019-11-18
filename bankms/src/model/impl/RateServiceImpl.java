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
        if ("加拿大元".equals(currencyName)) {
            index = 0;
        } else if ("美元".equals(currencyName)) {
            index = 1;
        } else if ("日元".equals(currencyName)) {
            index = 2;
        }
        Vector<String> waiBi = DbReader.getWaiBi(cardID);
        String s = waiBi.elementAt(index);//我本身有这些外币
        if (Double.parseDouble(s) < money) {
            return "结汇失败，外币余额不足";
        }
        if (bc != null) {
            double needMoney = money * (rate.getSellMoney() / 100);

            BankCardServiceImpl service = new BankCardServiceImpl();
            String takeMoney = service.saveMoney(cardID, needMoney, "结汇");

            if (takeMoney.indexOf("失败") == -1) {
                //现在我有了这些外币

                String write = DbReader.write(cardID, money, index, 0);
                if ("成功".equals(write)) {
                    return "结汇成功";
                }
            }
        }
        return "结汇失败";
    }

    /**
     * 购汇
     *
     * @param cardID 账号
     * @param money  要买这些美元
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
            String takeMoney = service.takeMoney(cardID, needMoney, "购汇");

            if (takeMoney.indexOf("失败") == -1) {
                //现在我有了这些外币
                int index = 0;
                if ("加拿大元".equals(currencyName)) {
                    index = 0;
                } else if ("美元".equals(currencyName)) {
                    index = 1;
                } else if ("日元".equals(currencyName)) {
                    index = 2;
                }
                String write = DbReader.write(cardID, money, index, 1);
                if ("成功".equals(write)) {
                    return "购汇成功";
                }
            }
        }
        return "购汇失败";
    }
}
