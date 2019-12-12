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
 * Servlet示例
 * Servlet生命周期示例
 * <p>
 * Servlet是单例的，共享一个实例，
 * 一个Servlet实例可以服务于多个请求，
 * Servlet中尽量不创建成员变量
 * 配置文件和注解不冲突
 * <p>
 * 以下注解含义：
 * name 在注解中，name没有用
 * urlPatterns  地址栏路径只要包含nancy，就执行该servlet  全局分发配置
 * loadOnStartup    数值0-9   当容器启动时->由服务器初始化实例化servlet   loadOnStartup值越小的->启动时机越早（多个servlet都设置此）
 * 一般实例化初始化是在第一次请求该servlet时
 * @author lc
 */
@WebServlet(name = "NancyServlet", urlPatterns = "/nancy/*", initParams = {@WebInitParam(name = "name", value = "nancy")})
public class NancyServlet extends HttpServlet {

    /**
     * 在构造器之后调用，仅调用一次
     *
     * @param config
     * @throws ServletException
     */
    @Override
    public void init(ServletConfig config) throws ServletException {
        //super.init();

        //ServletConfig servletConfig = this.getServletConfig();
        //System.out.println(servletConfig.getServletName());

        //初始化参数 属于本servlet
        String name = config.getInitParameter("name");
        System.out.println(name);

        //上下文参数 属于所有servlet
        ServletContext servletContext = config.getServletContext();
        servletContext.getInitParameter("");
    }

    /**
     * 处理前端的post请求
     *
     * @param request  重点接口
     * @param response 重点接口
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置响应类型MIME，响应出来的编码用gbk编码
        response.setContentType("text/html;charset=gbk");//呈现页面

        PrintWriter out = response.getWriter();

        out.print("<script></script>");
        out.flush();
        out.close();
    }

    /**
     * 处理前端的get请求
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
     * 浏览器地址栏访问servlet时，即请求到达时，调用该方法，
     * 该方法自动派遣运行与请求对应的doGet/doPost等，
     * doGet/doPost是由该方法调用出来的
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

        //get服务端信息
        String localName = req.getLocalName();
        //get服务端信息
        String localAddr = req.getLocalAddr();
        //get客户端信息
        String remoteAddr = req.getRemoteAddr();
        //get
        String remoteUser = req.getRemoteUser();
        //get远程（客户端）主机
        String remoteHost = req.getRemoteHost();
        //get远程（客户端）主机端口
        int remotePort = req.getRemotePort();

        Date date = new Date();//访问该servlet时服务器时间

        //获取
        String contentType = req.getContentType();
    }

    /**
     * 该类对象销毁之前调用，以释放资源，从而释放内存
     */
    @Override
    public void destroy() {
        super.destroy();
    }

    /**
     * 获取servlet本身的信息
     * 不会默认调用
     * 不是生命周期的方法
     *
     * @return
     */
    @Override
    public String getServletInfo() {
        System.out.println(super.getServletInfo());
        return super.getServletInfo();
    }

    /**
     * 获取servlet本身的信息
     * 不会默认调用
     * 不是生命周期的方法
     *
     * @return
     */
    @Override
    public ServletConfig getServletConfig() {
        System.out.println(super.getServletConfig());
        return super.getServletConfig();
    }
}
