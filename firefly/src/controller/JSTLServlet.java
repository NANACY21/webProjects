package controller;

import vo.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "JSTLServlet" ,urlPatterns = "/JSTLServlet")
public class JSTLServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> strings = new ArrayList<>();
        strings.add("aaa");
        strings.add("bbb");
        strings.add("ccc");
        strings.add("ddd");
        strings.add("eee");
        strings.add("fff");
        strings.add("ggg");
        strings.add("hhh");



        request.setAttribute("sss", strings);

        List<Student> students = new ArrayList<>();

        for (int i = 0; i < 4; i++) {
            Student student = new Student("lichi"+i+1);
            students.add(student);
        }



        request.setAttribute("students", students);

        Map<String, Student> maps = new HashMap<>();
        for (int i = 0; i < 5; i++) {
            maps.put("a" + i, new Student("li" + i));
        }

        request.setAttribute("mapsssss", maps);
        request.getRequestDispatcher("JSTL.jsp").forward(request, response);
    }
}
