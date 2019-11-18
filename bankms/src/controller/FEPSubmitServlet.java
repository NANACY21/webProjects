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
 * È·¶¨¹º»ã
 */
@WebServlet(name = "FEPSubmitServlet", urlPatterns = "/FEPSubmitServlet")
public class FEPSubmitServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String money = request.getParameter("money");
        String foreign = request.getParameter("foreign");
        String cardID = request.getParameter("cardID");


        RateServiceImpl service = new RateServiceImpl();
        String fep = service.FEP(Long.parseLong(cardID), Double.parseDouble(money), foreign);
        PrintWriter out = response.getWriter();//
        out.print("<script>alert('" + fep + "');window.location.href='FESandFEP.jsp'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
