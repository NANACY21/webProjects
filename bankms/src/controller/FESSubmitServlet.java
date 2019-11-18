package controller;

import model.impl.RateServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * ȷ�����
 */
@WebServlet(name = "FESSubmitServlet", urlPatterns = "/FESSubmitServlet")
public class FESSubmitServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String money = request.getParameter("money");//���100��Ԫ ֵ��100
        String foreign = request.getParameter("foreign");//�����
        String cardID = request.getParameter("cardID");//��Ҵ������ſ�


        RateServiceImpl service = new RateServiceImpl();
        String fep = service.FES(Long.parseLong(cardID), Double.parseDouble(money), foreign);
        PrintWriter out = response.getWriter();//
        out.print("<script>alert('" + fep + "');window.location.href='FESandFEP.jsp'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
