package vo;

/**
 * һ�����п��Ľ��׼�¼
 * ����bankms��
 * ��ֻ����΢�Ŷ�ά��֧��
 * ��ȡ���
 * ת�ˣ��˻�֮��ת��
 * <p>
 * <p>
 * ԭ���뷨��3�ű���������ȡ���->mysql��tmtr���ɾ��
 * ת�˽��׼�¼��tatr��
 * �����루����õ��Ĵ���Ľ��׼�¼��smtr��
 * ȡ�֧��������ɷѣ��Ľ��׼�¼��tmtr��Ȼ���ⲻ��mysql�ķֱ�˼�룬�������һ�ű���
 * ����ȡ��ܱ�֤������Ŀ���˻���Ϣ������֮smtr������ȱʧ�ģ���һ�����׼�¼��������Ǯ��Դ���գ���smtr��������
 * <p>
 * <p>
 * get set����ֻ���ǲ������ࣨ��������ͨ�໹�ǳ����ࣩ��д�ĳ�Ա����
 */
public class TR {

    private long ID;//Ψһ��ʶ ��ˮ��
    private String time;//����ʱ��
    private long SourceID;//Դ�˻�ID
    private double money;//���׽��
    private long destinationID;//Ŀ���˻�ID
    /**
     * �ý��׼�¼�ı�ע
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
