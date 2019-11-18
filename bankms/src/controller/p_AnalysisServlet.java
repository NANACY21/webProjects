package controller;


import model.impl.AnalysisModel;
import model.impl.BankCardServiceImpl;
import vo.card.BankCard;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "p_AnalysisServlet", urlPatterns = "/p_AnalysisServlet")
public class p_AnalysisServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AnalysisModel analysisModel = new AnalysisModel();

        BankCardServiceImpl service = new BankCardServiceImpl();
        long uID;
        if (request.getSession().getAttribute("uID") != null) {
            uID = Long.parseLong(request.getSession().getAttribute("uID").toString());
        } else {
            uID = 9L;
        }
        List<BankCard> allBc = service.getAllBankCards(uID);
        Long cardID = allBc.get(0).getID();
        request.setAttribute("analysis", analysisModel.getAnlysis(cardID));
        request.getRequestDispatcher("p_Analysis.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
