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
 * ��Ӻ��ѿ�����Ҫ���servlet������ֻ��һ��
 * ��ȡUI��data�����Ǵ�db�л�ȡ�����в���������ֲ��Ҫ��
 */
@WebServlet(name = "AddFriendServlet", urlPatterns = "/AddFriendServlet")
public class AddFriendServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Ҫ��ӵĺ��ѵ�uID
        String fuid = request.getParameter("FUID");
        long l = Long.parseLong(fuid);
        //�ҵ�uID
        long myUID = Long.parseLong(request.getSession().getAttribute("uID").toString());
        RelationServiceImpl fs = new RelationServiceImpl();

        PrintWriter out = response.getWriter();
        out.print("<script>alert('" + fs.addFriend(new Relation(myUID, l)) + "');window.location.href='GetAllFriendServlet'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * ������֤������Ϣ������ݣ����η�װΪֵ������
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
            return "����д��������";
        }
        if (age == null || age.length() == 0) {
            return "����д��������";
        }
        if (qq == null || qq.length() == 0) {
            return "����д����qq��";
        }
        if (telephone == null || telephone.length() == 0) {
            return "����д���ѵ绰��";
        }
        if (email == null || email.length() == 0) {
            return "����д����email";
        }
        if (address == null || address.length() == 0) {
            return "����д����סַ";
        }
        return "";
    }
}
