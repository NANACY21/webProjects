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
 * �û�ע����֤
 * �û�ע�� �û�ע��ok
 * <p>
 * �û�ע���->����⵽δ�����->ѯ���Ƿ�쿨���԰󶨵�ǰ�˻���
 */
@WebServlet(name = "RegisterServlet", urlPatterns = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("userID");//���֤��
        String username = request.getParameter("username");//��ʵ����
        String password1 = request.getParameter("password1");//��������
        String password2 = request.getParameter("password2");//ȷ������
        String nickname = request.getParameter("nickname");//�ǳ�
        String sex = request.getParameter("sex");//�Ա� �����л�Ů
        String telephone = request.getParameter("telephone");//�ֻ���
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
            return "�û����֤�Ų���Ϊ��";
        }
        if (username == null || username.length() == 0) {
            return "�û���������Ϊ��";
        }
        if (password1 == null || password1.length() == 0) {
            return "���벻��Ϊ��";
        }
        if (password2 == null || password2.length() == 0) {
            return "����ȷ�ϲ���Ϊ��";
        }
        if (!password1.equals(password2)) {
            return "�������벻һ��";
        }
        if (nickname == null || nickname.length() == 0) {
            return "����д�ǳ�";
        }
        return "";
    }
}
