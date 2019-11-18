package controller;

import model.InsPolicyService;
import model.impl.BankCardServiceImpl;
import model.impl.InsPolicyServiceImpl;
import model.impl.NUserServiceImpl;
import vo.InsPolicy;
import vo.card.BankCard;
import vo.insProduct.InsRegular;
import vo.user.NUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import static util.Tool.getTime;

/**
 * Ͷ��
 */
@WebServlet(name = "InsuredServlet", urlPatterns = "/InsuredServlet")
public class InsuredServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String totalPremium = request.getParameter("TotalPremium");//Ͷ��Ҫ֧����Ǯ
        String cardID = request.getParameter("cardID").toString();//�����˻���
        BankCardServiceImpl service2 = new BankCardServiceImpl();
        String takeMoney = service2.takeMoney(Long.parseLong(cardID), Double.parseDouble(totalPremium), "������");
        if ("ȡ��ʧ��".equals(takeMoney)) {
            PrintWriter out = response.getWriter();
            out.print("<script>alert('" + "ʧ��" + "');window.location.href='insured.jsp'</script>");
            return;
        }
        //����һ�ű������ҳ�����һ�ű������������иñ��ղ�Ʒ�����ӣ�

        BankCardServiceImpl cardService = new BankCardServiceImpl();
        BankCard bc = cardService.getBankCard(Long.parseLong(cardID));
        NUserServiceImpl service = new NUserServiceImpl();
        NUser user = service.getNUserByuID(bc.getuID());//�õ�Ͷ�������������֤��
        String insuredID = request.getParameter("insuredID").toString();//�ܱ������֤��
        String insuredName = request.getParameter("insuredName").toString();//�ܱ�������
        String BeneficiaryID = request.getParameter("BeneficiaryID").toString();//���������֤��
        String BeneficiaryName = request.getParameter("BeneficiaryName").toString();//����������
        HttpSession session = request.getSession();
        InsRegular currentIrp = (InsRegular) session.getAttribute("currentIrp");
        long id = currentIrp.getID();//���ղ�Ʒ��


        System.out.println(cardID);
        System.out.println(insuredID);
        System.out.println(insuredName + "jhi");
        System.out.println(BeneficiaryID);
        System.out.println(BeneficiaryName);
        System.out.println(id);
        System.out.println(cardID);
        System.out.println(cardID);
        System.out.println(cardID);
        System.out.println(cardID);
        InsPolicy policy = new InsPolicy();
        policy.setPolicyHolderName(user.getName());
        policy.setPolicyHolderID(user.getID());
        policy.setInsuredName(insuredName);
        policy.setInsuredID(Long.parseLong(insuredID));

        policy.setBeneficiaryName(BeneficiaryName);
        policy.setBeneficiaryID(Long.parseLong(BeneficiaryID));
        policy.setInsureDate(getTime());
        policy.setPayCardID(Long.parseLong(cardID));
        policy.setInsProductID(id);
        InsPolicyService service1 = new InsPolicyServiceImpl();
        System.out.println(policy.toString());
        String s = service1.addInsPolicy(policy);
        PrintWriter out = response.getWriter();
        out.print("<script>alert('" + s + "');window.location.href='InsProductDetail.jsp'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
