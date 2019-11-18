package controller;

import model.impl.BankCardServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LifePayServlet", urlPatterns = "/LifePayServlet")
public class LifePayServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phoneMoney = request.getParameter("phoneMoney");//����Щ����
        String cardID = request.getParameter("cardID").toString();//֧���˻�

        BankCardServiceImpl service = new BankCardServiceImpl();
        String s = service.takeMoney(Long.parseLong(cardID), Double.parseDouble(phoneMoney), "����ɷ�");
        PrintWriter out = response.getWriter();
        out.print("<script>alert('" + s + "');window.location.href='lifePay.jsp'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
