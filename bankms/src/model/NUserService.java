package model;

import vo.user.NUser;

public interface NUserService {

    /**
     * ��ͨ�û���¼
     *
     * @param user
     * @return
     */
    public String login(NUser user);

    /**
     * ע���Գ�Ϊ��ͨ�û�
     *
     * @param user
     * @return
     */
    public String register(NUser user);

    /**
     * �˳���¼ ���session
     *
     * @return
     */
    public String logout();

    public String changePassword(NUser user, String newPassword);

    /**
     * ͨ���û�id�����û�
     *
     * @param uID
     * @return
     */
    public NUser getNUserByuID(long uID);

    /**
     * ͨ���ǳƲ����û�
     *
     * @param nickname
     * @return
     */
    public NUser getNUserByNickname(String nickname);

    /**
     * ͨ�����֤�Ų����û�
     *
     * @param ID
     * @return
     */
    public NUser getNUserByID(long ID);

    /**
     * �༭������Ϣ
     *
     * @param nUser
     * @return
     */
    public String updateNUser(NUser nUser);
}