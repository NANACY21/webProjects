package controller;


import model.impl.LoanModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "m_showUnApproveServlet", urlPatterns = "/m_showUnApproveServlet")
public class m_showUnApproveServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoanModel loanModel = new LoanModel();
        request.setAttribute("loans", loanModel.getLoansByState(1));
        request.getRequestDispatcher("m_unApproveLoan.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
