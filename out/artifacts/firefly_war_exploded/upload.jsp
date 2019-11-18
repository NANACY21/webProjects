<%--
  Created by IntelliJ IDEA.
  User: 李箎
  Date: 2019/8/12
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
    <title>fileUpload</title>
</head>
<body>
    <div>
        <form action="UploadServlet" method="post" enctype="multipart/form-data">
            <input type="file" name="upload"><br/>
            单文件上传<input type="text" readonly name="title" value="s"><br/>
            <input type="submit" value="上传">
        </form>
    </div>
    <hr/>
    <div>
        <form action="UploadServlet" method="post" enctype="multipart/form-data">
            <input type="file" name="upload"><br/>
            <input type="file" name="upload"><br/>
            <input type="file" name="upload"><br/>
            多文件上传<input type="text" readonly name="title" value="m"><br/>
            <input type="submit" value="上传">
        </form>
    </div>
</body>
</html>
