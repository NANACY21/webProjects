package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.IOException;

/**��ֹδ��¼��������ҳ��
 * ����һ��ҳ�棬����˳���Ƿ��ѵ�¼ -> �����ݱ���Ԥ����
 * �ù�������Ϊ�˷�ֹδ��¼�ͷ��ʸ���վ����ҳ��
 * �����ʳ���¼����¼servlet��ע�ᡢע��servletҳ�棬��û��¼���͹�ȥ��¼
 * �����Ͳ�����ÿһ��ҳ��ǰ��һ�δ���
 * <p>
 * �����������ļ�
 * <p>
 * ��ַ�������仯ʱ���ù������࣬�����ص�ַ���г��ֵ�urlPatterns
 * ����ת�������ù�����
 * <p>
 * �ȵ��øù������ࣨ������ù���˳��->web.xml���ã�
 */
@WebFilter(filterName = "LoginFilter", urlPatterns = "/*")//���������������ͼƬ��css��js
public class LoginFilter implements Filter {


    /**
     * ����������ǰ����
     */
    public void destroy() {
    }

    /**
     * ִ�й��˲���
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
            //���û��Ѿ���¼��������������������
            if (session.getAttribute("uID") != null) {

                //���У�������ʣ���������ִ�У�
                chain.doFilter(req, resp);
                return;
            }
            //��û��¼��
            StringBuffer fileURL = request.getRequestURL();
            //.jsҲע��һ�£���.jsp��.js������
            //�����ַΪ��¼�����¼��֤ҳ�棬ͬ��������������������
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
            //����Ƿ���һ��ת���¼��ҳ��
            request.getRequestDispatcher("login.jsp").forward(req, resp);//������ִ�����и����
            return;
        }
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    /**
     * ��������ʼ��
     *
     * @param config
     * @throws ServletException
     */
    public void init(FilterConfig config) throws ServletException {
    }
}