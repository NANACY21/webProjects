package model;

import vo.Rate;

import java.util.ArrayList;
import java.util.Vector;

public interface RateService {

    /**
     * ��ȡrate������data
     *
     * @return
     */
    public ArrayList<Rate> getAllRate();

    /**
     * �õ�rate�����й�������
     *
     * @return
     */
    public Vector<String> getAllCurrencyName();

    /**
     * ͨ���������Ƶõ�Rate����
     *
     * @param countryName
     * @return
     */
    public Rate getRate(String countryName);

    /**
     * ���
     * �÷�����Ӧ���ɱ��ӿ��ṩ
     *
     * @param cardID
     * @param money
     * @return
     */
    public String FES(long cardID, double money, String currencyName);

    /**
     * ����
     * �÷�����Ӧ���ɱ��ӿ��ṩ
     *
     * @param cardID
     * @param money
     * @return
     */
    public String FEP(long cardID, double money, String currencyName);
}
