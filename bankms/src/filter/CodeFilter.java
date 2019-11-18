package filter;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Encoding������
 * urlPatterns *.jsp ��������jsp /* �������е�ַ��
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
     * �������ڷ���������ʱʵ������Ȼ����ø÷���
     *
     * @param config
     * @throws ServletException
     */
    public void init(FilterConfig config) throws ServletException {
    }
}
