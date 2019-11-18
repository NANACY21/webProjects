package controller;

import model.impl.RelationServiceImpl;
import vo.Relation;
import vo.user.NUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 添加好友可能需要多个servlet，这里只需一个
 * 获取UI的data而不是从db中获取，会有差错？好在这种差错不要紧
 */
@WebServlet(name = "AddFriendServlet", urlPatterns = "/AddFriendServlet")
public class AddFriendServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //要添加的好友的uID
        String fuid = request.getParameter("FUID");
        long l = Long.parseLong(fuid);
        //我的uID
        long myUID = Long.parseLong(request.getSession().getAttribute("uID").toString());
        RelationServiceImpl fs = new RelationServiceImpl();

        PrintWriter out = response.getWriter();
        out.print("<script>alert('" + fs.addFriend(new Relation(myUID, l)) + "');window.location.href='GetAllFriendServlet'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * 用于验证好友信息表的数据，传参封装为值对象不妥
     *
     * @param name
     * @param age
     * @param qq
     * @param telephone
     * @param email
     * @param address
     * @return
     */
    private String validate(String name, String age, String qq, String telephone, String email, String address) {
        if (name == null || name.length() == 0) {
            return "请填写好友姓名";
        }
        if (age == null || age.length() == 0) {
            return "请填写好友年龄";
        }
        if (qq == null || qq.length() == 0) {
            return "请填写好友qq号";
        }
        if (telephone == null || telephone.length() == 0) {
            return "请填写好友电话号";
        }
        if (email == null || email.length() == 0) {
            return "请填写好友email";
        }
        if (address == null || address.length() == 0) {
            return "请填写好友住址";
        }
        return "";
    }
}
