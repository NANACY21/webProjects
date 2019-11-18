<%@page pageEncoding="gbk"%>
<%@ page import="java.util.Vector" %>
<%@ page import="util.reader.DbReader" %>
<%@ page import="util.reader.FaqReader" %>
<%@ page import="util.Tool" %>
<html>
<head>
    <title>bankms - Java FAQ Welcome Page</title>
    <link rel="stylesheet" href="css/general.css">
</head>
<body>
<h1>Java FAQ Welcome Page</h1>

<p>Welcome to the Java FAQ.Click a link below for answers to the given topic.</p>

<%
    String path = DbReader.getFaq();
    FaqReader faqs = new FaqReader(path);
    Vector categories = faqs.getAllCategories();
    for (int i=0;i<categories.size();i++){
%>
<P>
    <a href="<%=Tool.replaceUnderscore((String)categories.get(i))%>.jsp">
        <%=(String)categories.get(i)%>
    </a>
</P>

<%
    }
%>
</body>
</html>
