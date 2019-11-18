package vo.card;

/**
 * ��
 */
public abstract class Card {

    /**
     * ���п��ţ��˺ţ���Ψһ��ʶ��
     */
    private long ID;
    /**
     * ������
     * ��Card���󱻴������������ɿ�����
     */
    private String password;
    /**
     * �����
     */
    private double money;
    /*
    ��״̬
    0->δ���1->�Ѽ��2->�ѹ�ʧ�����Ѽ����3->�ѹ�ʧ����δ���
     */
    private int state;
    /**
     * �����ߵ�uID
     * �����߿��Լ��������˻���������ʾ�Լ������֤�ţ��ʳ��������֤�Ų������п���ĳ�Ա����
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
