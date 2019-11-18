package vo.insProduct;

/**
 * 期交保险产品
 * 非一次性购买
 * 每年交一次保费（5年期交：一年交一次，交5年）
 */
public class InsRegular extends InsProduct {

    /**
     * 需要缴纳保险次数（交费期限：f年）
     */
    private int f;
    /**
     * 0->每年一交，1->每月一交
     */
    private int flag;

    public InsRegular(long id, String name, String insCompanyName, long totalPremium, String detail, int f, int flag) {
        super(id, name, insCompanyName, totalPremium, detail);
        this.f = f;
        this.flag = flag;
    }

    public int getF() {
        return f;
    }

    public void setF(int f) {
        this.f = f;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return super.toString() + "InsRegular{" +
                "f=" + f +
                ", flag=" + flag +
                '}';
    }
}
