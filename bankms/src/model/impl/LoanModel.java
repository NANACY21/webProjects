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
        if ("插入成功".equals(msg)) {
            return "申请成功";
        }
        return "申请失败";
    }

    //管理员审批
    public String approveLoan(long loanid, String comment) {

        LoanDao dao = new LoanDao();
        BankCardService bcs = new BankCardServiceImpl();
        Loan ln = (Loan) dao.getObjectsByLoanID(loanid);
        ln.setState(2);
        ln.setCreateTime(new Date());
        ln.setComment(comment);
        System.out.println(" model" + ln.getCardID() + " " + ln.getAmount());
        String msg = dao.update(ln);
        if ("更新成功".equals(msg)) {
            String msg1 = bcs.saveMoney(ln.getCardID(), ln.getAmount(), "贷款发放");
            if ("存款成功".equals(msg1)) {
                return "审批成功";
            }

        }
        return "审批失败";
    }

    //删除贷款记录
    public String deleteLoan(long loanid) {
        LoanDao dao = new LoanDao();
        Loan ln = (Loan) dao.getObjectsByLoanID(loanid);
        if (ln.getState() != 3 && ln.getState() != 0) {
            return "贷款未偿还，删除失败";
        }
        String msg = dao.delete(loanid);
        if ("删除成功".equals(msg)) {
            return "已删除";
        }
        return "删除失败";
    }

    // 偿还贷款
    public String returnLoan(long loanID, long cardID, double allAmount) {
        BankCardService bcs = new BankCardServiceImpl();
        LoanDao dao = new LoanDao();
        Loan ln = (Loan) dao.getObjectsByLoanID(loanID);
        if (ln == null) {
            return "空对象";
        }
        String msg = bcs.takeMoney(cardID, allAmount, "还贷");
        if ("取款成功".equals(msg)) {
            ln.setState(3);
            ln.setReturnTime(new Date());
            String msg1 = dao.update(ln);
            if ("更新成功".equals(msg1)) {
                return "还贷成功";
            }
        }
        if ("你的账户余额不足，取款失败".equals(msg)) {
            return "所选银行卡余额不足，无法还款！";
        }
        return "还贷失败";

    }

    public String cancelLoan(long loanID) {
        LoanDao dao = new LoanDao();
        Loan ln = (Loan) dao.getObjectsByLoanID(loanID);
        if (ln == null) {
            return "取消失败";
        }
        ln.setState(0);
        String msg = dao.update(ln);
        if ("更新成功".equals(msg)) {
            return "取消成功";
        }
        return "取消失败";
    }

    public String hasUnfinished(long userID) {
        LoanDao dao = new LoanDao();
//        eg. userID = 123456789123456789 and state = 2
        String command = "userID = " + userID + " and state = 2";
        int count = dao.getCount(command);
        if (count != 0) {
            return "当前已有贷款，请先还贷后方可贷款";
        }
        return "无未还贷款";
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
