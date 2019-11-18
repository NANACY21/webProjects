package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

/**
 * session������
 */
@WebServlet(name = "UtilServlet", urlPatterns = "/UtilServlet")
public class UtilServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        System.out.println("��session�����ߡ�");
        Enumeration<String> allKey = session.getAttributeNames();
        for (Enumeration e = allKey; e.hasMoreElements(); ) {
            String key = e.nextElement().toString();
            String Value = session.getAttribute(key).toString();
            System.out.println("��:" + key + "\tֵ:" + Value);
        }


        System.out.println("��Cookie�����ߡ�");
        Cookie cookies[] = request.getCookies();//��ȡ����Cookie
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                System.out.println("��:" + cookies[i].getName() + "\tֵ:" + cookies[i].getValue() + "\t˵��:" + cookies[i].getComment());
            }
        }
        PrintWriter out = response.getWriter();
        String Jsp = request.getParameter("Jsp");//�˻�����ɹ�����������
        out.print("<script>window.location.href='" + Jsp + "'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
