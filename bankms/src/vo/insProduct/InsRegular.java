package vo.insProduct;

/**
 * �ڽ����ղ�Ʒ
 * ��һ���Թ���
 * ÿ�꽻һ�α��ѣ�5���ڽ���һ�꽻һ�Σ���5�꣩
 */
public class InsRegular extends InsProduct {

    /**
     * ��Ҫ���ɱ��մ������������ޣ�f�꣩
     */
    private int f;
    /**
     * 0->ÿ��һ����1->ÿ��һ��
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
