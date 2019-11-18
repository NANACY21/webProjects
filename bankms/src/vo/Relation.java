package vo;

/**
 * 好友关系
 */
public class Relation {

    private long uID1;
    private long uID0;

    /**
     * 新增一个关系
     *
     * @param uID1
     * @param uID0
     */
    public Relation(long uID1, long uID0) {
        this.uID1 = uID1;
        this.uID0 = uID0;
    }

    public Relation() {
    }

    public long getuID1() {
        return uID1;
    }

    public void setuID1(long uID1) {
        this.uID1 = uID1;
    }

    public long getuID0() {
        return uID0;
    }

    public void setuID0(long uID0) {
        this.uID0 = uID0;
    }
}
