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
 * 用户注册验证
 * 用户注册 用户注册ok
 * <p>
 * 用户注册后->若监测到未办过卡->询问是否办卡（以绑定当前账户）
 */
@WebServlet(name = "RegisterServlet", urlPatterns = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("userID");//身份证号
        String username = request.getParameter("username");//真实姓名
        String password1 = request.getParameter("password1");//设置密码
        String password2 = request.getParameter("password2");//确认密码
        String nickname = request.getParameter("nickname");//昵称
        String sex = request.getParameter("sex");//性别 返回男或女
        String telephone = request.getParameter("telephone");//手机号
        String email = request.getParameter("email");//email
        String result = validate(userID, username, password1, password2, nickname, sex, telephone, email);
        if (result.length() != 0) {
            request.setAttribute("err", result);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        NUser user = new NUser();
        user.setID(Long.parseLong(userID));
        user.setName(username);
        user.setPassword(password1);
        user.setNickname(nickname);
        user.setSex(sex);
        user.setTelephone(telephone);
        user.setEmail(email);
        NUserServiceImpl service = new NUserServiceImpl();
        result = service.register(user);

        PrintWriter out = response.getWriter();
        out.print("<script>alert('" + result + "');window.location.href='login.jsp'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private String validate(String userID, String username, String password1, String password2, String nickname, String sex, String telephone, String email) {
        if (userID == null || userID.length() == 0) {
            return "用户身份证号不能为空";
        }
        if (username == null || username.length() == 0) {
            return "用户姓名不能为空";
        }
        if (password1 == null || password1.length() == 0) {
            return "密码不能为空";
        }
        if (password2 == null || password2.length() == 0) {
            return "密码确认不能为空";
        }
        if (!password1.equals(password2)) {
            return "两次密码不一致";
        }
        if (nickname == null || nickname.length() == 0) {
            return "请填写昵称";
        }
        return "";
    }
}
