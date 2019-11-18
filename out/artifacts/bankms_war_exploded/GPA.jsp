<%@ page language="java" pageEncoding="gbk"%>
<html>
<head>
    <title>bankms - �����ѯ</title>
    <%--ģ��--%>
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
        <form id="form1" action="GPAServlet" method="post">
            <table class="table" border="1">
                <tr class="tr">
                    <td class="edge_td">
                        <input required type="text" class="text" id="courseNumber" placeholder="��ѧ���޶��Ŀγ���" onclick=this.value="" />
                    </td>
                    <td class="edge_td">
                        <input type="button" id="next" class="button" value="��һ��" onclick="addInput()"/>
                    </td>
                    <td class="edge_td">
                        <input type="reset" id="re" class="button" value="����"/>
                    </td>
                </tr>
            </table>
            <div id="scores" style="border: 1px" align="left"></div>
            <%
                if(session.getAttribute("ap")!=null){
                    out.println((String) session.getAttribute("ap"));
                }
            %>
        </form>
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

<script type="text/javascript" src="js/GPA.js" charset="GBK"></script>

</html>

<%--<%@ include file="/WEB-INF/footer.jsp"%>--%>