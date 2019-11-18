package model;

import vo.Rate;

import java.util.ArrayList;
import java.util.Vector;

public interface RateService {

    /**
     * 获取rate表所有data
     *
     * @return
     */
    public ArrayList<Rate> getAllRate();

    /**
     * 得到rate表所有国家名称
     *
     * @return
     */
    public Vector<String> getAllCurrencyName();

    /**
     * 通过国家名称得到Rate对象
     *
     * @param countryName
     * @return
     */
    public Rate getRate(String countryName);

    /**
     * 结汇
     * 该方法不应该由本接口提供
     *
     * @param cardID
     * @param money
     * @return
     */
    public String FES(long cardID, double money, String currencyName);

    /**
     * 购汇
     * 该方法不应该由本接口提供
     *
     * @param cardID
     * @param money
     * @return
     */
    public String FEP(long cardID, double money, String currencyName);
}
