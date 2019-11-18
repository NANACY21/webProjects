package controller;

import model.impl.BankCardServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * ’Àªßπ“ ß
 */
@WebServlet(name = "AccountReportServlet", urlPatterns = "/AccountReportServlet")
public class AccountReportServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cardID = request.getParameter("cardID").toString();

        BankCardServiceImpl bcs = new BankCardServiceImpl();

        PrintWriter out = response.getWriter();
        String s = bcs.accountReport(Long.parseLong(cardID));
        out.print("<script>alert('" + s + "');window.location.href='login.jsp'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
