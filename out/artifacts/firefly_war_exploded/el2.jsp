<%--
  Created by IntelliJ IDEA.
  User: 李箎
  Date: 2019/8/12
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>el表达式</title>
</head>
<body>

    <p>本页面？传参的获取</p>
    ${param.name}****了解
    <p>本页面？传参的获取，key同名时</p>
    ${paramValues.hobby[0]}
    <%--${paramValues}--%>


</body>
</html>
