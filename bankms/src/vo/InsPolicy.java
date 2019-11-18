package vo;

/**
 * ����ע�ᱣ���˻�
 * �����գ���
 * �����л�Ҫ��ʾ�������飨��Ȼû�иó�Ա������
 */
public class InsPolicy {

    /**
     * ������ Ψһ��ʶ
     */
    private long ID;
    /**
     * Ͷ��������
     * Ͷ�����Ǳ��������� �����ѵ���
     * Ͷ���˱����������û��������˻�
     */
    private String PolicyHolderName;


    /**
     * Ͷ�������֤��
     */
    private long PolicyHolderID;
    /**
     * �ܱ�������
     */
    private String insuredName;

    /**
     * �ܱ������֤�ţ�һ������ʵ�����֤�ţ����пɵõ��ܱ������գ�
     */
    private long insuredID;

    /**
     * ����������
     * ���ս�������
     */
    private String BeneficiaryName;

    /**
     * ���������֤��
     */
    private long BeneficiaryID;
    /**
     * Ͷ�����ڣ��״ν�Ǯ���ڣ�
     * ->������Ч����
     * ������Ϊ�ñ���������
     */
    private String InsureDate;

    /**
     * �����˺�
     */
    private long payCardID;

    /**
     * ���ղ�ƷID
     * ->���չ�˾���ƣ���->�����ˣ�
     * Ҳ����->���ղ�Ʒ����
     */
    private long InsProductID;


    public long getID() {
        return ID;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public String getPolicyHolderName() {
        return PolicyHolderName;
    }

    public void setPolicyHolderName(String policyHolderName) {
        PolicyHolderName = policyHolderName;
    }

    public long getPolicyHolderID() {
        return PolicyHolderID;
    }

    public void setPolicyHolderID(long policyHolderID) {
        PolicyHolderID = policyHolderID;
    }

    public String getInsuredName() {
        return insuredName;
    }

    public void setInsuredName(String insuredName) {
        this.insuredName = insuredName;
    }

    public long getInsuredID() {
        return insuredID;
    }

    public void setInsuredID(long insuredID) {
        this.insuredID = insuredID;
    }

    public String getBeneficiaryName() {
        return BeneficiaryName;
    }

    public void setBeneficiaryName(String beneficiaryName) {
        BeneficiaryName = beneficiaryName;
    }

    public long getBeneficiaryID() {
        return BeneficiaryID;
    }

    public void setBeneficiaryID(long beneficiaryID) {
        BeneficiaryID = beneficiaryID;
    }

    public String getInsureDate() {
        return InsureDate;
    }

    public void setInsureDate(String insureDate) {
        InsureDate = insureDate;
    }

    public long getPayCardID() {
        return payCardID;
    }

    public void setPayCardID(long payCardID) {
        this.payCardID = payCardID;
    }

    public long getInsProductID() {
        return InsProductID;
    }

    public void setInsProductID(long insProductID) {
        InsProductID = insProductID;
    }

    @Override
    public String toString() {
        return "InsPolicy{" +
                "ID=" + ID +
                ", PolicyHolderName='" + PolicyHolderName + '\'' +
                ", PolicyHolderID=" + PolicyHolderID +
                ", insuredName='" + insuredName + '\'' +
                ", insuredID=" + insuredID +
                ", BeneficiaryName='" + BeneficiaryName + '\'' +
                ", BeneficiaryID=" + BeneficiaryID +
                ", InsureDate='" + InsureDate + '\'' +
                ", payCardID=" + payCardID +
                ", InsProductID=" + InsProductID +
                '}';
    }
}
