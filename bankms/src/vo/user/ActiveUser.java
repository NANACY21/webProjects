package vo.user;

import java.util.Vector;

/**
 * ��ǰ��¼����
 * ������db
 */
public class ActiveUser {

    private long uID;//�û�id
    private String nickname;//��¼�ɹ��ߵ��û������ǳƣ�
    private Vector<String> allCardID;//Ҳ�п��ܸ��û�û���˻�����¼�ɹ��ߵ��˻���ID�ļ���

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
