package controller;

import model.impl.RelationServiceImpl;
import vo.user.NUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetPartFriendServlet", urlPatterns = "/GetPartFriendServlet")
public class GetPartFriendServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long userID = Long.parseLong(request.getSession().getAttribute("uID").toString());
        //调用model代码
        RelationServiceImpl fs = new RelationServiceImpl();
        List<NUser> friends = fs.listAppointFriends(userID, request.getParameter("surname").toString());//输入的姓
        //用户的部分好友的集合
        request.getSession().setAttribute("friends", friends);//键friends存全部好友集合或部分好友集合
        request.getRequestDispatcher("friendList.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
