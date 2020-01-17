package controller;


import model.impl.LoanModel;
import model.impl.NUserServiceImpl;
import vo.user.NUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "p_myLoanServlet", urlPatterns = "/p_myLoanServlet")
public class p_myLoanServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoanModel loanModel = new LoanModel();
        String uID = (String) request.getSession().getAttribute("uID").toString();
        NUser nUser = new NUser();
        NUserServiceImpl nUserService = new NUserServiceImpl();
        long id = nUserService.getNUserByuID(Long.parseLong(uID)).getID();
//        Long userID = 123456789123456789L;
        if (request.getAttribute("loans") != null) {
            request.removeAttribute("loans");
        }
        request.setAttribute("loans", loanModel.getAllLoans(id));
        request.getRequestDispatcher("p_myLoan.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
