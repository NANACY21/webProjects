package model;

import vo.user.NUser;

public interface NUserService {

    /**
     * 普通用户登录
     *
     * @param user
     * @return
     */
    public String login(NUser user);

    /**
     * 注册以成为普通用户
     *
     * @param user
     * @return
     */
    public String register(NUser user);

    /**
     * 退出登录 清空session
     *
     * @return
     */
    public String logout();

    public String changePassword(NUser user, String newPassword);

    /**
     * 通过用户id查找用户
     *
     * @param uID
     * @return
     */
    public NUser getNUserByuID(long uID);

    /**
     * 通过昵称查找用户
     *
     * @param nickname
     * @return
     */
    public NUser getNUserByNickname(String nickname);

    /**
     * 通过身份证号查找用户
     *
     * @param ID
     * @return
     */
    public NUser getNUserByID(long ID);

    /**
     * 编辑个人信息
     *
     * @param nUser
     * @return
     */
    public String updateNUser(NUser nUser);
}