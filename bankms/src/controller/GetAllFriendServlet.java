package controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.impl.RelationServiceImpl;
import vo.user.NUser;

@WebServlet(name = "GetAllFriendServlet", urlPatterns = "/GetAllFriendServlet")
/**
 * 查看我的所有好友
 */
public class GetAllFriendServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);//点超链接跳转servlet，该servlet要加此行
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //调用model代码
        RelationServiceImpl fs = new RelationServiceImpl();
        long userID = Long.parseLong(request.getSession().getAttribute("uID").toString());
        List<NUser> friends = fs.listAllFriends(userID);
        //用户的所有好友的集合
        request.getSession().setAttribute("friends", friends);
        request.getRequestDispatcher("friendList.jsp").forward(request, response);
    }
}