package model;

import vo.card.BankCard;
import java.util.List;

public interface BankCardService {

    /**
     * ����һ����ͨ���п������һ�����п��������һ���˻���
     *
     * @param userID �û����֤�� �������������
     * @param name   ��ʵ���� �������������
     * @return
     */
    String addBankCard(long userID, String name);

    /**
     * �˻�����
     *
     * @param cardID      ���п��� ������������������
     * @param oldPassword ��ʼ����
     * @param newPassword ������
     * @return
     */
    String accountActivation(long cardID, String oldPassword, String newPassword);

    /**
     * �˻���¼
     *
     * @param cardID   ���п��� ������������������
     * @param password ���п�����
     * @return �˻���¼���
     */
    String accountLogin(long cardID, String password);

    /**
     * �˻���ʧ
     *
     * @param cardID Ҫ��ʧ�����п���
     * @return
     */
    String accountReport(long cardID);

    /**
     * �˻����
     *
     * @param cardID �˺�
     * @return
     */
    double accountMoney(long cardID);

    /**
     * �˻����
     * ����1��TR
     *
     * @param cardID
     * @param money  �����
     * @return
     */
    String saveMoney(long cardID, double money, String note);

    /**
     * �˻�ȡ��
     * ����1��TR
     *
     * @param cardID
     * @param money  ȡ����
     * @return
     */
    String takeMoney(long cardID, double money, String note);

    /**
     * �޸��˻�����
     *
     * @param cardID
     * @param newPassword
     * @return
     */
    String changePassword(long cardID, String newPassword);

    /**
     * ɾ������˻���������
     *
     * @param cardID ���п���
     * @return
     */
    String deleteAccount(long cardID);

    /**
     * �˻�����һ���˻�ת��
     * ����1��TR
     *
     * @param SourceID
     * @param money
     * @param destinationID
     * @return ת�˽��
     */
    String transferAccount(long SourceID, double money, long destinationID);

    /**
     * @param cardID ���п���
     * @return
     */
    BankCard getBankCard(long cardID);

    /**
     * @param uID �û�id
     * @return �õ��û��������˻�
     */
    List<BankCard> getAllBankCards(long uID);
}
