package vo.card;

/**
 * ���п�
 * 1�����п� - 1���˻�
 */
public class BankCard extends Card {

    public BankCard(long uID) {
        super(uID);
    }

    @Override
    public String toString() {
        return "BankCard{}";
    }

    /**
     * �޲ι�������ʼ����Ա����
     */
    public BankCard() {
    }
}
