<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <link type="text/css" href="<%=path%>/css/style.css" rel="stylesheet" />
    <script type="text/javascript" src="<%=path%>/js/tools.js" charset="gbk"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery-3.2.1.min.js" charset="gbk"></script>
    <script type="text/javascript" src="<%=path%>/js/js.js" charset="gbk"></script>
</head>
<body>
    <div class="wrap" id="wrap">
        <ul class="content"></ul>
        <a href="javascript:;" class="prev">&#60;</a>
        <a href="javascript:;" class="next">&#62;</a>
    </div>
</body>
</html>
