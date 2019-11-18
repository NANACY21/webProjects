package vo.loan;

import java.util.Date;

//loanID,userID,loanType,amount,createTime,endTime,cardID,state,comment
public class Loan {

    private long loanID;  //�����
    private long userID;  //���֤��
    private int loanType;   //��������
    private double amount;  //������
    private Date createTime; //������ʼʱ��
    private int loanTime;  //����ʱ��
    private Date returnTime; //����黹ʱ��
    private long cardID; //���п���
    private int state; //����״̬  ��ȡ���������С������С��ѳ���
    private String comment;  //��ע

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

