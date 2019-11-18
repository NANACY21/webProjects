package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

/**
 * session管理者
 */
@WebServlet(name = "UtilServlet", urlPatterns = "/UtilServlet")
public class UtilServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        System.out.println("【session管理者】");
        Enumeration<String> allKey = session.getAttributeNames();
        for (Enumeration e = allKey; e.hasMoreElements(); ) {
            String key = e.nextElement().toString();
            String Value = session.getAttribute(key).toString();
            System.out.println("键:" + key + "\t值:" + Value);
        }


        System.out.println("【Cookie管理者】");
        Cookie cookies[] = request.getCookies();//获取所有Cookie
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                System.out.println("键:" + cookies[i].getName() + "\t值:" + cookies[i].getValue() + "\t说明:" + cookies[i].getComment());
            }
        }
        PrintWriter out = response.getWriter();
        String Jsp = request.getParameter("Jsp");//账户激活成功后跳到哪里
        out.print("<script>window.location.href='" + Jsp + "'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
