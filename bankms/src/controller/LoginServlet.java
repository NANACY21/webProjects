package controller;
import model.impl.BankCardServiceImpl;
import model.impl.NUserServiceImpl;
import vo.user.NUser;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * �û���¼��֤
 * �����¼����ok
 * servlet�����ύ����Ҫ�����£���֤��ִ�еȣ������ڵ�¼У��������js������֤������servlet����ȫ��
 *
 * ��Ϣ�����߳�+Servlet ��ʵ��Ҳ������ôʵ�ֵ�
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        //super.init();
        //AutoDong autoDong=new AutoDong("����Ϣ");
        //autoDong.start();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").toString();//��¼���û���
        String password = request.getParameter("password").toString();//��¼������
        String verificationCode = request.getParameter("verificationCode").toString();//��¼����֤��
        String result = validate(username, password, verificationCode);

        //UI�ύ��data�д���
        if (result.length() != 0) {
            request.setAttribute("error", result);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        //��֤�벻��
        if (!verificationCode.equals(session.getAttribute("verificationCode"))) {
            request.setAttribute("error", "��֤����������");
            //��¼������������ת��ʽ����һ������
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        //��¼��
        NUser user = new NUser();
        user.setNickname(username);
        user.setPassword(password);
        NUserServiceImpl service = new NUserServiceImpl();
        String login = service.login(user);//user�ǰ����ô���

        //��¼ʧ��
        if (login.length() != 0) {
            request.setAttribute("error", login);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        //��¼�ɹ���->uID����session����"uID"�У�����¼�ɹ��ߣ��Է�ֹδ��¼�ͷ��ʸ���վ����ҳ��
        session.setAttribute("uID", user.getuID());

        /*�û���¼ʧЧʱ��20���ӣ�20���Ӻ����µ�¼
        ����¼�ɹ�ʱ�����ûỰʱ�䣬���Ự��ʱ�����󾭹�����ת����¼ҳ*/
        session.setMaxInactiveInterval(60 * 20);//������λ����


        /*����ΪCookie������
        ����ȸ��������Microsoft Edge��ͬ��
        �ȸ��У�sessionҲ��Cookie����ɾ������Cookie��sessionҲ�����
        ��ˣ�����ɾ������Cookie
        ����Cookieʱ�Ƚϼ�ʱ��������==��Ҫ��equals��������Ч
        */
        String rememberUsername = request.getParameter("rememberUsername");
        String rememberPassword = request.getParameter("rememberPassword");

        //�����û�����ѡ��δѡ�� -> 4����ֵ��ȫɾ��
        if (rememberUsername == null) {
            Cookie cookies[] = request.getCookies();//��ȡ����Cookie
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {//��������Cookie
                    if ("username".equals(cookies[i].getName())) {
//                        cookies[i].setMaxAge(0);
                        cookies[i] = new Cookie("username", null);
                        response.addCookie(cookies[i]);
                    } else if ("password".equals(cookies[i].getName())) {
//                        cookies[i].setMaxAge(0);
                        cookies[i] = new Cookie("password", null);
                        response.addCookie(cookies[i]);
                    } else if ("usernameChecked".equals(cookies[i].getName())) {
//                        cookies[i].setMaxAge(0);
                        cookies[i] = new Cookie("usernameChecked", null);
                        response.addCookie(cookies[i]);
                    } else if ("passwordChecked".equals(cookies[i].getName())) {
//                        cookies[i].setMaxAge(0);
                        cookies[i] = new Cookie("passwordChecked", null);
                        response.addCookie(cookies[i]);
                    }
                }
            }
        }


        //�����û�����ѡ��ѡ�У��������븴ѡ��δѡ�� -> �����û�����ֵ��
        else if (rememberUsername != null && rememberPassword == null) {
            Cookie cookies[] = request.getCookies();//��ȡ����Cookie
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    if ("password".equals(cookies[i].getName())) {
                        cookies[i].setMaxAge(0);
                        response.addCookie(cookies[i]);
                    } else if ("passwordChecked".equals(cookies[i].getName())) {
                        cookies[i].setMaxAge(0);
                        response.addCookie(cookies[i]);
                    }
                }
            }
            Cookie myCookie = new Cookie("username", username);//����Cookie
            myCookie.setComment("�ϴε�¼ʱ������û��ǳ�");
            myCookie.setMaxAge(7 * 24 * 60 * 60);
            response.addCookie(myCookie);
            myCookie = new Cookie("usernameChecked", "checked");
            myCookie.setComment("�����û���");
            myCookie.setMaxAge(7 * 24 * 60 * 60);
            response.addCookie(myCookie);//addCookie ����
        }


        //�������븴ѡ��ѡ�� -> ����4����ֵ��
        else if (rememberPassword != null) {
            Cookie myCookie = new Cookie("username", username);
            myCookie.setComment("�ϴε�¼ʱ������û��ǳ�");
            myCookie.setMaxAge(7 * 24 * 60 * 60);
            response.addCookie(myCookie);
            myCookie = new Cookie("password", password);
            myCookie.setComment("�ϴε�¼ʱ�����bankms��¼����");
            myCookie.setMaxAge(7 * 24 * 60 * 60);
            response.addCookie(myCookie);

            //�Ѹ�ѡ��״̬����cookie
            myCookie = new Cookie("usernameChecked", "checked");//ֵ����Ϊchecked
            myCookie.setComment("�����û���");
            myCookie.setMaxAge(7 * 24 * 60 * 60);    //������Ч��7��
            response.addCookie(myCookie);
            myCookie = new Cookie("passwordChecked", "checked");
            myCookie.setComment("��������");
            myCookie.setMaxAge(7 * 24 * 60 * 60);
            response.addCookie(myCookie);
        }//Cookie��������ok

        BankCardServiceImpl service1 = new BankCardServiceImpl();
        long id = service1.getAllBankCards(user.getuID()).get(0).getID();
        session.setAttribute("cardID", id + "");
        response.sendRedirect("main.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * ֤ʵ
     * ����Ϊ��ɢ�����ݣ�����һ������
     *
     * @param username
     * @param password
     * @param verificationCode
     * @return
     */
    public String validate(String username, String password, String verificationCode) {

        if (verificationCode == null || verificationCode.length() == 0) {
            return "����д��֤��";
        }
        if (username == null || username.length() == 0) {
            return "�û�������Ϊ��";
        }
        if (password == null || password.length() == 0) {
            return "���벻��Ϊ��";
        }
        return "";
    }
}