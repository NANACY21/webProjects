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
 * Ϊ�˵õ�ĳһ�����п��Ľ��׼�¼
 * <p>
 * ԭ��ms���߼���
 * cardID��Դ�˻�-����ȡת
 * cardID��Ŀ���˻�->����ת��...ԪǮ
 */
@WebServlet(name = "AccountTRServlet", urlPatterns = "/AccountTRServlet")
public class AccountTRServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String condition = request.getParameter("condition").toString();
        String cardID = session.getAttribute("cardID").toString();

        TRServiceImpl trService = new TRServiceImpl();
        //�õ�cardID�˻������п����׼�¼
        List<TR> allTR = trService.getTR(Long.parseLong(cardID), Long.parseLong(condition));
        //ĳһ�����п��Ľ��׼�¼
        session.setAttribute("allTR", allTR);
        request.getRequestDispatcher("TR.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
