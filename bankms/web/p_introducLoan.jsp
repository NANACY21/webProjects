<%@ page import="model.impl.BankCardServiceImpl" %>
<%@ page import="model.impl.NUserServiceImpl" %>
<%@ page import="vo.user.NUser" %>
<%@ page language="java" pageEncoding="gbk"%>

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
<!-- navbar-->

<%@include file="WEB-INF/header.jsp"%>
<div class="d-flex align-items-stretch">
    <%@include file="WEB-INF/sidebar.jsp"%>
    <%
        service = new BankCardServiceImpl();
        NUserServiceImpl nudao=new NUserServiceImpl();
//        long uID;
        if(request.getSession().getAttribute("uID")!=null){
            uID =(String) request.getSession().getAttribute("uID").toString();

        }else{
//            uID = 9L;
        }
        allBc = service.getAllBankCards(Long.parseLong(uID));
        NUser user = nudao.getNUserByuID(Long.parseLong(uID));
    %>
    <%--	内容--%>
    <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">
            <div class="container">
                <h1 class="mt-5">贷款介绍</h1>
                <p>
                    <a href="https://baike.baidu.com/item/%E8%B4%B7%E6%AC%BE" class="btn btn-outline-primary btn-large">了解更多 </a>
                    <a href="http://127.0.0.1:8080/bankms/p_applyLoan.jsp" class="btn btn-primary btn-large">立即申请 </a>
                </p>
            </div>
            <div class="container">
                <div class="jumbotron bg-hover-gradient-info">
                    <h1>贷款种类介绍</h1>
                    <div class="line"></div>
                    <p>贷款分短期、中期与长期贷款。短期贷款，系指贷款期限在1年以内（含1年）的贷款。
                        中期贷款，系指贷款期限在1年以上（不含1年）5年以下（含5年）的贷款。
                        长期贷款，系指贷款期限在5年（不含5年）以上的贷款。</p>
                </div>
                <div class="jumbotron bg-hover-gradient-violet">
                    <h1>贷款利率介绍</h1>
                    <div class="line"></div>
                    <table class="table table-striped table-sm card-text">
                        <thead>
                        <tr>

                            <th>期限</th>
                            <th>年利率</th>
                            <th>逾期年利率</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1年以内(含1年)</td>
                            <td>4.35%</td>
                            <td>6.09%</td>
                        </tr>
                        <tr>
                            <td>1年到5年(含5年)</td>
                            <td>4.75%</td>
                            <td>6.65%</td>
                        </tr>
                        <tr>
                            <td>5年以上</td>
                            <td>4.90%</td>
                            <td>6.86%</td>
                        </tr>
                        </tbody>
                    </table>
                    <small class="form-text text-muted ml-3"> * 以上为央行公布的贷款基准利率，房贷以此为基准上浮或下调。消费、经营贷款各银行利率差异很大，但是一般不会超过5年期利率的4倍。</small>
                    <small class="form-text text-muted ml-3"> * 逾期贷款利息：是由逾期贷款造成的罚利息，具体是指贷款人不按照合同的约定归还借款的超期罚息。一般操作是在原贷款利率的基础上再增加30%-50%的罚息。</small>
                    <small class="form-text text-muted ml-3"> * 最终解释权归本团队所有。</small>
                </div>

                <div class="jumbotron bg-hover-gradient-warning">
                    <h1>其他详情</h1>
                    <div class="line"></div>
                    <h3>贷款额度和期限</h3>
                    <p>每笔贷款最低起贷金额1000元，最高可贷20万。贷款期限最短3个月，最长十年。</p>
                    <h3>贷款发放</h3>
                    <p>贷款将一次性发放到指定银行卡账户中。</p>
                    <h3>贷款偿还</h3>
                    <p>一次性利随本清。</p>
                </div>
            </div>
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