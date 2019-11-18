package vo.insProduct;

/**
 * ���ղ�Ʒ
 * �����޸ĵ�ֵ����
 */
public abstract class InsProduct {

    /**
     * ��
     */
    private long ID;
    /**
     * ���ղ�Ʒ����
     */
    private String name;
    /**
     * ���չ�˾���ƣ��ĸ����չ�˾�ı��ղ�Ʒ��
     * �ñ��չ�˾������к���
     */
    private String InsCompanyName;
    /**
     * �ܱ����գ���
     * ��Ҫ���չ�˾���ɵ��ܷ���
     */
    private long TotalPremium;
    /**
     * ���ղ�Ʒ����
     * ��Ҫ���������ֶ��������Ϣ
     * <p>
     * �ѱ��ֶβ�ֳɼ���������ĳ�Ա��������������ʾ���ղ�Ʒ���飨��������ֶ����ࣩ
     */
    private String detail;

    public InsProduct(long id, String name, String insCompanyName, long totalPremium, String detail) {
        this.ID = id;
        this.name = name;
        InsCompanyName = insCompanyName;
        TotalPremium = totalPremium;
        this.detail = detail;
    }

    public long getID() {
        return ID;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInsCompanyName() {
        return InsCompanyName;
    }

    public void setInsCompanyName(String insCompanyName) {
        InsCompanyName = insCompanyName;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public long getTotalPremium() {
        return TotalPremium;
    }

    public void setTotalPremium(long totalPremium) {
        TotalPremium = totalPremium;
    }

    @Override
    public String toString() {
        return "InsProduct{" +
                "ID=" + ID +
                ", name='" + name + '\'' +
                ", InsCompanyName='" + InsCompanyName + '\'' +
                ", TotalPremium=" + TotalPremium +
                ", detail='" + detail + '\'' +
                '}';
    }
}
