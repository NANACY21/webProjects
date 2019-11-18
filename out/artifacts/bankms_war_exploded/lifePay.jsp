<%@ page import="model.impl.BankCardServiceImpl" %>
<%@ page import="vo.card.BankCard" %>
<%@ page import="java.util.List" %>
<%@ page import="model.impl.NUserServiceImpl" %><%--若出错则跳转此页面--%>
<%--<%@ page errorPage="WEB-INF/error.jsp" %>--%>
<%@ page language="java" pageEncoding="gbk"%>
<html>
<head>
    <meta charset="gbk">
    <title>bankms - 生活缴费、缴纳学费</title>
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
    <link rel="stylesheet" href="css/login.css">
    <%--<link rel="stylesheet" href="css/general.css">--%>
</head>
<body>
<%--头部--%>
<%@include file="WEB-INF/header.jsp"%>
<%--内容--%>
<div class="d-flex align-items-stretch">
    <%--侧边导航--%>
    <%@include file="WEB-INF/sidebar.jsp"%>
    <div class="page-holder w-100 d-flex flex-wrap">
        <div id="payment1">
            <form name="myform" action="LifePayServlet" method=post>
                <tr class="tr">
                    <td align="right" class="edge_td">
                        <h2>手机号&emsp;</h2>
                    </td>
                    <td align="left" colspan="2" class="mid_td">
                        <input  placeholder="想充值的手机号" type="text" class="form-control" name="phonenumber" id="phoneNumber" autocomplete="off" onclick=this.value=""; />
                    </td>
                </tr>
                <tr class="tr">
                    <td>
                        <h2>选择你的充值金额</h2>
                    </td>
                    <td>
                        <select name="phoneMoney" class="form-control">
                            <option>10</option>
                            <option>20</option>
                            <option>30</option>
                            <option>50</option>
                            <option>100</option>
                            <option>200</option>
                        </select>
                    </td>
                    <td>元</td>
                </tr>
                <tr align="center" class="tr">
                    <td>选择付款账户</td>
                    <td>
                        <select name="cardID" class="form-control">
                            <%
                                List<BankCard> allBankCards = service.getAllBankCards(Long.parseLong(uID));
                                for (i=0;i<allBankCards.size();i++){
                                    out.print("<option>"+allBankCards.get(i).getID()+"</option>");
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr align="center" class="tr">
                    <td></td>
                    <td align="center" colspan="1">
                        <input type="submit" class="button" id="submit" value="付款" onclick="return paymentmobile();"/>
                    </td>
                    <td align="center" colspan="1">
                        <input type="reset" class="button" value="重置"/>
                    </td>
                </tr>
            </form>
        </div>

        <div id="payment2">
            <form name="myform" method=post>
                <tr class="tr">
                    <td>
                        <h2>选择你的学校&emsp;</h2>
                    </td>
                    <td>
                        <select id="school" name="school" class="form-control">
                            <option>黑龙江大学</option>
                        </select>
                    </td>
                </tr>
                <tr align="center" class="tr">
                    <td></td>
                    <td align="center" colspan="1">
                        <input type="submit" class="button" id="submit1" value="付款" onclick="return tuition();"/>
                    </td>
                    <td align="center" colspan="1">
                        <input type="reset" class="button" value="重置"/>
                    </td>
                </tr>
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


<script type="text/javascript" src="js/lifePay.js" charset="GBK"></script>

</html>
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
<jsp:include page="WEB-INF/footer.jsp"></jsp:include>