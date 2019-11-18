package model.impl;


import dao.impl.LoanDao;
import model.BankCardService;
import model.impl.BankCardServiceImpl;
import vo.loan.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class LoanModel {

    public String applyLoan(Object obj) {
        LoanDao dao = new LoanDao();
        String msg = dao.add(obj);
        if ("����ɹ�".equals(msg)) {
            return "����ɹ�";
        }
        return "����ʧ��";
    }

    //����Ա����
    public String approveLoan(long loanid, String comment) {

        LoanDao dao = new LoanDao();
        BankCardService bcs = new BankCardServiceImpl();
        Loan ln = (Loan) dao.getObjectsByLoanID(loanid);
        ln.setState(2);
        ln.setCreateTime(new Date());
        ln.setComment(comment);
        System.out.println(" model" + ln.getCardID() + " " + ln.getAmount());
        String msg = dao.update(ln);
        if ("���³ɹ�".equals(msg)) {
            String msg1 = bcs.saveMoney(ln.getCardID(), ln.getAmount(), "�����");
            if ("���ɹ�".equals(msg1)) {
                return "�����ɹ�";
            }

        }
        return "����ʧ��";
    }

    //ɾ�������¼
    public String deleteLoan(long loanid) {
        LoanDao dao = new LoanDao();
        Loan ln = (Loan) dao.getObjectsByLoanID(loanid);
        if (ln.getState() != 3 && ln.getState() != 0) {
            return "����δ������ɾ��ʧ��";
        }
        String msg = dao.delete(loanid);
        if ("ɾ���ɹ�".equals(msg)) {
            return "��ɾ��";
        }
        return "ɾ��ʧ��";
    }

    // ��������
    public String returnLoan(long loanID, long cardID, double allAmount) {
        BankCardService bcs = new BankCardServiceImpl();
        LoanDao dao = new LoanDao();
        Loan ln = (Loan) dao.getObjectsByLoanID(loanID);
        if (ln == null) {
            return "�ն���";
        }
        String msg = bcs.takeMoney(cardID, allAmount, "����");
        if ("ȡ��ɹ�".equals(msg)) {
            ln.setState(3);
            ln.setReturnTime(new Date());
            String msg1 = dao.update(ln);
            if ("���³ɹ�".equals(msg1)) {
                return "�����ɹ�";
            }
        }
        if ("����˻����㣬ȡ��ʧ��".equals(msg)) {
            return "��ѡ���п����㣬�޷����";
        }
        return "����ʧ��";

    }

    public String cancelLoan(long loanID) {
        LoanDao dao = new LoanDao();
        Loan ln = (Loan) dao.getObjectsByLoanID(loanID);
        if (ln == null) {
            return "ȡ��ʧ��";
        }
        ln.setState(0);
        String msg = dao.update(ln);
        if ("���³ɹ�".equals(msg)) {
            return "ȡ���ɹ�";
        }
        return "ȡ��ʧ��";
    }

    public String hasUnfinished(long userID) {
        LoanDao dao = new LoanDao();
//        eg. userID = 123456789123456789 and state = 2
        String command = "userID = " + userID + " and state = 2";
        int count = dao.getCount(command);
        if (count != 0) {
            return "��ǰ���д�����Ȼ����󷽿ɴ���";
        }
        return "��δ������";
    }

    public List<Loan> getAllLoans(long userID) {
        List<Loan> result = new ArrayList<>();
        LoanDao dao = new LoanDao();
        List lns = dao.getObjectsByUserID(userID);
        for (Object obj : lns) {
            Loan ln = (Loan) obj;
            result.add(ln);
        }
        return result;
    }

    public List<Loan> getLoansByState(int state) {
        List<Loan> result = new ArrayList<>();
        LoanDao dao = new LoanDao();
        List lns = dao.getObjectsByState(state);
        for (Object obj : lns) {
            Loan ln = (Loan) obj;
            result.add(ln);
        }
        return result;
    }

    public Object getLoanByLoanID(long loanID) {
        LoanDao dao = new LoanDao();
        return dao.getObjectsByLoanID(loanID);
    }
}
