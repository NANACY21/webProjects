<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="vo.TR" %>
<html>
<head>
    <meta charset="gbk">
    <title>bankms - ��ʾһ�����п��Ľ��׼�¼</title>
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
<%--ͷ��--%>
<%@include file="WEB-INF/header.jsp"%>
<%--����--%>
<div class="d-flex align-items-stretch">
    <%--��ߵ���--%>
    <%@include file="WEB-INF/sidebar.jsp"%>
    <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">
            <div class="container" style="background-color: #F0F8FF">
                <p>
                    <a href="AccountTRServlet?condition=20" title="���20���ӵ��˻����׼�¼" class="btn btn-outline-primary btn-large">���20����</a>
                    <a href="AccountTRServlet?condition=10"  title="���10���ӵ��˻����׼�¼" class="btn btn-outline-primary btn-large">���10����</a>
                    <a href="AccountTRServlet?condition=5"  title="���5���ӵ��˻����׼�¼" class="btn btn-outline-primary btn-large">���5����</a>
                    <a href="AccountTRServlet?condition=1"  title="���1���ӵ��˻����׼�¼" class="btn btn-outline-primary btn-large">���1����</a>
                    <a href="AccountTRServlet?condition=10000"  title="�������п���ȫ�����׼�¼" class="btn btn-outline-primary btn-large">�������п���ȫ�����׼�¼</a>
                    <select class="form-control">
                        <option>������</option>
                        <option>΢��֧�����</option>
                        <option>����</option>
                        <option>���</option>
                        <option>����</option>
                        <option>�����</option>
                        <option>����</option>
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
                            <th>���׺�</th>
                            <th>����ʱ��</th>
                            <th>Դ�˻�ID</th>
                            <th>���׽��</th>
                            <th>Ŀ���˻�ID</th>
                            <th>��ע</th>
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
<%--ģ��--%>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="js/js.cookie.min.js"></script>
<script src="js/charts-home.js"></script>
<script src="js/front.js"></script>
</body>

<%--�ҵ�--%>
<script type="text/javascript" src="js/show.js" charset="GBK"></script>
</html>