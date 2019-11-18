package controller;
import model.InsPolicyService;
import model.impl.InsPolicyServiceImpl;
import model.impl.InsRegularServiceImpl;
import model.impl.NUserServiceImpl;
import vo.InsPolicy;
import vo.insProduct.InsRegular;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Vector;

/**
 * ���뱣��ģ��֮ǰ��Ԥ����
 */
@WebServlet(name = "InsServlet", urlPatterns = "/InsServlet")
public class InsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String target = request.getParameter("target").toString();

        InsRegularServiceImpl irsi = new InsRegularServiceImpl();
        //�õ������ڽ����ղ�Ʒ���浽session
        List<InsRegular> allirp = irsi.getAllInsRegularProduct();
        request.getSession().setAttribute("allInsRegular", allirp);

        HttpSession session = request.getSession();
        String uID = session.getAttribute("uID").toString();
        NUserServiceImpl service1 = new NUserServiceImpl();
        //�õ����б������浽session
        InsPolicyService service = new InsPolicyServiceImpl();
        Vector<InsPolicy> allInsPolicy = service.getAllInsPolicy(service1.getNUserByuID(Long.parseLong(uID)).getID());
        session.setAttribute("allInsPolicy", allInsPolicy);
        response.sendRedirect("insur.jsp?#" + target);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
