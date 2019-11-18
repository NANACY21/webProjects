package vo;

/**
 * 一张银行卡的交易记录
 * 关于bankms：
 * 存款：只能是微信二维码支付
 * 无取款功能
 * 转账：账户之间转账
 * <p>
 * <p>
 * 原来想法：3张表（但现在无取款功能->mysql的tmtr表可删）
 * 转账交易记录放tatr表
 * 存款、收入（比如得到的贷款）的交易记录放smtr表，
 * 取款、支出（比如缴费）的交易记录放tmtr表。然而这不是mysql的分表思想，还不如就一张表了
 * 但存取款不能保证不会有目标账户信息，换言之smtr表是有缺失的，即一条交易记录须描述金钱的源和终，而smtr不能描述
 * <p>
 * <p>
 * get set方法只能是操作本类（无论是普通类还是抽象类）中写的成员变量
 */
public class TR {

    private long ID;//唯一标识 流水号
    private String time;//交易时间
    private long SourceID;//源账户ID
    private double money;//交易金额
    private long destinationID;//目标账户ID
    /**
     * 该交易记录的备注
     */
    private String note;

    public TR(String time, long sourceID, double money, long destinationID, String note) {
        this.time = time;
        this.SourceID = sourceID;
        this.money = money;
        this.destinationID = destinationID;
        this.note = note;
    }

    public long getID() {
        return ID;
    }

    public String getTime() {
        return time;
    }

    public long getSourceID() {
        return SourceID;
    }

    public double getMoney() {
        return money;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public void setSourceID(long sourceID) {
        SourceID = sourceID;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public long getDestinationID() {
        return destinationID;
    }

    public void setDestinationID(long destinationID) {
        this.destinationID = destinationID;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
