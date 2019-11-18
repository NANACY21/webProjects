package vo.card;

/**
 * 银行卡
 * 1张银行卡 - 1个账户
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
     * 无参构造器初始化成员变量
     */
    public BankCard() {
    }
}
