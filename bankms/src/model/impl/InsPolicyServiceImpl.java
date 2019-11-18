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
        if ("插入成功".equals(info)) {
            return "购买保险成功";
        }
        return "购买保险失败";
    }

    @Override
    public Vector<InsPolicy> getAllInsPolicy(long ID) {
        InsPolicyDaoImpl dao = new InsPolicyDaoImpl();
        return dao.getAllInsPolicy(ID);
    }
}
