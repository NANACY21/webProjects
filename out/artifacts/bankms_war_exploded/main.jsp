<%--main.jsp防倒退

若出错则跳转error.jsp--%>
<%@ page errorPage="WEB-INF/error.jsp" %>
<%@ page language="java" pageEncoding="gbk"%>
<html>
<head>
	<title>bankms - 主页</title>
	<%--模板--%>
	<meta charset="gbk">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="robots" content="all,follow">
	<!-- Bootstrap CSS-->
	<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome CSS-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<!-- Google fonts - Popppins for copy-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
	<!-- orion icons-->
	<link rel="stylesheet" href="css/orionicons.css">
	<!-- theme stylesheet-->
	<link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
	<!-- Custom stylesheet - for your changes-->
	<link rel="stylesheet" href="css/custom.css">
	<!-- Tweaks for older IEs--><!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
	<%--我的--%>
	<link rel="stylesheet" charset="gbk" href="<%=request.getContextPath()%>/css/header.css">
	<link rel="stylesheet" charset="gbk" href="<%=request.getContextPath()%>/css/friendList.css">
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/main.js"></script>
</head>
<body>
<%--头部--%>
<%@include file="WEB-INF/header.jsp"%>
<%--内容--%>
<div class="d-flex align-items-stretch">
	<%--侧边导航--%>
	<%@include file="WEB-INF/sidebar.jsp"%>
	<div class="page-holder w-100 d-flex flex-wrap">
		<div class="index">
		</div>
		<jsp:include page="WEB-INF/rC.jsp"></jsp:include>
	</div>
</div>
<%@include file="WEB-INF/footer.jsp"%>
<%--模板--%>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="js/js.cookie.min.js"></script>
<script src="js/charts-home.js"></script>
<script src="js/front.js"></script>
</body>

</html>