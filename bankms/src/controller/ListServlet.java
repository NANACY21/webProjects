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
 * data从db到ui
 * <p>
 * 管理员看所有用户
 */
@WebServlet(name = "ListServlet", urlPatterns = "/ListServlet")
public class ListServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * 点超链接到此
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        NUserDaoImpl nUserDao = new NUserDaoImpl();
        //至此得到db的data，Java集合类存着
        List<NUser> allNUser = nUserDao.findAll();

        //Gson:Java对象和json对象相互转换

        Gson gson = new Gson();
        String json = gson.toJson(allNUser);//java对象转成json的字符串

        System.out.println(json + "  6666");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
        out.close();
    }
}
