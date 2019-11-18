package controller;

import dao.impl.MapDaoImpl;
import vo.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ShowMapServlet", urlPatterns = "/ShowMapServlet", loadOnStartup = 1)
public class ShowMapServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MapDaoImpl dao = new MapDaoImpl();
        ArrayList<Map> result = new ArrayList<Map>();
        result = dao.find();
        request.getSession().setAttribute("map", result);
        request.getRequestDispatcher("map.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
