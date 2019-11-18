package controller;

import model.impl.BankCardServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "TransferAccountServlet", urlPatterns = "/TransferAccountServlet")
public class TransferAccountServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String money = request.getParameter("money");//ת�˽��
        String destinationID = request.getParameter("destinationID");//Ŀ���˺�
        String cardID = request.getParameter("cardID");//Ŀ���˺�

        BankCardServiceImpl service = new BankCardServiceImpl();
        String s = service.transferAccount(Long.parseLong(cardID), Double.parseDouble(money), Long.parseLong(destinationID));

        PrintWriter out = response.getWriter();
        //��������Ҫ
        String Jsp = request.getParameter("Jsp");//�˻�����ɹ�����������
        out.print("<script>alert('" + s + "');window.location.href='" + Jsp + "'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
