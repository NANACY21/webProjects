package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import model.impl.BankCardServiceImpl;

/**
 * 账户激活
 */
@WebServlet(name = "AccountActivationServlet", urlPatterns = "/accountActivationServlet")
public class AccountActivationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Jsp = request.getParameter("Jsp");//账户激活成功后跳到哪里，返回一个.jsp
        String cardID = request.getParameter("cardID");
        String userName = request.getParameter("userName");
        String initialPassword = request.getParameter("initialPassword");
        String password_st = request.getParameter("password_st");
//        String password_nd = request.getParameter("password_nd");
        BankCardServiceImpl bcsi = new BankCardServiceImpl();
        String s = bcsi.accountActivation(Long.parseLong(cardID), initialPassword, password_st);
        PrintWriter out = response.getWriter();
        out.print("<script>alert('" + s + "');window.location.href='" + Jsp + "'</script>");
        out.close();
        return;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);//一般这么写
    }
}
