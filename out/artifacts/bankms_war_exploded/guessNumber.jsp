<%@ page language="java" contentType="text/html" pageEncoding="gbk"%>
<head>
    <title>bankms - <%=request.getParameter("name")%></title>
    <link rel="stylesheet" href="css/login.css">
</head>
<h1>猜数游戏</h1>
<form action="GuessNumberServlet" method="post">
    <input type="number" placeholder="系统有一个数，1-100之间，猜猜看" class="text" name="myGuess"/>
    <input type="submit" class="button" value="猜"/>
    <input type="reset" class="button" value="重置"/>
</form>
