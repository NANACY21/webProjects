<%@ page language="java" pageEncoding="gbk"%>
<%@page import = "java.util.*" %>
<%@ page import="model.impl.NUserServiceImpl" %>
<%@ page import="vo.user.NUser" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="gbk">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>bankms</title>
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
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.png?3">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>

<%@include file="WEB-INF/header.jsp"%>
<div class="d-flex align-items-stretch">
    <%@include file="WEB-INF/sidebar.jsp"%>
    <%
        NUserServiceImpl nudao=new NUserServiceImpl();
        NUser user = nudao.getNUserByuID(Long.parseLong(uID));
    %>
    <%--	内容--%>
    <%
        String operateLoanAlert = (String)request.getAttribute("loanOperateAlert");
        if(operateLoanAlert!=null){
            out.println("<script>alert(\""+operateLoanAlert+"\")</script>");
            request.removeAttribute("loanOperateAlert");
        }
    %>
    <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">
            <section class="py-5">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="card">
                            <div class="card-header">
                                <h6 class="text-uppercase mb-0">我的贷款</h6>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped table-sm card-text">
                                    <thead>
                                    <tr>
                                        <th>贷款号</th>
                                        <th>贷款类型</th>
                                        <th>贷款金额</th>
                                        <th>贷款时间</th>
                                        <th>起始时间</th>
                                        <th>归还时间</th>
                                        <th>银行卡号</th>
                                        <th>贷款状态</th>
                                        <th>备注</th>
                                        <th>操作</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        List<Object> loans=(List<Object>)request.getAttribute("loans");
                                        if(loans == null){
                                            response.sendRedirect("p_myLoanServlet");
                                        }else {
                                            for (Object o : loans) {
                                                vo.loan.Loan ln = (vo.loan.Loan) o;
                                                out.println("<tr>");
                                                out.println("<td>" + ln.getLoanID() + "</td>");
                                                String lt = "";
                                                if(ln.getLoanType() == 1 ){
                                                    lt = "短期贷款";
                                                }else if(ln.getLoanType()==2){
                                                    lt = "中期贷款";
                                                }else{
                                                    lt = "长期贷款";
                                                }
                                                out.println("<td>" + lt + "</td>");
                                                out.println("<td>" + ln.getAmount() + "</td>");
                                                out.println("<td>" + ln.getLoanTime() + "</td>");
                                                out.println("<td>" + ln.getCreateTime() + "</td>");
                                                out.println("<td>" + ln.getReturnTime() + "</td>");
                                                out.println("<td>" + ln.getCardID() + "</td>");
                                                String state = "";
                                                if (ln.getState() == 0) {
                                                    state = "申请失败";
                                                }
                                                if (ln.getState() == 1) {
                                                    state = "申请中";
                                                }
                                                if (ln.getState() == 2) {
                                                    state = "贷款中";
                                                    long time = (new Date().getTime() - ln.getCreateTime().getTime()) / 1000 / 60 / 60 / 24;
                                                    if (time > ln.getLoanTime() * 30) {
                                                        state = "已逾期";
                                                    }
                                                }
                                                if (ln.getState() == 3) {
                                                    state = "已偿还";
                                                }
                                                out.println("<td>" + state + "</td>");
                                                out.println("<td>" + ln.getComment() + "</td>");
                                                if (ln.getState() == 0 || ln.getState() == 3) {
                                                    out.println("<td><a href=\"http://127.0.0.1:8080/bankms/p_operateLoanServlet?operate=delete&loanID=" + ln.getLoanID() + "\" class=\"btn btn-sm btn-danger\">删除</a></td>");
                                                }
                                                if (ln.getState() == 1) {
                                                    out.println("<td><a href=\"http://127.0.0.1:8080/bankms/p_operateLoanServlet?operate=cancel&loanID=" + ln.getLoanID() + "\" class=\"btn btn-sm btn-warning\">取消</a></td>");
                                                }
                                                if (ln.getState() == 2) {
                                                    out.println("<td><a href=\"http://127.0.0.1:8080/bankms/p_operateLoanServlet?operate=return&loanID=" + ln.getLoanID() + "\" class=\"btn btn-primary btn-sm\">还贷 </a></td>");
                                                }
                                                out.println("</tr>");
                                            }

                                        }
                                    %>
                                    <%--									<tr>--%>
                                    <%--										<th scope="row">1</th>--%>
                                    <%--										<td>Mark</td>--%>
                                    <%--										<td>Otto</td>--%>
                                    <%--										<td>@mdo</td>--%>
                                    <%--									</tr>--%>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

    </div>
</div>
<!-- JavaScript files-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="js/js.cookie.min.js"></script>
<script src="js/front.js"></script>
</body>
</html>