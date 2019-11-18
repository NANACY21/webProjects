package controller;
import model.impl.LoanModel;
import vo.loan.Loan;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "p_applyLoanServlet", urlPatterns = "/p_applyLoanServlet")
public class p_applyLoanServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userName = request.getParameter("userName");
        String userID = request.getParameter("userID");
        String amount = request.getParameter("amount");
        String cardID = request.getParameter("cardID");
        String loanTime = request.getParameter("loanTime");

        Loan ln = new Loan();
        ln.setLoanID(Long.parseLong(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())));
        ln.setUserID(Long.parseLong(userID));
        ln.setAmount(Double.parseDouble(amount));
        ln.setCardID(Long.parseLong(cardID));
        ln.setLoanTime(Integer.parseInt(loanTime));
        int loanType;
        if (ln.getLoanTime() <= 12) {
            loanType = 1;
        } else if (ln.getLoanTime() <= 60) {
            loanType = 2;
        } else {
            loanType = 3;
        }
        ln.setLoanType(loanType);
        ln.setState(1);
        //System.out.println(ln.toString());

        LoanModel l = new LoanModel();

        PrintWriter out = response.getWriter();
        if ("ÎÞÎ´»¹´û¿î".equals(l.hasUnfinished(ln.getUserID()))) {
            out.print("<script>alert('" + l.applyLoan(ln) + "');window.location.href='p_myLoanServlet'</script>");
        } else {
            out.print("<script>alert('" + l.hasUnfinished(ln.getUserID()) + "');window.location.href='p_myLoanServlet'</script>");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
