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
 * �鿴�ҵ����к���
 */
public class GetAllFriendServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);//�㳬������תservlet����servletҪ�Ӵ���
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //����model����
        RelationServiceImpl fs = new RelationServiceImpl();
        long userID = Long.parseLong(request.getSession().getAttribute("uID").toString());
        List<NUser> friends = fs.listAllFriends(userID);
        //�û������к��ѵļ���
        request.getSession().setAttribute("friends", friends);
        request.getRequestDispatcher("friendList.jsp").forward(request, response);
    }
}