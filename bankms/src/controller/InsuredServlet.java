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
 * 投保
 */
@WebServlet(name = "InsuredServlet", urlPatterns = "/InsuredServlet")
public class InsuredServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String totalPremium = request.getParameter("TotalPremium");//投保要支付的钱
        String cardID = request.getParameter("cardID").toString();//付款账户号
        BankCardServiceImpl service2 = new BankCardServiceImpl();
        String takeMoney = service2.takeMoney(Long.parseLong(cardID), Double.parseDouble(totalPremium), "购买保险");
        if ("取款失败".equals(takeMoney)) {
            PrintWriter out = response.getWriter();
            out.print("<script>alert('" + "失败" + "');window.location.href='insured.jsp'</script>");
            return;
        }
        //生成一张保单，我持有了一张保单（保单还有该保险产品的链接）

        BankCardServiceImpl cardService = new BankCardServiceImpl();
        BankCard bc = cardService.getBankCard(Long.parseLong(cardID));
        NUserServiceImpl service = new NUserServiceImpl();
        NUser user = service.getNUserByuID(bc.getuID());//得到投保人姓名、身份证号
        String insuredID = request.getParameter("insuredID").toString();//受保人身份证号
        String insuredName = request.getParameter("insuredName").toString();//受保人姓名
        String BeneficiaryID = request.getParameter("BeneficiaryID").toString();//受益人身份证号
        String BeneficiaryName = request.getParameter("BeneficiaryName").toString();//受益人姓名
        HttpSession session = request.getSession();
        InsRegular currentIrp = (InsRegular) session.getAttribute("currentIrp");
        long id = currentIrp.getID();//保险产品号


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
