package vo;

/**
 * 无需注册保险账户
 * 保（险）单
 * 保单中还要显示保险详情（虽然没有该成员变量）
 */
public class InsPolicy {

    /**
     * 保单号 唯一标识
     */
    private long ID;
    /**
     * 投保人姓名
     * 投保人是保单持有者 交保费的人
     * 投保人必须是银行用户，且有账户
     */
    private String PolicyHolderName;


    /**
     * 投保人身份证号
     */
    private long PolicyHolderID;
    /**
     * 受保人姓名
     */
    private String insuredName;

    /**
     * 受保人身份证号（一定是真实的身份证号，从中可得到受保人生日）
     */
    private long insuredID;

    /**
     * 受益人姓名
     * 保险金受领人
     */
    private String BeneficiaryName;

    /**
     * 受益人身份证号
     */
    private long BeneficiaryID;
    /**
     * 投保日期（首次交钱日期）
     * ->保险生效日期
     * 即大致为该保单诞生日
     */
    private String InsureDate;

    /**
     * 付款账号
     */
    private long payCardID;

    /**
     * 保险产品ID
     * ->保险公司名称（即->保险人）
     * 也可以->保险产品详情
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
