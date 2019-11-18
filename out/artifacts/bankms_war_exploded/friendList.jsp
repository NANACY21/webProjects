<%@ page import="vo.user.NUser" %>
<%@ page language="java" pageEncoding="gbk"%>
<html>
<head>
	<title>bankms - 主页 - 我的好友列表</title>
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
	<link rel="stylesheet" charset="GBK" href="<%=request.getContextPath()%>/css/header.css">
	<link rel="stylesheet" charset="GBK" href="css/friendList.css">
</head>
<body>
<%@include file="WEB-INF/header.jsp"%>
<div class="d-flex align-items-stretch">
	<%--侧边导航--%>
	<%@include file="WEB-INF/sidebar.jsp"%>
	<div class="page-holder w-100 d-flex flex-wrap">
		<div class="container-fluid px-xl-5">
			<div class="container" style="background-color: #F0F8FF">
				<p>
					<a href="#" onclick="return addFriend(this);" class="btn btn-outline-primary btn-large">添加新好友</a>
					<a href="#" onclick="return deleteFriend();" class="btn btn-outline-primary btn-large">删除选中好友</a>
					<a href="GetAllFriendServlet" class="btn btn-outline-primary btn-large">显示全部好友</a>
					<div class="input-group mb-3">
						<input id="surname" name="surname" type="text" placeholder="输入好友姓氏以模糊查找好友" aria-label="Recipient's username" aria-describedby="button-addon2" class="form-control">
						<div class="input-group-append">
							<button id="query" name="query" type="submit" class="btn btn-primary" onclick="return Query();" value="查询">查询</button>
						</div>
					</div>
				</p>
			</div>
			<div class="container" style="background-color: #F0F8FF">
				<div class="jumbotron bg-hover-gradient-violet">
					<%
						List friends=(List) session.getAttribute("friends");
					%>
					<form name="friendListForm" method="post">
					<table class="table table-striped table-sm card-text">
						<thead>
						<tr>
							<th>修改</th>
							<th>删除&emsp;<a href="#" onclick="chooseAll()" id="label1">全选</a></th>
							<th>姓名</th>
							<th>性别</th>
							<th>年龄</th>
							<th>qq号</th>
							<th>电话号</th>
							<th>邮箱地址</th>
							<th>住址</th>
						</tr>
						</thead>
						<tbody>
						<%
							for(Object obj:friends){
								NUser f = (NUser)obj;
								out.print("<tr>");
								out.print("<td align=\"center\"><input type=\"radio\" name=\"update\" value=\""+f.getuID()+"\"/></td>");
								out.print("<td align=\"center\"><input type=\"checkbox\" name=\"delete\" value=\""+f.getuID()+"\" onclick=\"check(this);\"/></td>");
								out.print("<td>"+f.getName()+"</td>");
								out.print("<td>"+(f.getSex().equals("男")?"男":"女")+"</td>");
								out.print("<td>"+f.getBirthday()+"</td>");
								out.print("<td>"+f.getQq()+"</td>");
								String phoneNumber = f.getTelephone();
								if(phoneNumber==null || phoneNumber.length()==0){
									phoneNumber="&nbsp";
								}
								out.print("<td>"+phoneNumber+"</td>");
								out.print("<td>"+f.getEmail()+"</td>");
								out.print("<td>"+f.getAddress()+"</td>");
								out.print("</tr>");//字符串里的html交给浏览器执行
							}
						%>
						</tbody>
					</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="WEB-INF/footer.jsp"%>

<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="js/js.cookie.min.js"></script>
<script src="js/charts-home.js"></script>
<script src="js/front.js"></script>
</body>
<script type="text/javascript" src="js/show.js" charset="GBK"></script>
</html>