<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<%
    String path=request.getContextPath();
%>
<html>
<head>
    <link rel="stylesheet" charset="gbk" href="<%=request.getContextPath()%>/css/header.css">
    <link rel="stylesheet" href="css/main.css">
    <%--<link rel="stylesheet" href="css/general.css">--%>
</head>
<body>
<header class="header" id="header" title="本网上银行为您的银行卡业务提供便捷服务">
    <nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow">
        <a href="#" class="sidebar-toggler text-gray-500 mr-4 mr-lg-5 lead">
            <img title="网上银行管理系统" src="<%=path%>/img/login_bg2.jpg" border="0px">
        </a>
        <a id="h1" title="点击以回到主页" href="main.jsp" class="navbar-brand font-weight-bold text-uppercase text-base">
            <label>银行管理系统</label>
        </a>
        <ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
            <li class="nav-item dropdown mr-3">
                <a id="notifications" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle text-gray-400 px-1">
                    <i class="fa fa-bell">
                    </i>
                    <span class="notification-icon">
                    </span>
                </a>
                <div aria-labelledby="notifications" class="dropdown-menu">
                    <a href="#" class="dropdown-item">
                        <div class="d-flex align-items-center">
                            <div class="icon icon-sm bg-violet text-white">
                                <%--<i class="fab fa-twitter"></i>--%>
                            </div>
                            <div class="text ml-2">
                                <p class="mb-0">You have 2 followers</p>
                            </div>
                        </div>
                    </a>
                    <a href="#" class="dropdown-item">
                        <div class="d-flex align-items-center">
                            <div class="icon icon-sm bg-green text-white">
                                <%--<i class="fas fa-envelope"></i>--%>
                            </div>
                            <div class="text ml-2">
                                <p class="mb-0">You have 6 new messages</p>
                            </div>
                        </div>
                    </a>
                    <a href="#" class="dropdown-item">
                        <div class="d-flex align-items-center">
                            <div class="icon icon-sm bg-blue text-white">
                                <%--<i class="fas fa-upload"></i>--%>
                            </div>
                            <div class="text ml-2">
                                <p class="mb-0">Server rebooted</p>
                            </div>
                        </div>
                    </a>
                    <a href="#" class="dropdown-item">
                        <div class="d-flex align-items-center">
                            <div class="icon icon-sm bg-violet text-white">
                                <%--<i class="fab fa-twitter"></i>--%>
                            </div>
                            <div class="text ml-2">
                                <p class="mb-0">You have 2 followers</p>
                            </div>
                        </div>
                    </a>
                    <div class="dropdown-divider">

                    </div>
                    <a href="#" class="dropdown-item text-center">
                        <small class="font-weight-bold headings-font-family text-uppercase">查看所有通知
                        </small>
                    </a>
                </div>
            </li>
        </ul>
    </nav>
</header>

</body>
</html>
