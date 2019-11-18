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

@WebServlet(name = "TakeMoneyServlet", urlPatterns = "/TakeMoneyServlet")
public class TakeMoneyServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String money = request.getParameter("money");
        HttpSession session = request.getSession();
        String cardID = (String) session.getAttribute("cardID");

        BankCardServiceImpl service = new BankCardServiceImpl();
        String result = service.takeMoney(Long.parseLong(cardID), Double.parseDouble(money), "нч");

        PrintWriter out = response.getWriter();
        out.print("<script>alert('" + result + "');window.location.href='account.jsp'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
