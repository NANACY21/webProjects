package controller;



import model.impl.LoanModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "p_returnLoanServlet", urlPatterns = "/p_returnLoanServlet")
public class p_returnLoanServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ID = request.getParameter("loanID");
        String cID = request.getParameter("cardID");
        String am = request.getParameter("allAmount");
        Long loanID = Long.parseLong(ID);
        Long cardId = Long.parseLong(cID);
        double allAmount = Double.parseDouble(am);
        LoanModel loanModel = new LoanModel();
        PrintWriter out = response.getWriter();
        out.print("<script>alert('" + loanModel.returnLoan(loanID, cardId, allAmount) + "');window.location.href='p_myLoanServlet'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
