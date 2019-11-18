<%@ page import="java.util.List" pageEncoding="gbk" %>
<%@ page import="vo.insProduct.InsRegular" %>
<%@ page import="model.impl.BankCardServiceImpl" %>
<%@ page import="vo.card.BankCard" %>
<%@ page import="vo.InsPolicy" %>
<%@ page import="java.util.Vector" %><%--
  Created by IntelliJ IDEA.
  User: 李箎
  Date: 2019/6/18
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" %>
<html>
<head>
    <title>bankms - 保险 - 主页 - 保险产品详情</title>
    <meta charset="gbk">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <!-- Google fonts - Popppins for copy-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
    <!-- orion icons-->
    <link rel="stylesheet" href="css/orionicons.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">

    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/general.css">
    <%--<link rel="stylesheet" href="css/general.css">--%>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/InsProductDetail.css">
</head>
<body>
<%--头部--%>
<%@include file="WEB-INF/header.jsp"%>
<%--内容--%>
<div class="d-flex align-items-stretch">
    <%--侧边导航--%>
    <%@include file="WEB-INF/sidebar.jsp"%>
    <div class="page-holder w-100 d-flex flex-wrap">
        <%
            i=0;
            InsPolicy ip=null;
            if(request.getParameter("insPolicyID")==null){
                ip= (InsPolicy) session.getAttribute("currentIp");
            }
            else{
                String insPolicyID = request.getParameter("insPolicyID");//拿到保险产品id
//    显示该保险产品的详细信息
                Vector<InsPolicy> allip=(Vector<InsPolicy>) session.getAttribute("allInsPolicy");//所有保险产品
                i=0;
                for(i=0;i<allip.size();i++){
                    if(allip.elementAt(i).getID()==Integer.parseInt(insPolicyID)){
                        ip=(InsPolicy) allip.get(i);//显示这个保险单的详情

                        //在此时设置当前保单，还会覆盖，不需手动置空
                        session.setAttribute("currentIp",ip);
//            return;//这会退出
                        break;
                    }
                }
            }
        %>
        <%--保险产品详情表单--%>
        <div class="form" id="InsProductDetail">
            <%
                out.print("<img src=\"img/InsProduct3.JPG\">");
            %>
            <h1>保险单详细信息</h1>
            <form align="center" id="form1" action="insured.jsp" onsubmit="decision();" method="post">
                <table class="table" align="center" border="0" cellspacing="0" cellpadding="0">
                    <tr class="tr">
                        <td>保单号&emsp;</td>
                        <td colspan="2" align="center">
                            <label class="form-control"><%=ip.getID()%></label>
                        </td>
                    </tr>
                    <tr class="tr">
                        <td>投保人姓名&emsp;</td>
                        <td colspan="2" align="center">
                            <label class="form-control"><%=ip.getPolicyHolderName()%></label>
                        </td>
                    </tr>
                    <tr class="tr">
                        <td class="edge_td">投保人身份证号&emsp;</td>
                        <td class="mid_td" colspan="2" align="center">
                            <label class="form-control"><%=ip.getPolicyHolderID()%></label>
                        </td>
                    </tr>
                    <tr class="tr">
                        <td class="edge_td">受保人姓名&emsp;</td>
                        <td colspan="2" class="mid_td" align="center">
                            <label class="form-control"><%=ip.getInsuredName()%></label>
                        </td>
                    </tr>
                    <tr class="tr">
                        <td class="edge_td">受保人身份证号&emsp;</td>
                        <td class="mid_td" colspan="2" align="center">
                            <label class="form-control"><%=ip.getInsuredID()%></label>
                        </td>
                    </tr>
                    <tr class="tr">
                        <td class="edge_td">受益人姓名&emsp;</td>
                        <td class="mid_td" colspan="2" align="center">
                            <label class="form-control"><%=ip.getBeneficiaryName()%></label>
                        </td>
                    </tr>
                    <tr class="tr">
                        <td class="edge_td">受益人身份证号&emsp;</td>
                        <td class="mid_td" colspan="2" align="center">
                            <label class="form-control"><%=ip.getBeneficiaryID()%></label>
                        </td>
                    </tr>
                    <tr class="tr">
                        <td class="edge_td">投保日期&emsp;</td>
                        <td class="mid_td" colspan="2" align="center">
                            <label class="form-control"><%=ip.getInsureDate()%></label>
                        </td>
                    </tr>
                    <tr class="tr">
                        <td class="edge_td">付款账号&emsp;</td>
                        <td class="mid_td" colspan="2" align="center">
                            <label class="form-control"><%=ip.getPayCardID()%></label>
                        </td>
                    </tr>
                    <tr class="tr">
                        <td class="edge_td">保险产品号&emsp;</td>
                        <td class="mid_td" colspan="2" align="center">
                            <label class="form-control"><%=ip.getInsProductID()%></label>
                        </td>
                        <td>
                            <a href="InsProductDetail.jsp?InsProductID=<%=ip.getInsProductID()%>">查看这个保险产品</a>
                        </td>
                    </tr>
                    <tr>
                        <td><a href="insur.jsp">该保险单的备注</a> </td>
                        <td>
                            <select class="form-control">
                                <option class="form-control">缴纳保险</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="js/js.cookie.min.js"></script>
<script src="js/charts-home.js"></script>
<script src="js/front.js"></script>
</body>
</html>