<%@ page import="vo.Student" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: ��}
  Date: 2019/8/11
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
    <title>el���ʽ</title>
</head>
<body>

<%
    Student student = new Student();
    student.setAge(166);

    /*Ĭ�Ϸ���page��������
    ��3������1��page������2��request������3��session������

    ����ʹ��el���ʽ
     */
    pageContext.setAttribute("student",student);
%>
<%--�滻<%=%>--%>
${"lichi"}

${3+6}<br/>
${3>6}<br/>
${student.age}****����<br/>

�Ҳ�������""����session����null<br/>
${sessionScope.student.age}<br/>
${requestScope.student.age}<br/>
${pageScope.student.age}<br/>

�ж�name��Ա�����Ƿ�Ϊ��<br/>
${empty student.name}<br/>


ltС��<br/>
leС�ڵ���<br/>
gt����<br/>
${2 lt 3}<br/>
${2 le 2 and 3 gt 2}<br/>


����map����<br/>

<%
    Map map = new HashMap();
    map.put("studen", student);
    pageContext.setAttribute("map", map);
%>
${map["studen"].age}
${1>2?3:4}
</body>
</html>