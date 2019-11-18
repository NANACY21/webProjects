package vo.loan;

import java.util.Date;

//loanID,userID,loanType,amount,createTime,endTime,cardID,state,comment
public class Loan {

    private long loanID;  //贷款号
    private long userID;  //身份证号
    private int loanType;   //贷款类型
    private double amount;  //贷款金额
    private Date createTime; //贷款起始时间
    private int loanTime;  //贷款时长
    private Date returnTime; //贷款归还时间
    private long cardID; //银行卡号
    private int state; //贷款状态  已取消、申请中、贷款中、已偿还
    private String comment;  //备注

    public long getLoanID() {
        return loanID;
    }

    public void setLoanID(long loanID) {
        this.loanID = loanID;
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public int getLoanType() {
        return loanType;
    }

    public void setLoanType(int loanType) {
        this.loanType = loanType;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getLoanTime() {
        return loanTime;
    }

    public void setLoanTime(int loanTime) {
        this.loanTime = loanTime;
    }

    public Date getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(Date returnTime) {
        this.returnTime = returnTime;
    }

    public long getCardID() {
        return cardID;
    }

    public void setCardID(long cardID) {
        this.cardID = cardID;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Loan{" +
                "loanID=" + loanID +
                ", userID=" + userID +
                ", loanType=" + loanType +
                ", amount=" + amount +
                ", createTime=" + createTime +
                ", loanTime=" + loanTime +
                ", returnTime=" + returnTime +
                ", cardID=" + cardID +
                ", state=" + state +
                ", comment='" + comment + '\'' +
                '}';
    }
}

