<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="vo.Map" %>
<%@ page import="java.util.ArrayList" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
    <meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
    <meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
    <title>bankms - 百度地图API自定义地图</title>
    <!--引用百度地图API-->
    <link rel="stylesheet" href="css/map.css">
    <script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
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
    <link rel="stylesheet" href="css/main.css">
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
        <!--百度地图容器-->
        <div style="width:100%;height:600px;border:#ccc solid 1px;" id="dituContent"></div>
    </div>
    <table class="table table-striped table-sm card-text">
        <tr border="1">
            <td>您的位置&emsp;</td>
            <td><input type='text' id='myX'name='myX' /></td>
            <td><input type='text' id='myY'name='myY' /></td>
        </tr>
        <img src="">
    </table>
    <%
        ArrayList getmap2=(ArrayList) session.getAttribute("map");
        out.print("网点总数:"+getmap2.size());
    %>
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

<script type="text/javascript" src="js/map.js"></script>
<%
    //标注点数组
    ArrayList getmap=(ArrayList) session.getAttribute("map");
    out.print("<script>var markerArr= [");
    for (i=0;i<getmap.size();i++) {
        Map mapi=(Map)getmap.get(i);
        out.print("{title:\""+mapi.getname()+"\",content:\""+mapi.getContent()+"\",point:\""+mapi.getx()+"|"+mapi.gety()+"\",isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}"
        );
        if (i!=getmap.size()-1)
        {out.print(",");}

    }
    out.print("];</script>");
%>

</html>