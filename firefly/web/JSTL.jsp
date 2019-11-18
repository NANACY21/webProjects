<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: 李箎
  Date: 2019/8/12
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk"
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>JSTL</title>
</head>
<body>
<h4>运行看效果</h4>
<c:forEach items="${sss}" var="s" begin="1" end="3">
    ${s}<br/>
</c:forEach>

<p>遍历内存Java集合，不会报错报500</p>
<c:forEach items="${students}" var="stu">
    ${stu.name}<br/>
</c:forEach>


<p>有条件的遍历内存Java集合
jstl里没有else</p>
<c:forEach items="${students}" var="stu">

    <c:if test="${stu.name!='lichi01'}">
        ${stu.name}<br/>
    </c:if>
</c:forEach>

<p>把一个数据放作用域里</p>
<h4>运行看效果</h4>
<c:set var="str" value="你好 jstl"></c:set>
${str}<br/>
<c:out value="${str}"></c:out>


<p>choose</p>
<c:choose>
    <c:when test="${not empty str}">
        ${str}
    </c:when>
    <c:otherwise>
        ${str为空空}
    </c:otherwise>
</c:choose>

<hr/>
<c:forEach items="${mapsssss}" var="mapda">
    ${mapda.key}:${mapda.value.name}<br/>

</c:forEach>

<hr>

<%
    pageContext.setAttribute("hhstr", "affffffa,bbd,ccd,ef");

%>
<c:forTokens items="${hhstr}" delims="" var="hss">
    ${hss}<br/>
</c:forTokens>

<hr>
<p>格式化日期</p>
<fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd"></fmt:formatDate>
</body>
</html>
