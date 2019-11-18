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
 * �˻���¼
 */
@WebServlet(name = "AccountLoginServlet", urlPatterns = "/AccountLoginServlet")
public class AccountLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cardID = req.getParameter("cardID").toString();//�˻���
        String password = req.getParameter("password").toString();//�˻�����
        BankCardServiceImpl service = new BankCardServiceImpl();
        String login = service.accountLogin(Long.parseLong(cardID), password);

        if ("�˻���¼�ɹ�".equals(login)) {
            req.getSession().setAttribute("cardID", cardID);
            resp.sendRedirect("account.jsp");//��ת�������˻������ҳ��
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
