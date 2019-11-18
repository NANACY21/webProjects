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
 * 可以一次删除多个好友
 */
@WebServlet(name = "DeleteFriendServlet", urlPatterns = "/DeleteFriendServlet")
public class DeleteFriendServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*  单选框和复选框唯一区别就是单选多选
            有很多单选按钮，其name均=update
            得到被选中的单选框的value：String uID = request.getParameter("update");
        */

        /*返回null说明未选择任何好友，但前端会校验

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
