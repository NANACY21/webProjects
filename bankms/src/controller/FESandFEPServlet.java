package controller;

import model.impl.RateServiceImpl;
import model.impl.TRServiceImpl;
import vo.Rate;
import vo.TR;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * 结汇和购汇的预处理
 */
@WebServlet(name = "FESandFEPServlet", urlPatterns = "/FESandFEPServlet")
public class FESandFEPServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String target = request.getParameter("target");
        RateServiceImpl service = new RateServiceImpl();
        //得到rate表所有数据
        ArrayList<Rate> allRate = service.getAllRate();
        TRServiceImpl service1 = new TRServiceImpl();
        String cardID = request.getSession().getAttribute("cardID").toString();
        ArrayList<TR> FFTR = service1.getFFTR(Long.parseLong(cardID));
        request.getSession().setAttribute("allRate", allRate);
        request.getSession().setAttribute("FFTR", FFTR);
        request.getRequestDispatcher("FESandFEP.jsp?#" + target).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
