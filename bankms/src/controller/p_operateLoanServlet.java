package controller;
import model.impl.LoanInfoModel;
import model.impl.LoanModel;
import vo.loan.Loan;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "p_operateLoanServlet", urlPatterns = "/p_operateLoanServlet")
public class p_operateLoanServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoanModel loanModel = new LoanModel();
        LoanInfoModel loanInfoModel = new LoanInfoModel();
        String ID = request.getParameter("loanID");
        String operate = request.getParameter("operate");
        String comment = " ";//request.getParameter("comment");
        long loanID = Long.parseLong(ID);
        Loan ln = (Loan) loanModel.getLoanByLoanID(loanID);
        //还贷
        if ("return".equals(operate)) {
            // loanID,amount,interest,overInterest
            double interest = 0, overInterest = 0;
            long day = (new Date().getTime() - ln.getCreateTime().getTime()) / 1000 / 60 / 60 / 24;
            double rate = loanInfoModel.getRate(ln.getLoanType(), false);
            if (day < ln.getLoanTime() * 30) {
                interest = day / 360.0 * rate * ln.getAmount();
            } else {
                double overrate = loanInfoModel.getRate(ln.getLoanType(), true);
                interest = (ln.getLoanTime() * 30) / 360.0 * rate * ln.getAmount();
                overInterest = (day - ln.getLoanTime()) / 360.0 * rate * ln.getAmount();
            }
            request.setAttribute("loanID", loanID);
            request.setAttribute("amount", ln.getAmount());
            request.setAttribute("interest", interest);
            request.setAttribute("overInterest", overInterest);
            request.getRequestDispatcher("p_returnLoan.jsp").forward(request, response);
        }
        //取消
        if ("cancel".equals(operate)) {
            String msg = loanModel.cancelLoan(loanID);
            request.setAttribute("loanOperateAlert", msg);
            request.getRequestDispatcher("p_myLoanServlet").forward(request, response);
        }
        //删除
        if ("delete".equals(operate)) {
            String msg = loanModel.deleteLoan(loanID);
            request.setAttribute("loanOperateAlert", msg);
            request.getRequestDispatcher("p_myLoanServlet").forward(request, response);
        }
        //批准
        if ("approve".equals(operate)) {
            System.out.println("APP");
            String msg = loanModel.approveLoan(loanID, comment);
            request.setAttribute("loanOperateAlert", msg);
            request.getRequestDispatcher("m_showUnApproveServlet").forward(request, response);
        }
        //拒绝
        if ("refuse".equals(operate)) {
            String msg = loanModel.cancelLoan(loanID);
            String msg1 = "";
            if ("取消成功".equals(msg)) {
                msg1 = "已拒绝";
            } else {
                msg1 = "拒绝失败";
            }
            request.setAttribute("loanOperateAlert", msg1);
            request.getRequestDispatcher("m_showUnApproveServlet").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
