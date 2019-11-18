package vo.insProduct;

/**
 * 保险产品
 * 不可修改的值对象
 */
public abstract class InsProduct {

    /**
     * 号
     */
    private long ID;
    /**
     * 保险产品名称
     */
    private String name;
    /**
     * 保险公司名称（哪个保险公司的保险产品）
     * 该保险公司与该银行合作
     */
    private String InsCompanyName;
    /**
     * 总保（险）费
     * 需要向保险公司缴纳的总费用
     */
    private long TotalPremium;
    /**
     * 保险产品详情
     * 主要描述其余字段以外的信息
     * <p>
     * 把本字段拆分成几个有意义的成员变量，有利于显示保险产品详情（但是这会字段冗余）
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
