<%@ page language="java" contentType="text/html" pageEncoding="gbk"%>
<head>
    <title>bankms - <%=request.getParameter("name")%></title>
    <link rel="stylesheet" href="css/login.css">
</head>
<h1>������Ϸ</h1>
<form action="GuessNumberServlet" method="post">
    <input type="number" placeholder="ϵͳ��һ������1-100֮�䣬�²¿�" class="text" name="myGuess"/>
    <input type="submit" class="button" value="��"/>
    <input type="reset" class="button" value="����"/>
</form>
