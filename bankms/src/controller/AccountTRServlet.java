package controller;

import model.impl.TRServiceImpl;
import vo.TR;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * 为了得到某一张银行卡的交易记录
 * <p>
 * 原来ms的逻辑：
 * cardID是源账户-》存取转
 * cardID是目的账户->给我转账...元钱
 */
@WebServlet(name = "AccountTRServlet", urlPatterns = "/AccountTRServlet")
public class AccountTRServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String condition = request.getParameter("condition").toString();
        String cardID = session.getAttribute("cardID").toString();

        TRServiceImpl trService = new TRServiceImpl();
        //得到cardID账户的银行卡交易记录
        List<TR> allTR = trService.getTR(Long.parseLong(cardID), Long.parseLong(condition));
        //某一张银行卡的交易记录
        session.setAttribute("allTR", allTR);
        request.getRequestDispatcher("TR.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
