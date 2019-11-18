package model.impl;
import dao.impl.LoanInfoDao;
import vo.loan.LoanInfo;

import java.util.ArrayList;
import java.util.List;

// 贷款发放/归还账户：1001200230034004

public class LoanInfoModel {

    public String addLoanInfo(Object obj) {
        return null;
    }

    public String deleteLoanInfo() {
        return null;
    }

    public double getRate(int loanType, boolean overtime) {

        LoanInfoDao dao = new LoanInfoDao();
        LoanInfo lnf = (LoanInfo) dao.getObjects(loanType);
        if (lnf == null) {
            return -1;  //获取失败；
        }
        if (overtime) {
            return lnf.getOverTimeRate();
        } else {
            return lnf.getRate();
        }
    }

    public List<LoanInfo> getAllLoanInfo() {
        List<LoanInfo> result = new ArrayList<>();
        LoanInfoDao dao = new LoanInfoDao();
        List lns = dao.getAllObjects();

        for (Object obj : lns) {
            LoanInfo ln = (LoanInfo) obj;
            result.add(ln);
        }
        return result;
    }
}
