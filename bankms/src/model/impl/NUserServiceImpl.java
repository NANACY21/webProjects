package model.impl;

import java.util.List;
import dao.IDao;
import dao.impl.NUserDaoImpl;
import model.NUserService;
import vo.user.NUser;

public class NUserServiceImpl implements NUserService {

    private IDao dao;//�ò�������dao�㣬Ϊ����ĳ�Ա����

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
     * @param ID ���֤��
     * @return
     */
    @Override
    public NUser getNUserByID(long ID) {
        NUserDaoImpl dao = new NUserDaoImpl();//�ò�������dao�㣬Ϊ����ĳ�Ա����
        return dao.getNUserByID(ID);
    }

    @Override
    public String updateNUser(NUser nUser) {
        String update = dao.update(nUser);
        if ("���³ɹ�".equals(update)) {
            return "�޸ĸ�����Ϣ�ɹ�";
        } else {
            return "�޸ĸ�����Ϣʧ�ܣ����ĸ�����Ϣδ�޸�";
        }
    }

    public String login(NUser user) {//�βζ�����Ч
        List users = dao.findAll();
        if (users.size() != 0) {
            for (Object obj : users) {
                NUser u = (NUser) obj;
                if (u.getNickname().equals(user.getNickname())) {
                    if (u.getPassword().equals(user.getPassword())) {
                        user.setName(u.getName());//�԰����ô��ݵ��β�userset
                        user.setuID(u.getuID());
                        return "";
                    } else {
                        return "�������";
                    }
                }
            }
        }
        return "�û�������";
    }

    /**
     * ��ͨ�û�ע��
     * û���˻�Ҳ����ע�᣻ע����̲���Ҫ�ṩ���п���
     * <p>
     * ϵͳ�Զ�����û�����ȡ���Զ���ӣ�
     *
     * @param user
     * @return
     */
    public String register(NUser user) {
        List users = dao.findAll();
        for (Object obj : users) {
            NUser u = (NUser) obj;
            if (user.getID() == u.getID() || user.getNickname().equals(u.getName())) {
                return "�û������ظ�ע�ᡣ���ǳ��Ѿ�����ʹ����";
            }
        }
        //�û�������,�����¼
        String add = dao.insert(user);
        if ("����ɹ�".equals(add)) {
            return "ע��ɹ�";
        }
        return "ע��ʧ��";
    }

    @Override
    public String logout() {
        return null;
    }


}
