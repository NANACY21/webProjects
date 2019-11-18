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
        //����model����
        RelationServiceImpl fs = new RelationServiceImpl();
        List<NUser> friends = fs.listAppointFriends(userID, request.getParameter("surname").toString());//�������
        //�û��Ĳ��ֺ��ѵļ���
        request.getSession().setAttribute("friends", friends);//��friends��ȫ�����Ѽ��ϻ򲿷ֺ��Ѽ���
        request.getRequestDispatcher("friendList.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
