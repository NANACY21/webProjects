<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="gbk" %>
<html lang="en">
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <base href="<%=basePath%>">
    <%--WEB-INF内部的页面使用外部的css、js、图片时，需要如下方式--%>
    <link rel="stylesheet" charset="gbk" href="<%=path%>/css/rotationChart.css">
</head>
<body>
<div id="loginBg">
    <div id="image">
        <img src="<%=path%>/img/login_bg.jpg" alt="" class="selected">
        <img src="<%=path%>/img/login_bg2.jpg" alt="">
        <img src="<%=path%>/img/login_bg3.jpg" alt="">
        <img src="<%=path%>/img/login_bg4.jpg" alt="">
    </div>
    <div id="bar">
        <span id="prev">&lt;</span>
        <ul id="number">
            <li class="selected">1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
        </ul>
        <span id="next">&gt;</span>
    </div>
</div>
<br/>
<br/>
</body>
<script type="text/javascript" src="<%=path%>/js/rotationChart.js" charset="gbk"></script>
</html>