<%@ page import="java.util.List" pageEncoding="gbk" %>
<%@ page import="vo.Rate" %>
<%@ page import="model.impl.RateServiceImpl" %>
<%@ page import="java.util.Vector" %>
<%@ page import="vo.TR" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 李箎
  Date: 2019/6/25
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" %>
<html>
<head>
    <meta charset="gbk">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>bankms - 结汇和购汇</title>
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
<%--头部--%>
<%@include file="WEB-INF/header.jsp"%>
<%--内容--%>
<div class="d-flex align-items-stretch">
    <%--侧边导航--%>
    <%@include file="WEB-INF/sidebar.jsp"%>
    <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">
            <div class="container">
                <div id="rate" class="jumbotron bg-hover-gradient-violet">
                    <h1>汇率行情</h1>
                    <div class="line"></div>
                    <table class="table table-striped table-sm card-text">
                        <%
                            List rate=(List) session.getAttribute("allRate");
                        %>
                        <thead>
                        <tr>
                            <th>货币名称</th>
                            <th>国家名称</th>
                            <th>银行卖出价</th>
                            <th>银行买入价</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for(Object obj:rate){
                                Rate r=(Rate)obj;
                                out.print("<tr>");
                                out.print("<td>"+r.getCurrencyName()+"</td>");
                                out.print("<td>"+r.getCountryName()+"</td>");
                                out.print("<td>"+r.getSellMoney()+"</td>");
                                out.print("<td>"+r.getBuyMoney()+"</td>");
                                out.print("</tr>");
                            }
                        %>
                        </tbody>
                    </table>
                    <small class="form-text text-muted ml-3">备注：</small>
                    <small class="form-text text-muted ml-3">银行外币卖出价：中国银行定值：800，800人民币->买100美元</small>
                    <small class="form-text text-muted ml-3">银行外币买入价：中国银行定值：800，100美元->在银行结汇800人民币</small>
                </div>
                <div id="FES" class="jumbotron bg-hover-gradient-info">
                    <h1>结汇</h1>
                    <div class="line"></div>
                    <form name="myform" action="FESSubmitServlet" method=post>
                        <table class="table table-striped table-sm card-text">
                            <tr>
                                <td>选择结汇的银行卡</td>
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
                            <tr>
                                <td>
                                    <input type="number" name="money" class="form-control" placeholder="输入结汇金额">
                                </td>
                                <td>
                                    <select name="foreign" class="form-control">
                                        <%
                                            RateServiceImpl Service=new RateServiceImpl();
                                            Vector<String> allCountryName = Service.getAllCurrencyName();
                                            i=0;
                                            for(i=0;i<allCountryName.size();i++){
                                                out.print("<option>"+allCountryName.elementAt(i)+"</option>");
                                            }
                                        %>
                                    </select>
                                </td>
                                <td>
                                    <input type="submit" class="button" id="submit3" value="确定结汇"/>
                                </td>
                            </tr>
                        </table>

                    </form>
                </div>
                <div id="FEP" class="jumbotron bg-hover-gradient-info">
                    <h1>购汇</h1>
                    <div class="line"></div>
                    <form name="myform" id="form1" action="FEPSubmitServlet"  method=post>
                        <tr class="tr">
                            <td>选择需要购买的外币和需要的外币金额（兑换金额）</td>
                            <td>
                                <select id="money" name="money" class="form-control">
                                    <option>100</option>
                                    <option>500</option>
                                    <option>1000</option>
                                    <option>2000</option>
                                    <option>5000</option>
                                </select>
                            </td>
                            <td>
                                <select id="foreign" name="foreign" class="form-control">
                                    <%
                                        Service=new RateServiceImpl();
                                        allCountryName = Service.getAllCurrencyName();
                                        i=0;
                                        for(i=0;i<allCountryName.size();i++){
                                            out.print("<option>"+allCountryName.elementAt(i)+"</option>");
                                        }
                                    %>
                                </select>
                            </td>

                        </tr>
                        <tr class="tr">
                            <td>选择支付的银行卡</td>
                            <td>
                                <select id="cardID" name="cardID" class="form-control">
                                    <%
                                        allBankCards = service.getAllBankCards(Long.parseLong(uID));
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
                                <input type="submit" class="button" id="submit1" value="确定购汇"/>
                            </td>

                        </tr>
                    </form>
                </div>
                <div id="FFTR" class="jumbotron bg-hover-gradient-violet">
                    <h1>结汇和购汇交易记录查询</h1>
                    <div class="line"></div>
                    <table class="table table-striped table-sm card-text">
                        <%
                            ArrayList<TR> FFTR=(ArrayList<TR>) session.getAttribute("FFTR");
                        %>
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
                            for(Object obj:FFTR){
                                TR r=(TR)obj;
                                out.print("<tr>");
                                out.print("<td>"+r.getID()+"</td>");
                                out.print("<td>"+r.getTime()+"</td>");
                                out.print("<td>"+r.getSourceID()+"</td>");
                                out.print("<td>"+r.getMoney()+"</td>");
                                out.print("<td>"+r.getDestinationID()+"</td>");
                                out.print("<td>"+r.getNote()+"</td>");
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
<script type="text/javascript" src="js/lifePay.js"></script>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="js/js.cookie.min.js"></script>
<script src="js/front.js"></script>
</body>
</html>
