package vo.loan;

//loanType,loanName,loanMsg, rate1,rate2,rate3
public class LoanInfo {

    private int loanType;
    private String loanName;
    private String loanMsg;  //贷款介绍

    //年利率
    private double rate;
    private double overTimeRate;

    public int getLoanType() {
        return loanType;
    }

    public void setLoanType(int loanType) {
        this.loanType = loanType;
    }

    public String getLoanName() {
        return loanName;
    }

    public void setLoanName(String loanName) {
        this.loanName = loanName;
    }

    public String getLoanMsg() {
        return loanMsg;
    }

    public void setLoanMsg(String loanMsg) {
        this.loanMsg = loanMsg;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public double getOverTimeRate() {
        return overTimeRate;
    }

    public void setOverTimeRate(double overTimeRate) {
        this.overTimeRate = overTimeRate;
    }

    @Override
    public String toString() {
        return "LoanInfo{" +
                "loanType=" + loanType +
                ", loanName='" + loanName + '\'' +
                ", loanMsg='" + loanMsg + '\'' +
                ", rate=" + rate +
                ", overTimeRate=" + overTimeRate +
                '}';
    }
}
