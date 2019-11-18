package controller;

import model.impl.BankCardServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SaveMoneyServlet", urlPatterns = "/SaveMoneyServlet")
public class SaveMoneyServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String money = request.getParameter("money");

        String cardID = (String) request.getSession().getAttribute("cardID").toString();
        if (cardID.equals(request.getParameter("cardID").toString())) {
            BankCardServiceImpl service = new BankCardServiceImpl();
            String s = service.saveMoney(Long.parseLong(cardID), Double.parseDouble(money), "普通微信支付存款");

            PrintWriter out = response.getWriter();
            //这两行重要
            String Jsp = request.getParameter("Jsp");//账户激活成功后跳到哪里
            out.print("<script>alert('" + s + "');window.location.href='" + Jsp + "'</script>");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
