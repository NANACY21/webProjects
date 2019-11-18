<%@ page import="vo.Student" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: 李箎
  Date: 2019/8/11
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
    <title>el表达式</title>
</head>
<body>

<%
    Student student = new Student();
    student.setAge(166);

    /*默认放在page作用域里
    第3个参数1：page作用域，2：request作用域，3：session作用域

    才能使用el表达式
     */
    pageContext.setAttribute("student",student);
%>
<%--替换<%=%>--%>
${"lichi"}

${3+6}<br/>
${3>6}<br/>
${student.age}****记忆<br/>

找不到返回""，而session返回null<br/>
${sessionScope.student.age}<br/>
${requestScope.student.age}<br/>
${pageScope.student.age}<br/>

判断name成员变量是否为空<br/>
${empty student.name}<br/>


lt小于<br/>
le小于等于<br/>
gt大于<br/>
${2 lt 3}<br/>
${2 le 2 and 3 gt 2}<br/>


访问map对象<br/>

<%
    Map map = new HashMap();
    map.put("studen", student);
    pageContext.setAttribute("map", map);
%>
${map["studen"].age}
${1>2?3:4}
</body>
</html>