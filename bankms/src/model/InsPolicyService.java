package model;

import vo.InsPolicy;

import java.util.List;
import java.util.Vector;

public interface InsPolicyService {

    /**
     * ��ӱ���
     *
     * @param ip
     * @return
     */
    public String addInsPolicy(InsPolicy ip);

    /**
     * �õ����б���
     *
     * @param ID ���֤��
     * @return
     */
    public Vector<InsPolicy> getAllInsPolicy(long ID);
}
