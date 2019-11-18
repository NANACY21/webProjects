package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.IOException;

/**防止未登录访问其它页面
 * 请求一个页面，过滤顺序：是否已登录 -> 表单数据编码预处理
 * 该过滤器是为了防止未登录就访问该网站其它页面
 * 若访问除登录、登录servlet、注册、注册servlet页面，若没登录过就滚去登录
 * 这样就不需在每一个页面前加一段代码
 * <p>
 * 不过滤配置文件
 * <p>
 * 地址栏发生变化时调用过滤器类，仅拦截地址栏中出现的urlPatterns
 * 请求转发不调用过滤器
 * <p>
 * 先调用该过滤器类（如何设置过滤顺序->web.xml配置）
 */
@WebFilter(filterName = "LoginFilter", urlPatterns = "/*")//过滤所有请求包括图片，css，js
public class LoginFilter implements Filter {


    /**
     * 过滤器销毁前调用
     */
    public void destroy() {
    }

    /**
     * 执行过滤操作
     *
     * @param req
     * @param resp
     * @param chain
     * @throws ServletException
     * @throws IOException
     */
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();
        if (session != null) {
            //若用户已经登录，正常处理请求链内容
            if (session.getAttribute("uID") != null) {

                //放行（允许访问，继续往下执行）
                chain.doFilter(req, resp);
                return;
            }
            //若没登录过
            StringBuffer fileURL = request.getRequestURL();
            //.js也注意一下，但.jsp和.js。。。
            //请求地址为登录表单或登录验证页面，同样正常处理请求链内容
            if (fileURL.indexOf(".jpg") > 0 || fileURL.indexOf(".bmp") > 0
                    || fileURL.indexOf(".jpeg") > 0
                    || fileURL.indexOf(".gif") > 0 || fileURL.indexOf(".css") > 0
                    || fileURL.indexOf("login.jsp") > 0 || fileURL.indexOf("LoginServlet") > 0
                    || fileURL.indexOf("accountActivationServlet") > 0
                    || fileURL.indexOf("register.jsp") > 0 || fileURL.indexOf("RegisterServlet") > 0
                    || fileURL.indexOf("login.js") > 0 || fileURL.indexOf("rotationChart.js") > 0
                    || fileURL.indexOf(".png") > 0 || fileURL.indexOf("VerificationCodeServlet") > 0
                    || fileURL.indexOf("db.properties") > 0
                    || fileURL.indexOf("dbcpconfig.properties") > 0
                    || fileURL.indexOf(".jar") > 0
                    || fileURL.indexOf("register.js") > 0
                    || fileURL.indexOf("AccountReportServlet") > 0
                    || fileURL.indexOf("AccountActivationServlet") > 0
                    || fileURL.indexOf("HandleCardServlet") > 0
                    || fileURL.indexOf("index.jsp") > 0
                    || fileURL.indexOf("index.html") > 0) {
                chain.doFilter(req, resp);
                return;
            }
            //请求非法，一律转向登录表单页面
            request.getRequestDispatcher("login.jsp").forward(req, resp);//不能连执行两行该语句
            return;
        }
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    /**
     * 过滤器初始化
     *
     * @param config
     * @throws ServletException
     */
    public void init(FilterConfig config) throws ServletException {
    }
}