package model;

import vo.InsPolicy;

import java.util.List;
import java.util.Vector;

public interface InsPolicyService {

    /**
     * 添加保单
     *
     * @param ip
     * @return
     */
    public String addInsPolicy(InsPolicy ip);

    /**
     * 得到所有保单
     *
     * @param ID 身份证号
     * @return
     */
    public Vector<InsPolicy> getAllInsPolicy(long ID);
}
