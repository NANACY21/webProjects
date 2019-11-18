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
        String money = request.getParameter("money");//转账金额
        String destinationID = request.getParameter("destinationID");//目标账号
        String cardID = request.getParameter("cardID");//目标账号

        BankCardServiceImpl service = new BankCardServiceImpl();
        String s = service.transferAccount(Long.parseLong(cardID), Double.parseDouble(money), Long.parseLong(destinationID));

        PrintWriter out = response.getWriter();
        //这两行重要
        String Jsp = request.getParameter("Jsp");//账户激活成功后跳到哪里
        out.print("<script>alert('" + s + "');window.location.href='" + Jsp + "'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
