<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: ��}
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
<h4>���п�Ч��</h4>
<c:forEach items="${sss}" var="s" begin="1" end="3">
    ${s}<br/>
</c:forEach>

<p>�����ڴ�Java���ϣ����ᱨ��500</p>
<c:forEach items="${students}" var="stu">
    ${stu.name}<br/>
</c:forEach>


<p>�������ı����ڴ�Java����
jstl��û��else</p>
<c:forEach items="${students}" var="stu">

    <c:if test="${stu.name!='lichi01'}">
        ${stu.name}<br/>
    </c:if>
</c:forEach>

<p>��һ�����ݷ���������</p>
<h4>���п�Ч��</h4>
<c:set var="str" value="��� jstl"></c:set>
${str}<br/>
<c:out value="${str}"></c:out>


<p>choose</p>
<c:choose>
    <c:when test="${not empty str}">
        ${str}
    </c:when>
    <c:otherwise>
        ${strΪ�տ�}
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
<p>��ʽ������</p>
<fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd"></fmt:formatDate>
</body>
</html>
