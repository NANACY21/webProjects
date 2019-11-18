<%@ page import="util.reader.CountReader" %>
<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
    <link rel="stylesheet" href="<%=path%>/css/footer.css">
    <script src="js/footer.js"></script>
</head>
<body>
<%--尾部--%>
<footer id="footer" class="footer bg-white shadow align-self-end py-3 px-xl-5 w-100">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 text-center text-md-left text-primary">
                <p class="mb-2 mb-md-0" id="h3">
                    <%
                        String count = CountReader.read();
                        out.print("你是第");
                        //int i=0;
                        for(i=0;i<count.length();i++) {
                            String a = count.charAt(i) + "";
                            out.print("<img src=\"/bankms/img/"+a+".gif\" width=\"19\" height=\"30\" border=\"1\"/>");
                        }
                        out.print("个访问本网页的用户");
                    %>
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 text-center text-md-left text-primary">
                <p class="mb-2 mb-md-0">bankms &copy; 2019-2019</p>
            </div>
            <div class="col-md-6 text-center text-md-right text-gray-400">
                <p class="mb-0">Copyright &copy; 2019.Company name All rights reserved.<a target="_blank" href="http://127.0.0.1:8080/bankms/">网上银行系统</a></p>
                <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
            </div>
        </div>
    </div>
</footer>
</body>
</html>
