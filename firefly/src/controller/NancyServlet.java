package controller;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

/**
 * Servletʾ��
 * Servlet��������ʾ��
 * <p>
 * Servlet�ǵ����ģ�����һ��ʵ����
 * һ��Servletʵ�����Է����ڶ������
 * Servlet�о�����������Ա����
 * �����ļ���ע�ⲻ��ͻ
 * <p>
 * ����ע�⺬�壺
 * name ��ע���У�nameû����
 * urlPatterns  ��ַ��·��ֻҪ����nancy����ִ�и�servlet  ȫ�ַַ�����
 * loadOnStartup    ��ֵ0-9   ����������ʱ->�ɷ�������ʼ��ʵ����servlet   loadOnStartupֵԽС��->����ʱ��Խ�磨���servlet�����ôˣ�
 * һ��ʵ������ʼ�����ڵ�һ�������servletʱ
 * @author lc
 */
@WebServlet(name = "NancyServlet", urlPatterns = "/nancy/*", initParams = {@WebInitParam(name = "name", value = "nancy")})
public class NancyServlet extends HttpServlet {

    /**
     * �ڹ�����֮����ã�������һ��
     *
     * @param config
     * @throws ServletException
     */
    @Override
    public void init(ServletConfig config) throws ServletException {
        //super.init();

        //ServletConfig servletConfig = this.getServletConfig();
        //System.out.println(servletConfig.getServletName());

        //��ʼ������ ���ڱ�servlet
        String name = config.getInitParameter("name");
        System.out.println(name);

        //�����Ĳ��� ��������servlet
        ServletContext servletContext = config.getServletContext();
        servletContext.getInitParameter("");
    }

    /**
     * ����ǰ�˵�post����
     *
     * @param request  �ص�ӿ�
     * @param response �ص�ӿ�
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //������Ӧ����MIME����Ӧ�����ı�����gbk����
        response.setContentType("text/html;charset=gbk");//����ҳ��

        PrintWriter out = response.getWriter();

        out.print("<script></script>");
        out.flush();
        out.close();
    }

    /**
     * ����ǰ�˵�get����
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    /**
     * �������ַ������servletʱ�������󵽴�ʱ�����ø÷�����
     * �÷����Զ���ǲ�����������Ӧ��doGet/doPost�ȣ�
     * doGet/doPost���ɸ÷������ó�����
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp);
        System.out.println("li");

        //get�������Ϣ
        String localName = req.getLocalName();
        //get�������Ϣ
        String localAddr = req.getLocalAddr();
        //get�ͻ�����Ϣ
        String remoteAddr = req.getRemoteAddr();
        //get
        String remoteUser = req.getRemoteUser();
        //getԶ�̣��ͻ��ˣ�����
        String remoteHost = req.getRemoteHost();
        //getԶ�̣��ͻ��ˣ������˿�
        int remotePort = req.getRemotePort();

        Date date = new Date();//���ʸ�servletʱ������ʱ��

        //��ȡ
        String contentType = req.getContentType();
    }

    /**
     * �����������֮ǰ���ã����ͷ���Դ���Ӷ��ͷ��ڴ�
     */
    @Override
    public void destroy() {
        super.destroy();
    }

    /**
     * ��ȡservlet�������Ϣ
     * ����Ĭ�ϵ���
     * �����������ڵķ���
     *
     * @return
     */
    @Override
    public String getServletInfo() {
        System.out.println(super.getServletInfo());
        return super.getServletInfo();
    }

    /**
     * ��ȡservlet�������Ϣ
     * ����Ĭ�ϵ���
     * �����������ڵķ���
     *
     * @return
     */
    @Override
    public ServletConfig getServletConfig() {
        System.out.println(super.getServletConfig());
        return super.getServletConfig();
    }
}
