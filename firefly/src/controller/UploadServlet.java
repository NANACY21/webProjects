package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//ע�⵼����ȷ
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.Collection;
import java.util.UUID;

/**
 *
 */
@WebServlet(name = "UploadServlet",urlPatterns = "/UploadServlet")
//�����ϴ��������ļ�10K����λ���ֽڣ��ϴ�����Ҫ�����쳣
//UI��Ӧ�ø�֪�ļ���С��Χ
@MultipartConfig(maxFileSize = 10240,fileSizeThreshold = 1024,maxRequestSize = 20480)
public class UploadServlet extends HttpServlet {

    public static final String UPLOAD = "D:\\university\\3_1\\J2EE\\webProjects\\firefly\\web\\upload";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("gbk");

        if ("s".equals(request.getParameter("title"))) {
            //������uiҳ�� ���������
            Part part = request.getPart("upload");


            //�ϴ����������ĸ�Ŀ¼��
            //String savePath = request.getServletContext().getRealPath("upload");
            part.getName();//�������� uiҳ��
            part.getSize();//�ϴ����ļ��Ĵ�С���ֽڣ�
            part.getContentType();//�ϴ����ļ�����
            part.getSubmittedFileName();//�ϴ����ļ�������
            part.write(UPLOAD + "\\" + part.getSubmittedFileName());
        } else if ("m".equals(request.getParameter("title"))) {
            Collection<Part> parts = request.getParts();
            for (Part part : parts) {
                if (part.getSubmittedFileName() != null && !part.getSubmittedFileName().equals("")) {

                    //�ϴ�ͬһ�����Ḳ�ǣ�����취��


                    String name = part.getSubmittedFileName();
                    name = UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));

                    //�ϴ������������ļ������֣��������ϵ��ļ�������
                    part.write(UPLOAD + "\\" + name);
                }

            }
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
