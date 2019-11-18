<%@ page import="util.reader.DbReader" %>
<%@ page import="java.util.Vector" %><%--跳转到此页面我们需要知道银行卡id - cardID--%>
<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>bankms - 主页 - 账户管理</title>
    <%--账户ID需要加session--%>
    <link rel="stylesheet" href="css/friendList.css">
    <link rel="stylesheet" href="css/general.css">

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

    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<body>
<%--头部--%>
<%@include file="WEB-INF/header.jsp"%>
<%--内容--%>
<div class="d-flex align-items-stretch">
    <%--侧边导航--%>
    <%@include file="WEB-INF/sidebar.jsp"%>
    <div class="index">
        <%
            String cardID = session.getAttribute("cardID").toString();
        %>
        账户管理&emsp;账户：<label><%=cardID%></label>
        <a title="查询普通/外币余额" data-toggle="modal" data-target="#AccountMoney">查询账户余额</a>
        <a title="存款，你还可以存死期" data-toggle="modal" data-target="#SaveMoney">存款</a>
        <a title="转账，要经手第三方，24小时内可反悔" data-toggle="modal" data-target="#TransferAccount">转账</a>
        <a href="AccountTRServlet?condition=10000">账户交易记录</a>
        <a data-toggle="modal" data-target="#AccountUpdatePw">更改账户密码</a>
    </div>
</div>

<%--账户余额--%>
<div id="AccountMoney" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="exampleModalLabelPwr" class="modal-title">银行卡&emsp;<%=cardID%></h4>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
            </div>
            <%
                String yue = service.accountMoney(Long.parseLong(cardID)) + "";
                Vector<String> waiBi = DbReader.getWaiBi(Long.parseLong(cardID));
            %>
            <div class="modal-body">
                <p>账户余额：<%=yue%><label></label></p>
            </div>
            <div class="modal-body">
                <p>加拿大元余额：<%=waiBi.elementAt(0)%><label></label></p>
            </div>
            <div class="modal-body">
                <p>美元余额：<%=waiBi.elementAt(1)%><label></label></p>
            </div>
            <div class="modal-body">
                <p>日元余额：<%=waiBi.elementAt(2)%><label></label></p>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-secondary">确定</button>
            </div>
        </div>
    </div>
</div>

<%--该账户密码对话框--%>
<div id="AccountUpdatePw" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="exampleModalLabelPw" class="modal-title">更改账户密码</h4>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <p>更改账户密码</p>
                <form action="AccountUpdatePwServlet?Jsp=<%=this.getClass().getSimpleName().replaceAll("_",".")%>&cardID=<%=cardID%>" method="post">
                    <div class="form-group">
                        <label>旧密码(6位数字)</label>
                        <input type="password" maxlength="6" placeholder="旧密码(6位数字)" class="form-control" id="oldPw" name="oldPw">
                    </div>
                    <div class="form-group">
                        <label>新密码(6位数字)</label>
                        <input type="password" maxlength="6" placeholder="新密码(6位数字)" class="form-control" id="newPw" name="newPw">
                    </div>
                    <div class="form-group">
                        <input type="submit" value="确定" class="btn btn-primary">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-secondary">取消</button>
                <button type="button" class="btn btn-primary">暂时保存修改</button>
            </div>
        </div>
    </div>
</div>

<%--存款对话框--%>
<div id="SaveMoney" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="SaveMoneyServlet" class="modal-title">账户存款</h4>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
            </div>
            <div id="saoma">
                <img src="img/ma.png" style="width: 150px" height="150px">
            </div>
            <div class="modal-body">
                <p>账户存款</p>
                <form action="SaveMoneyServlet?Jsp=<%=this.getClass().getSimpleName().replaceAll("_",".")%>&cardID=<%=cardID%>" method="post">
                    <div class="form-group">
                        <label>账号</label>
                        <input type="text" value="<%=cardID%>" placeholder="账号" class="form-control" id="cardID" name="cardID">
                    </div>
                    <div class="form-group">
                        <label>金额</label>
                        <select class="form-control" id="money" name="money">
                            <option>10</option>
                            <option>50</option>
                            <option>100</option>
                            <option>500</option>
                            <option>1000</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="我已扫码" class="btn btn-primary" onclick="return saveMoney();">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-secondary">取消</button>
                <button type="button" class="btn btn-primary">暂时保存修改</button>
            </div>
        </div>
    </div>
</div>


<%--转账对话框--%>
<div id="TransferAccount" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="TransferAccountServlet" class="modal-title">账户转账</h4>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <p>账户转账</p>
                <form action="TransferAccountServlet?Jsp=<%=this.getClass().getSimpleName().replaceAll("_",".")%>&cardID=<%=cardID%>" method="post">
                    <div class="form-group">
                        <label>我的账号</label>
                        <input type="text" value="<%=cardID%>" placeholder="账号" class="form-control" name="cardID" id="cardID1">
                    </div>
                    <div class="form-group">
                        <label>目标账号</label>
                        <input type="text" placeholder="输入要转入的银行卡号(16位数字)" class="form-control" id="destinationID" name="destinationID">
                    </div>
                    <div class="form-group">
                        <label>转账金额</label>
                        <input type="text" placeholder="输入存款金额" class="form-control" id="money2" name="money">
                    </div>
                    <div class="form-group">
                        <input type="submit" value="确定" class="btn btn-primary" onclick="return transferAccount();">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-secondary">取消</button>
                <button type="button" class="btn btn-primary">暂时保存修改</button>
            </div>
        </div>
    </div>
</div>

<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="js/js.cookie.min.js"></script>
<script src="js/front.js"></script>

</body>
<script type="text/javascript" charset="gbk" src="js/account.js"></script>
</html>
