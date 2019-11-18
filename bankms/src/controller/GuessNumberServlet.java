package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 点击猜数后到此servlet，
 * 以前是点击猜数后交给一个.jsp
 */
@WebServlet(name = "GuessNumberServlet", urlPatterns = "/GuessNumberServlet")
public class GuessNumberServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String myGuess = request.getParameter("myGuess");//获取文本框内容(浏览器用户输入的数、猜的数)
        HttpSession session = request.getSession();
        String result = "";
        if (session.getAttribute("rand") == null) {
            int randomNumber = (int) (Math.random() * 100);//电脑随机生成一个1-100之间的随机数
            session.setAttribute("rand", randomNumber + "");//电脑生成的随机数，让你猜的
        }
        String randomNumber = (String) session.getAttribute("rand");//读取session键为rand中的内容
        if (Integer.parseInt(randomNumber) > Integer.parseInt(myGuess)) {
            result = "小了";
        } else if (Integer.parseInt(randomNumber) < Integer.parseInt(myGuess)) {
            result = "大了";
        } else {
            result = "猜对啦！我又重新想了一个数，你可以再猜！";
            int RandomNumber = (int) (Math.random() * 100);//重新随机生成一个1-100之间的随机数
            session.setAttribute("rand", RandomNumber + "");//随机数放到session
        }
        PrintWriter out = response.getWriter();//
        out.print("<script charset=\"gbk\">alert('" + result + "');window.location.href='guessNumber.jsp'</script>");
        return;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
