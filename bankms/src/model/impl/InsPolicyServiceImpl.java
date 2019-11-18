package model.impl;

import dao.IDao;
import dao.impl.InsPolicyDaoImpl;
import model.InsPolicyService;
import vo.InsPolicy;

import java.util.List;
import java.util.Vector;

public class InsPolicyServiceImpl implements InsPolicyService {

    private IDao dao;

    public InsPolicyServiceImpl() {
        this.dao = new InsPolicyDaoImpl();
    }

    @Override
    public String addInsPolicy(InsPolicy ip) {
        String info = dao.insert(ip);
        if ("����ɹ�".equals(info)) {
            return "�����ճɹ�";
        }
        return "������ʧ��";
    }

    @Override
    public Vector<InsPolicy> getAllInsPolicy(long ID) {
        InsPolicyDaoImpl dao = new InsPolicyDaoImpl();
        return dao.getAllInsPolicy(ID);
    }
}
