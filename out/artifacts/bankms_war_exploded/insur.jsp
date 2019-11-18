<%@ page import="java.util.Vector" %>
<%@ page import="java.util.List" %>
<%@ page import="vo.insProduct.InsRegular" %>
<%@ page import="vo.InsPolicy" %>
<%@ page language="java" pageEncoding="gbk"%>
<%--贷款介绍--%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="gbk">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>bankms - 保险 - 主页</title>
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
	<!-- Favicon-->
	<link rel="shortcut icon" href="img/favicon.png?3">
	<%--注意引入css顺序--%>
	<link rel="stylesheet" href="css/general.css">
	<link rel="stylesheet" href="css/friendList.css">
	<link rel="stylesheet" href="css/insur.css">
	<!-- Tweaks for older IEs--><!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
	<script src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
<!-- navbar-->
<%@include file="WEB-INF/header.jsp"%>
<div class="d-flex align-items-stretch">
	<%@include file="WEB-INF/sidebar.jsp"%>
	<%--内容--%>
	<div class="page-holder w-100 d-flex flex-wrap">
		<div class="container-fluid px-xl-5">
			<div class="container">
				<h1 class="mt-5">网上银行管理系统代理 - 保险</h1>
				<p>
				<a href="https://baike.baidu.com/item/%E8%B4%B7%E6%AC%BE" class="btn btn-outline-primary btn-large">了解更多</a>
				</p>
			</div>
			<div class="index">
				<a href="#insuringNotice" title="购买保险的注意事项" >投保须知</a>&emsp;
				<a href="#allInsProduct" title="产品中心" >产品中心</a>&emsp;
				<a href="#SSCard" title="办理一张社保卡" >办社保卡</a>&emsp;
				<a href="#myIns" title="我的保险" >我的保险</a>&emsp;
			</div>
			<%--实际内容--%>
			<div class="container">
				<div id="insuringNotice" class="jumbotron bg-hover-gradient-info">
					<h1>投保须知</h1>
					<div class="line"></div>
					<ul>
						<li>这里是购买保险渠道之一 -- 银行代理（本银行即保险代理人）</li>
						<li>投保步骤：</li>
						<ol>
							<li>选中一件保险产品 -> 仔细阅读该产品介绍信息及利益演示图 -></li>
							<li>确认投保后 -> 需要向保险人支付保费即缴费金额（缴费方式：一次性支付或指定账户每月固定从账户扣钱） -></li>
							<li>签署保险合同 -> 获取保单 -> 投保结束。</li>
						</ol>
					</ul>
				</div>
				<div id="allInsProduct" class="jumbotron bg-hover-gradient-info">
					<h1>产品中心</h1>
					<ul>
						<li>这里提供了不同类型的保险产品。</li>
						<li>在这里购买您需要的保险（投保）</li>
					</ul>
					<%
						List allirp=(List) session.getAttribute("allInsRegular");//所有保险产品
						int j=1;
						i=0;
						for(i=0,j=1;i<allirp.size();i++,j++){
							InsRegular irp=(InsRegular) allirp.get(i);
							long id = irp.getID();//当前保险产品id
							out.print("<div class=\"InsProduct\" onclick=\"return InsProductClick("+id+");\">");
							if(j>5){
								j=1;
							}
							out.print("<img src=\"img/InsProduct"+j+".JPG\">");
							out.print(irp.getName()+"&emsp;"+"期交");
							out.print("<br/>");
							out.print("总保费："+irp.getTotalPremium()+"元"+"&emsp;<a href=\"\">了解详情</a>");
							out.print("</div>");
						}
						allirp=null;
					%>
				</div>


				<div class="jumbotron bg-hover-gradient-warning" id="SSCard">
					<h1>社会保障卡</h1>
					<div class="line"></div>
					<h3>社会保障卡</h3>
					<p>社会保障卡</p>
					<h3>社会保障卡</h3>
					<p>社会保障卡。</p>
					<h3>社会保障卡</h3>
					<p>社会保障卡。</p>
				</div>

				<div id="myIns" class="jumbotron bg-hover-gradient-info">
					<h2>我的保险</h2>
					<ul>
						<li>您已购买的全部保险（您现持有的全部保单）。您还可以<a href="">缴纳保险</a>（每月固定从账户扣钱）</li>
						<li><a href="">查看历史交易</a> </li>
					</ul>
					<%
						Vector<InsPolicy> allInsPolicy = (Vector<InsPolicy>) session.getAttribute("allInsPolicy");
						j=1;
						i=0;
						for(i=0,j=1;i<allInsPolicy.size();i++,j++){
							InsPolicy ip=(InsPolicy) allInsPolicy.elementAt(i);
							long id = ip.getID();//当前保单id
							out.print("<div title=\"这是您的保单，点击以查看该保单\" class=\"InsProduct\" onclick=\"return InsPolicyClick("+id+");\">");
							if(j>5){
								j=0;
							}
							out.print("<img src=\"img/InsProduct"+j+".JPG\">");
							out.print("保单号："+ip.getID());
							out.print("</div>");
						}
					%>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="WEB-INF/footer.jsp"%>
<!-- JavaScript files-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="js/js.cookie.min.js"></script>
<script src="js/front.js"></script>
<script>
	//点击任何一个保险产品触发此函数
	function InsProductClick(arg0) {
		location.href="InsProductDetail.jsp?InsProductID="+arg0;
		return false;
	}

	//点击任何一个保单触发此函数
	function InsPolicyClick(arg0) {
		location.href="insPolicy.jsp?insPolicyID="+arg0;
		return false;
	}
</script>
</body>
<script type="text/javascript" src="js/insur.js" charset="GBK"></script>
</html>