package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 绩点查询的数据处理
 * 计算GPA
 */
@WebServlet(name = "GPAServlet", urlPatterns = "/GPAServlet")
public class GPAServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] scores = request.getParameterValues("score");//同名组件集合，value集合
        String[] credits = request.getParameterValues("credit");
        double[] SCOres = new double[scores.length];
        double[] CREdits = new double[credits.length];
        double sum = 0, sum1 = 0;
        for (int i = 0; i < scores.length; i++) {
            SCOres[i] = Double.parseDouble(scores[i]);
            CREdits[i] = Double.parseDouble(credits[i]);
            sum = sum + SCOres[i] * CREdits[i];
        }
        for (int i = 0; i < SCOres.length; i++) {
            if (SCOres[i] >= 60) {
                sum1 = sum1 + CREdits[i];
            }
        }
        sum1 = sum1 * 10;
        sum = sum / sum1;
        request.getSession().setAttribute("ap", sum + "");
        response.sendRedirect("GPA.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
