package model.impl;


import dao.IDao;
import dao.impl.InsRegularDaoImpl;
import model.InsRegularService;
import vo.insProduct.InsRegular;

import java.util.ArrayList;
import java.util.List;

public class InsRegularServiceImpl implements InsRegularService {

    private IDao dao;

    public InsRegularServiceImpl() {
        this.dao = new InsRegularDaoImpl();
    }

    @Override
    public List<InsRegular> getAllInsRegularProduct() {
        List<InsRegular> allirp = new ArrayList<>();//为了存储所有期交保险产品
        List irps = dao.findAll();
        for (Object obj : irps) {
            InsRegular irp = (InsRegular) obj;
            allirp.add(irp);
        }
        return allirp;
    }
}
