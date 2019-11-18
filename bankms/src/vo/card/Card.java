package vo.card;

/**
 * 卡
 */
public abstract class Card {

    /**
     * 银行卡号（账号）（唯一标识）
     */
    private long ID;
    /**
     * 卡密码
     * 当Card对象被创建，立刻生成卡密码
     */
    private String password;
    /**
     * 卡余额
     */
    private double money;
    /*
    卡状态
    0->未激活，1->已激活，2->已挂失（卡已激活），3->已挂失（卡未激活）
     */
    private int state;
    /**
     * 持有者的uID
     * 持有者看自己的所有账户，不必显示自己的身份证号，故持有者身份证号不是银行卡类的成员变量
     */
    private long uID;

    public Card(long uID) {
        this.uID = uID;
        this.state = 0;
    }

    public Card() {
    }

    public long getID() {
        return ID;
    }

    public String getPassword() {
        return password;
    }

    public double getMoney() {
        return money;
    }

    public int getState() {
        return state;
    }

    public long getuID() {
        return uID;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Card{" +
                "ID=" + ID +
                ", password='" + password + '\'' +
                ", money=" + money +
                ", state=" + state +
                ", uID=" + uID +
                '}';
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public void setState(int state) {
        this.state = state;
    }

    public void setuID(long uID) {
        this.uID = uID;
    }
}
