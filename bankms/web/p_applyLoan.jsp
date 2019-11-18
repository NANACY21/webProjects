<%@ page import="model.impl.BankCardServiceImpl" %>
<%@ page import="vo.card.BankCard" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.impl.NUserDaoImpl" %>
<%@ page import="vo.user.NUser" %>
<%@ page import="model.impl.NUserServiceImpl" %>
<%@ page language="java" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="gbk">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
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
    <%--内容--%>
    <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">
            <section class="py-5">
                <div class="row">
                    <!-- Form Elements -->
                    <div class="col-lg-12 mb-5">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="h6 text-uppercase mb-0">贷款申请</h3>
                            </div>
                            <div class="card-body">
                                <form class="form-horizontal" action = "p_applyLoanServlet" method="post">
                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">姓名</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="userName" value="<%=user.getName()%>">
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">身份证号</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="userID" value="<%=user.getID()%>">
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">贷款金额</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="amount" placeholder="1000-200000之间">
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">选择还款银行卡</label>
                                        <div class="col-md-9 select mb-3">
                                            <select name="cardID" class="form-control">
                                                <%
                                                    for (i=0;i<allBc.size();i++){
                                                        out.println("<option value = "+allBc.get(i).getID()+">"+allBc.get(i).getID()+"</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="line"></div>


                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">贷款时间</label>
                                        <div class="col-md-9 select mb-3">
                                            <select name="loanTime" class="form-control">
                                                <option value="3">3个月(年利率:4.35%)</option>
                                                <option value="6">6个月(年利率:4.35%)</option>
                                                <option value="12">一年(年利率:4.35%)</option>
                                                <option value="36">三年(年利率:4.75%)</option>
                                                <option value="60">五年(年利率:4.75%)</option>
                                                <option value="120">十年(年利率:4.90%)</option>
                                            </select>
                                            <small class="form-text text-muted ml-3"> * 一个月按30天计；一年按360天计。</small>
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <div class="col-md-9 ml-auto">
                                            <button type="reset" class="btn btn-secondary">重置</button>
                                            <button type="submit" class="btn btn-primary">申请</button>
                                        </div>
                                    </div>
                                </form>
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