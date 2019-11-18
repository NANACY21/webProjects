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
 * 账户登录
 */
@WebServlet(name = "AccountLoginServlet", urlPatterns = "/AccountLoginServlet")
public class AccountLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cardID = req.getParameter("cardID").toString();//账户号
        String password = req.getParameter("password").toString();//账户密码
        BankCardServiceImpl service = new BankCardServiceImpl();
        String login = service.accountLogin(Long.parseLong(cardID), password);

        if ("账户登录成功".equals(login)) {
            req.getSession().setAttribute("cardID", cardID);
            resp.sendRedirect("account.jsp");//跳转到个人账户管理的页面
        } else {
            PrintWriter out = resp.getWriter();
            out.print("<script>alert('" + login + "');window.location.href='main.jsp'</script>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
