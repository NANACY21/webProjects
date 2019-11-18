package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//注意导入正确
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.Collection;
import java.util.UUID;

/**
 *
 */
@WebServlet(name = "UploadServlet",urlPatterns = "/UploadServlet")
//允许上传的最大的文件10K，单位是字节，上传大了要捕获异常
//UI层应该告知文件大小范围
@MultipartConfig(maxFileSize = 10240,fileSizeThreshold = 1024,maxRequestSize = 20480)
public class UploadServlet extends HttpServlet {

    public static final String UPLOAD = "D:\\university\\3_1\\J2EE\\webProjects\\firefly\\web\\upload";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("gbk");

        if ("s".equals(request.getParameter("title"))) {
            //参数是ui页名 表单域的名字
            Part part = request.getPart("upload");


            //上传到服务器的该目录下
            //String savePath = request.getServletContext().getRealPath("upload");
            part.getName();//表单域名称 ui页名
            part.getSize();//上传的文件的大小（字节）
            part.getContentType();//上传的文件类型
            part.getSubmittedFileName();//上传的文件的名称
            part.write(UPLOAD + "\\" + part.getSubmittedFileName());
        } else if ("m".equals(request.getParameter("title"))) {
            Collection<Part> parts = request.getParts();
            for (Part part : parts) {
                if (part.getSubmittedFileName() != null && !part.getSubmittedFileName().equals("")) {

                    //上传同一个名会覆盖，解决办法：


                    String name = part.getSubmittedFileName();
                    name = UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));

                    //上传到服务器的文件的名字，服务器上的文件的名字
                    part.write(UPLOAD + "\\" + name);
                }

            }
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
