package controller;

import com.google.gson.Gson;
import dao.impl.NUserDaoImpl;
import vo.user.NUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * data��db��ui
 * <p>
 * ����Ա�������û�
 */
@WebServlet(name = "ListServlet", urlPatterns = "/ListServlet")
public class ListServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * �㳬���ӵ���
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        NUserDaoImpl nUserDao = new NUserDaoImpl();
        //���˵õ�db��data��Java���������
        List<NUser> allNUser = nUserDao.findAll();

        //Gson:Java�����json�����໥ת��

        Gson gson = new Gson();
        String json = gson.toJson(allNUser);//java����ת��json���ַ���

        System.out.println(json + "  6666");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
        out.close();
    }
}
