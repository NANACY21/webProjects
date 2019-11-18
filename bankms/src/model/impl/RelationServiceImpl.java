package model.impl;

import java.util.ArrayList;
import java.util.List;
import dao.impl.NUserDaoImpl;
import dao.impl.RelationDaoImpl;
import model.RelationService;
import vo.Relation;
import vo.user.NUser;

public class RelationServiceImpl implements RelationService {

    private RelationDaoImpl dao;

    public RelationServiceImpl() {
        this.dao = new RelationDaoImpl();
    }

    public String addFriend(Relation r) {
        String info = dao.insert(r);
        if ("����ɹ�".equals(info)) {
            return "��Ӻ��ѳɹ�";
        }
        return "";
    }

    public String deleteFriends(long myUID, long[] uIDs) {
        int flag = 0;
        for (int i = 0; i < uIDs.length; i++) {
            String info = dao.delete(myUID, uIDs[i]);
            if (!"ɾ���ɹ�".equals(info)) {
                flag = 1;
            }
        }
        if (flag == 0) {

            return "ɾ�����ѳɹ���";
        }
        return "";
    }

    public List<NUser> listAllFriends(long uID) {
        List<NUser> result = new ArrayList<>();
        List<Long> friends = dao.findAll(uID);
        //friends.stream().forEach(System.out::println);
        NUserDaoImpl dao1 = new NUserDaoImpl();
        List all = dao1.findAll();

        for (int i = 0; i < all.size(); i++) {
            NUser nuser = (NUser) all.get(i);
            if (friends.contains(nuser.getuID())) {
                result.add(nuser);

            }
        }
        return result;
    }

    public List<NUser> listAppointFriends(long uID, String surname) {
        NUserDaoImpl dao1 = new NUserDaoImpl();
        List<NUser> result = dao1.findBySurname(uID, surname);
        return result;
    }
}