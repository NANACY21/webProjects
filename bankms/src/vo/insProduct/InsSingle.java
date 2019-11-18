package vo.insProduct;

/**
 * 趸交保险产品
 * 一次性缴纳保险（一次性缴纳总保费）
 */
public class InsSingle extends InsProduct {

    public InsSingle(long id, String name, String insCompanyName, long totalPremium, String detail) {
        super(id, name, insCompanyName, totalPremium, detail);
    }
}
