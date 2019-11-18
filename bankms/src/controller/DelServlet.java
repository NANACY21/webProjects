package controller;

import dao.impl.NUserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 管理员删普通用户
 */
@WebServlet(name = "DelServlet", urlPatterns = "/DelServlet")

public class DelServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long uID = Long.parseLong(request.getParameter("uID").toString());
        NUserDaoImpl dao = new NUserDaoImpl();
        String delete = dao.delete(uID);
        PrintWriter out = response.getWriter();
        if (delete.length() == 0) {
            //删除失败
            out.print("fail");
        } else {
            out.print("success");
        }
        out.flush();
        out.close();

    }
}
