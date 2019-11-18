package model.impl;

import java.util.List;
import dao.IDao;
import dao.impl.NUserDaoImpl;
import model.NUserService;
import vo.user.NUser;

public class NUserServiceImpl implements NUserService {

    private IDao dao;//该层依赖于dao层，为该类的成员变量

    public NUserServiceImpl() {
        this.dao = new NUserDaoImpl();
    }

    public String changePassword(NUser user, String newPassword) {
        return null;
    }

    @Override
    public NUser getNUserByuID(long uID) {
        NUser user = (NUser) dao.find(uID);
        return user;
    }

    @Override
    public NUser getNUserByNickname(String nickname) {
        return null;
    }

    /**
     * @param ID 身份证号
     * @return
     */
    @Override
    public NUser getNUserByID(long ID) {
        NUserDaoImpl dao = new NUserDaoImpl();//该层依赖于dao层，为该类的成员变量
        return dao.getNUserByID(ID);
    }

    @Override
    public String updateNUser(NUser nUser) {
        String update = dao.update(nUser);
        if ("更新成功".equals(update)) {
            return "修改个人信息成功";
        } else {
            return "修改个人信息失败，您的个人信息未修改";
        }
    }

    public String login(NUser user) {//形参对象有效
        List users = dao.findAll();
        if (users.size() != 0) {
            for (Object obj : users) {
                NUser u = (NUser) obj;
                if (u.getNickname().equals(user.getNickname())) {
                    if (u.getPassword().equals(user.getPassword())) {
                        user.setName(u.getName());//对按引用传递的形参userset
                        user.setuID(u.getuID());
                        return "";
                    } else {
                        return "密码错误";
                    }
                }
            }
        }
        return "用户名错误";
    }

    /**
     * 普通用户注册
     * 没有账户也可以注册；注册过程不需要提供银行卡号
     * <p>
     * 系统自动添加用户（已取消自动添加）
     *
     * @param user
     * @return
     */
    public String register(NUser user) {
        List users = dao.findAll();
        for (Object obj : users) {
            NUser u = (NUser) obj;
            if (user.getID() == u.getID() || user.getNickname().equals(u.getName())) {
                return "用户不可重复注册。该昵称已经有人使用了";
            }
        }
        //用户名可用,插入记录
        String add = dao.insert(user);
        if ("插入成功".equals(add)) {
            return "注册成功";
        }
        return "注册失败";
    }

    @Override
    public String logout() {
        return null;
    }


}
