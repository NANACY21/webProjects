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
 * ��������󵽴�servlet��
 * ��ǰ�ǵ�������󽻸�һ��.jsp
 */
@WebServlet(name = "GuessNumberServlet", urlPatterns = "/GuessNumberServlet")
public class GuessNumberServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String myGuess = request.getParameter("myGuess");//��ȡ�ı�������(������û�����������µ���)
        HttpSession session = request.getSession();
        String result = "";
        if (session.getAttribute("rand") == null) {
            int randomNumber = (int) (Math.random() * 100);//�����������һ��1-100֮��������
            session.setAttribute("rand", randomNumber + "");//�������ɵ������������µ�
        }
        String randomNumber = (String) session.getAttribute("rand");//��ȡsession��Ϊrand�е�����
        if (Integer.parseInt(randomNumber) > Integer.parseInt(myGuess)) {
            result = "С��";
        } else if (Integer.parseInt(randomNumber) < Integer.parseInt(myGuess)) {
            result = "����";
        } else {
            result = "�¶�����������������һ������������ٲ£�";
            int RandomNumber = (int) (Math.random() * 100);//�����������һ��1-100֮��������
            session.setAttribute("rand", RandomNumber + "");//������ŵ�session
        }
        PrintWriter out = response.getWriter();//
        out.print("<script charset=\"gbk\">alert('" + result + "');window.location.href='guessNumber.jsp'</script>");
        return;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
