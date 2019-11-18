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
 * �쿨���˻�ע�ᣩ
 * ��û�û�ע�����ܰ쿨
 * <p>
 * �쿨�ɹ���Ӧ���Զ���ʾ�˻�����
 */
@WebServlet(name = "HandleCardServlet", urlPatterns = "/HandleCardServlet")
public class HandleCardServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userID = req.getParameter("userID");//UI���ṩ�����֤��
        String userName = req.getParameter("userName");//UI���ṩ����ʵ����
        String Jsp = req.getParameter("Jsp");//�쿨�ɹ��������ĸ�jsp
        BankCardServiceImpl bcs = new BankCardServiceImpl();
        String s = bcs.addBankCard(Long.parseLong(userID), userName);
        PrintWriter out = resp.getWriter();
        if (s.indexOf("��Ҫ���û�ע��") != -1) {
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
