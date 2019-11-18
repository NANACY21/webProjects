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
 * 办卡（账户注册）
 * 还没用户注册则不能办卡
 * <p>
 * 办卡成功后应该自动提示账户激活
 */
@WebServlet(name = "HandleCardServlet", urlPatterns = "/HandleCardServlet")
public class HandleCardServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userID = req.getParameter("userID");//UI层提供的身份证号
        String userName = req.getParameter("userName");//UI层提供的真实姓名
        String Jsp = req.getParameter("Jsp");//办卡成功后跳到哪个jsp
        BankCardServiceImpl bcs = new BankCardServiceImpl();
        String s = bcs.addBankCard(Long.parseLong(userID), userName);
        PrintWriter out = resp.getWriter();
        if (s.indexOf("需要先用户注册") != -1) {
            out.print("<script>alert('" + s + "');window.location.href='register.jsp'</script>");
            return;
        }
        out.print("<script>alert('" + s + "');window.location.href='" + Jsp + "'</script>");
        return;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
