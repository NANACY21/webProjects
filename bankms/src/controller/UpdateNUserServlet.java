package controller;

import model.impl.NUserServiceImpl;
import vo.user.NUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 修改个人信息
 */
@WebServlet(name = "UpdateNUserServlet", urlPatterns = "/UpdateNUserServlet")
public class UpdateNUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nickname = request.getParameter("nickname");
        String password = request.getParameter("password");
        String ID = request.getParameter("ID");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String telephone = request.getParameter("telephone");
        String email = request.getParameter("email");
        String birthday = request.getParameter("birthday");
        String qq = request.getParameter("qq");
        String address = request.getParameter("address");
        NUser nUser = new NUser();

        String uID = request.getSession().getAttribute("uID").toString();

        nUser.setuID(Long.parseLong(uID));
        nUser.setNickname(nickname);
        nUser.setPassword(password);
        nUser.setID(Long.parseLong(ID));
        nUser.setName(name);
        nUser.setSex(sex);
        nUser.setTelephone(telephone);
        nUser.setEmail(email);
        nUser.setBirthday(birthday);
        nUser.setQq(qq);
        nUser.setAddress(address);//至此f为新信息

        NUserServiceImpl service = new NUserServiceImpl();
        String s = service.updateNUser(nUser);
        PrintWriter out = response.getWriter();

        out.print("<script>alert('" + s + "');window.location.href='GetAllFriendServlet'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
