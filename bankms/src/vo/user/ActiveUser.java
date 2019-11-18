package vo.user;

import java.util.Vector;

/**
 * 当前登录的人
 * 不存在db
 */
public class ActiveUser {

    private long uID;//用户id
    private String nickname;//登录成功者的用户名（昵称）
    private Vector<String> allCardID;//也有可能该用户没有账户，登录成功者的账户的ID的集合

    public ActiveUser(long uID, String nickname) {
        this.uID = uID;
        this.nickname = nickname;
        this.allCardID = new Vector<>();
    }

    public long getuID() {
        return uID;
    }

    public void setuID(long uID) {
        this.uID = uID;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Vector<String> getAllCardID() {
        return allCardID;
    }

    public void setAllCardID(Vector<String> allCardID) {
        this.allCardID = allCardID;
    }
}
