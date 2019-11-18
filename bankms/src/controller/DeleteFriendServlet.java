package controller;

import model.impl.RelationServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * ����һ��ɾ���������
 */
@WebServlet(name = "DeleteFriendServlet", urlPatterns = "/DeleteFriendServlet")
public class DeleteFriendServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*  ��ѡ��͸�ѡ��Ψһ������ǵ�ѡ��ѡ
            �кܶ൥ѡ��ť����name��=update
            �õ���ѡ�еĵ�ѡ���value��String uID = request.getParameter("update");
        */

        /*����null˵��δѡ���κκ��ѣ���ǰ�˻�У��

         */
        String[] values = request.getParameterValues("delete");
        long[] ids = new long[values.length];
        for (int i = 0; i < values.length; i++) {
            ids[i] = Integer.parseInt(values[i]);
        }
        RelationServiceImpl fs = new RelationServiceImpl();
        PrintWriter out = response.getWriter();
        String uID = request.getSession().getAttribute("uID").toString();

        out.print("<script>alert('" + fs.deleteFriends(Long.parseLong(uID), ids) + "');window.location.href='GetAllFriendServlet'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
