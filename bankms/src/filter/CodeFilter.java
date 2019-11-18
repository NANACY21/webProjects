package filter;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Encoding过滤器
 * urlPatterns *.jsp 拦截所有jsp /* 拦截所有地址栏
 */
@WebFilter(filterName = "CodeFilter", urlPatterns = "/*")
public class CodeFilter implements Filter {

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        request.setCharacterEncoding("gbk");
        response.setCharacterEncoding("gbk");
        chain.doFilter(req, resp);
    }

    /**
     * 过滤器在服务器启动时实例化，然后调用该方法
     *
     * @param config
     * @throws ServletException
     */
    public void init(FilterConfig config) throws ServletException {
    }
}
