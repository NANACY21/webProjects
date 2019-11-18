package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import vo.Student;

@WebServlet(name = "DemoServlet",urlPatterns = "/DemoServlet")
public class DemoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("gbk");
        response.setCharacterEncoding("gbk");

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        List<Student> stus = new ArrayList<>();
        stus.add(new Student("111", "����", 21));
        stus.add(new Student("222", "��С��", 32));
        stus.add(new Student("333", "����", 11));
        String json = gson.toJson(stus);//����json��ʽ��������һ��json��
        out.write(json);
        out.flush();
        out.close();
    }
}
