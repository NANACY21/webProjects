<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="vo.TR" %>
<html>
<head>
    <meta charset="gbk">
    <title>bankms - 显示一张银行卡的交易记录</title>
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
    <link rel="stylesheet" charset="GBK" href="css/friendList.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<%--头部--%>
<%@include file="WEB-INF/header.jsp"%>
<%--内容--%>
<div class="d-flex align-items-stretch">
    <%--侧边导航--%>
    <%@include file="WEB-INF/sidebar.jsp"%>
    <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">
            <div class="container" style="background-color: #F0F8FF">
                <p>
                    <a href="AccountTRServlet?condition=20" title="最近20分钟的账户交易记录" class="btn btn-outline-primary btn-large">最近20分钟</a>
                    <a href="AccountTRServlet?condition=10"  title="最近10分钟的账户交易记录" class="btn btn-outline-primary btn-large">最近10分钟</a>
                    <a href="AccountTRServlet?condition=5"  title="最近5分钟的账户交易记录" class="btn btn-outline-primary btn-large">最近5分钟</a>
                    <a href="AccountTRServlet?condition=1"  title="最近1分钟的账户交易记录" class="btn btn-outline-primary btn-large">最近1分钟</a>
                    <a href="AccountTRServlet?condition=10000"  title="这张银行卡的全部交易记录" class="btn btn-outline-primary btn-large">这张银行卡的全部交易记录</a>
                    <select class="form-control">
                        <option>购买保险</option>
                        <option>微信支付存款</option>
                        <option>话费</option>
                        <option>结汇</option>
                        <option>购汇</option>
                        <option>贷款发放</option>
                        <option>还贷</option>
                    </select>
                </p>
            </div>
            <div class="container" style="background-color: #F0F8FF">
                <div class="jumbotron bg-hover-gradient-violet">
                    <%
                        List<TR> allTR=(List<TR>) session.getAttribute("allTR");
                    %>
                    <table class="table table-striped table-sm card-text">
                        <thead>
                        <tr>
                            <th>交易号</th>
                            <th>交易时间</th>
                            <th>源账户ID</th>
                            <th>交易金额</th>
                            <th>目标账户ID</th>
                            <th>备注</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for(Object obj:allTR){
                                TR f=(TR)obj;
                                out.print("<tr>");
                                out.print("<td>"+f.getID()+"</td>");
                                out.print("<td>"+f.getTime()+"</td>");
                                out.print("<td>"+f.getSourceID()+"</td>");
                                out.print("<td>"+f.getMoney()+"</td>");
                                out.print("<td>"+f.getDestinationID()+"</td>");
                                out.print("<td>"+f.getNote()+"</td>");
                                out.print("</tr>");
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="WEB-INF/footer.jsp"%>
<%--模板--%>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="js/js.cookie.min.js"></script>
<script src="js/charts-home.js"></script>
<script src="js/front.js"></script>
</body>

<%--我的--%>
<script type="text/javascript" src="js/show.js" charset="GBK"></script>
</html>