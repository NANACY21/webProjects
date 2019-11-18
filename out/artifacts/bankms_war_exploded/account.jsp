<%@ page import="util.reader.DbReader" %>
<%@ page import="java.util.Vector" %><%--��ת����ҳ��������Ҫ֪�����п�id - cardID--%>
<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>bankms - ��ҳ - �˻�����</title>
    <%--�˻�ID��Ҫ��session--%>
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
<%--ͷ��--%>
<%@include file="WEB-INF/header.jsp"%>
<%--����--%>
<div class="d-flex align-items-stretch">
    <%--��ߵ���--%>
    <%@include file="WEB-INF/sidebar.jsp"%>
    <div class="index">
        <%
            String cardID = session.getAttribute("cardID").toString();
        %>
        �˻�����&emsp;�˻���<label><%=cardID%></label>
        <a title="��ѯ��ͨ/������" data-toggle="modal" data-target="#AccountMoney">��ѯ�˻����</a>
        <a title="���㻹���Դ�����" data-toggle="modal" data-target="#SaveMoney">���</a>
        <a title="ת�ˣ�Ҫ���ֵ�������24Сʱ�ڿɷ���" data-toggle="modal" data-target="#TransferAccount">ת��</a>
        <a href="AccountTRServlet?condition=10000">�˻����׼�¼</a>
        <a data-toggle="modal" data-target="#AccountUpdatePw">�����˻�����</a>
    </div>
</div>

<%--�˻����--%>
<div id="AccountMoney" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="exampleModalLabelPwr" class="modal-title">���п�&emsp;<%=cardID%></h4>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">��</span></button>
            </div>
            <%
                String yue = service.accountMoney(Long.parseLong(cardID)) + "";
                Vector<String> waiBi = DbReader.getWaiBi(Long.parseLong(cardID));
            %>
            <div class="modal-body">
                <p>�˻���<%=yue%><label></label></p>
            </div>
            <div class="modal-body">
                <p>���ô�Ԫ��<%=waiBi.elementAt(0)%><label></label></p>
            </div>
            <div class="modal-body">
                <p>��Ԫ��<%=waiBi.elementAt(1)%><label></label></p>
            </div>
            <div class="modal-body">
                <p>��Ԫ��<%=waiBi.elementAt(2)%><label></label></p>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-secondary">ȷ��</button>
            </div>
        </div>
    </div>
</div>

<%--���˻�����Ի���--%>
<div id="AccountUpdatePw" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="exampleModalLabelPw" class="modal-title">�����˻�����</h4>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">��</span></button>
            </div>
            <div class="modal-body">
                <p>�����˻�����</p>
                <form action="AccountUpdatePwServlet?Jsp=<%=this.getClass().getSimpleName().replaceAll("_",".")%>&cardID=<%=cardID%>" method="post">
                    <div class="form-group">
                        <label>������(6λ����)</label>
                        <input type="password" maxlength="6" placeholder="������(6λ����)" class="form-control" id="oldPw" name="oldPw">
                    </div>
                    <div class="form-group">
                        <label>������(6λ����)</label>
                        <input type="password" maxlength="6" placeholder="������(6λ����)" class="form-control" id="newPw" name="newPw">
                    </div>
                    <div class="form-group">
                        <input type="submit" value="ȷ��" class="btn btn-primary">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-secondary">ȡ��</button>
                <button type="button" class="btn btn-primary">��ʱ�����޸�</button>
            </div>
        </div>
    </div>
</div>

<%--���Ի���--%>
<div id="SaveMoney" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="SaveMoneyServlet" class="modal-title">�˻����</h4>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">��</span></button>
            </div>
            <div id="saoma">
                <img src="img/ma.png" style="width: 150px" height="150px">
            </div>
            <div class="modal-body">
                <p>�˻����</p>
                <form action="SaveMoneyServlet?Jsp=<%=this.getClass().getSimpleName().replaceAll("_",".")%>&cardID=<%=cardID%>" method="post">
                    <div class="form-group">
                        <label>�˺�</label>
                        <input type="text" value="<%=cardID%>" placeholder="�˺�" class="form-control" id="cardID" name="cardID">
                    </div>
                    <div class="form-group">
                        <label>���</label>
                        <select class="form-control" id="money" name="money">
                            <option>10</option>
                            <option>50</option>
                            <option>100</option>
                            <option>500</option>
                            <option>1000</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="����ɨ��" class="btn btn-primary" onclick="return saveMoney();">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-secondary">ȡ��</button>
                <button type="button" class="btn btn-primary">��ʱ�����޸�</button>
            </div>
        </div>
    </div>
</div>


<%--ת�˶Ի���--%>
<div id="TransferAccount" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="TransferAccountServlet" class="modal-title">�˻�ת��</h4>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">��</span></button>
            </div>
            <div class="modal-body">
                <p>�˻�ת��</p>
                <form action="TransferAccountServlet?Jsp=<%=this.getClass().getSimpleName().replaceAll("_",".")%>&cardID=<%=cardID%>" method="post">
                    <div class="form-group">
                        <label>�ҵ��˺�</label>
                        <input type="text" value="<%=cardID%>" placeholder="�˺�" class="form-control" name="cardID" id="cardID1">
                    </div>
                    <div class="form-group">
                        <label>Ŀ���˺�</label>
                        <input type="text" placeholder="����Ҫת������п���(16λ����)" class="form-control" id="destinationID" name="destinationID">
                    </div>
                    <div class="form-group">
                        <label>ת�˽��</label>
                        <input type="text" placeholder="��������" class="form-control" id="money2" name="money">
                    </div>
                    <div class="form-group">
                        <input type="submit" value="ȷ��" class="btn btn-primary" onclick="return transferAccount();">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-secondary">ȡ��</button>
                <button type="button" class="btn btn-primary">��ʱ�����޸�</button>
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
