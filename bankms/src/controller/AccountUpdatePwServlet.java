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
 * �޸��˻�����
 */
@WebServlet(name = "AccountUpdatePwServlet", urlPatterns = "/AccountUpdatePwServlet")
public class AccountUpdatePwServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Jsp = request.getParameter("Jsp");//�˻�����ɹ�����������
        String cardID = request.getParameter("cardID");//�˻�����ɹ�����������
        String oldPw = request.getParameter("oldPw");
        String newPw = request.getParameter("newPw");
        BankCardServiceImpl bankCardService = new BankCardServiceImpl();
        PrintWriter out = response.getWriter();
        String s = bankCardService.changePassword(Long.parseLong(cardID), newPw);
        out.print("<script>alert('" + s + "');window.location.href='" + Jsp + "'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
