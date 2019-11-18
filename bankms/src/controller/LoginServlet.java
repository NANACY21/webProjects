package controller;
import model.impl.BankCardServiceImpl;
import model.impl.NUserServiceImpl;
import vo.user.NUser;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * 用户登录验证
 * 处理登录请求ok
 * servlet用于提交表单后要做的事（验证、执行等），对于登录校验若禁用js则不能验证，故用servlet更安全。
 *
 * 利息：多线程+Servlet 事实上也不是这么实现的
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        //super.init();
        //AutoDong autoDong=new AutoDong("涨利息");
        //autoDong.start();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").toString();//登录表单用户名
        String password = request.getParameter("password").toString();//登录表单密码
        String verificationCode = request.getParameter("verificationCode").toString();//登录表单验证码
        String result = validate(username, password, verificationCode);

        //UI提交的data有错误
        if (result.length() != 0) {
            request.setAttribute("error", result);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        //验证码不对
        if (!verificationCode.equals(session.getAttribute("verificationCode"))) {
            request.setAttribute("error", "验证码输入有误");
            //登录错误用这种跳转方式，表一次请求
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        //登录者
        NUser user = new NUser();
        user.setNickname(username);
        user.setPassword(password);
        NUserServiceImpl service = new NUserServiceImpl();
        String login = service.login(user);//user是按引用传递

        //登录失败
        if (login.length() != 0) {
            request.setAttribute("error", login);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        //登录成功后->uID存于session主键"uID"中，即登录成功者，以防止未登录就访问该网站其它页面
        session.setAttribute("uID", user.getuID());

        /*用户登录失效时间20分钟，20分钟后重新登录
        当登录成功时，设置会话时间，当会话超时，请求经过滤器转到登录页*/
        session.setMaxInactiveInterval(60 * 20);//参数单位：秒


        /*以下为Cookie操作：
        这里，谷歌浏览器与Microsoft Edge不同，
        谷歌中：session也是Cookie，若删除所有Cookie则session也被清除
        因此，不能删除所有Cookie
        遍历Cookie时比较键时，不可用==，要用equals，否则无效
        */
        String rememberUsername = request.getParameter("rememberUsername");
        String rememberPassword = request.getParameter("rememberPassword");

        //保存用户名复选框未选中 -> 4个键值对全删除
        if (rememberUsername == null) {
            Cookie cookies[] = request.getCookies();//获取所有Cookie
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {//遍历所有Cookie
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


        //保存用户名复选框选中，保存密码复选框未选中 -> 保存用户名键值对
        else if (rememberUsername != null && rememberPassword == null) {
            Cookie cookies[] = request.getCookies();//获取所有Cookie
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
            Cookie myCookie = new Cookie("username", username);//创建Cookie
            myCookie.setComment("上次登录时保存的用户昵称");
            myCookie.setMaxAge(7 * 24 * 60 * 60);
            response.addCookie(myCookie);
            myCookie = new Cookie("usernameChecked", "checked");
            myCookie.setComment("保存用户名");
            myCookie.setMaxAge(7 * 24 * 60 * 60);
            response.addCookie(myCookie);//addCookie 覆盖
        }


        //保存密码复选框选中 -> 保存4个键值对
        else if (rememberPassword != null) {
            Cookie myCookie = new Cookie("username", username);
            myCookie.setComment("上次登录时保存的用户昵称");
            myCookie.setMaxAge(7 * 24 * 60 * 60);
            response.addCookie(myCookie);
            myCookie = new Cookie("password", password);
            myCookie.setComment("上次登录时保存的bankms登录密码");
            myCookie.setMaxAge(7 * 24 * 60 * 60);
            response.addCookie(myCookie);

            //把复选框状态存入cookie
            myCookie = new Cookie("usernameChecked", "checked");//值必须为checked
            myCookie.setComment("保存用户名");
            myCookie.setMaxAge(7 * 24 * 60 * 60);    //设置有效期7天
            response.addCookie(myCookie);
            myCookie = new Cookie("passwordChecked", "checked");
            myCookie.setComment("保存密码");
            myCookie.setMaxAge(7 * 24 * 60 * 60);
            response.addCookie(myCookie);
        }//Cookie操作至此ok

        BankCardServiceImpl service1 = new BankCardServiceImpl();
        long id = service1.getAllBankCards(user.getuID()).get(0).getID();
        session.setAttribute("cardID", id + "");
        response.sendRedirect("main.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * 证实
     * 参数为离散的数据，而非一个对象
     *
     * @param username
     * @param password
     * @param verificationCode
     * @return
     */
    public String validate(String username, String password, String verificationCode) {

        if (verificationCode == null || verificationCode.length() == 0) {
            return "请填写验证码";
        }
        if (username == null || username.length() == 0) {
            return "用户名不能为空";
        }
        if (password == null || password.length() == 0) {
            return "密码不能为空";
        }
        return "";
    }
}