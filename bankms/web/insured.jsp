<%@ page import="java.util.Vector" %>
<%@ page import="vo.insProduct.InsRegular" %>
<%@ page import="vo.user.ActiveUser" %>
<%@ page import="model.impl.BankCardServiceImpl" %>
<%@ page import="vo.card.BankCard" %>
<%@ page import="java.util.List" %>
<%@ page language="java" pageEncoding="gbk"%>
<%--申请贷款，填写表单--%>
<!DOCTYPE html>
<html>
<head>
	<title>bankms - 保险 - 投保</title>
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
	<!-- Favicon-->
	<link rel="shortcut icon" href="img/favicon.png?3">
	<!-- Tweaks for older IEs--><!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
<!-- navbar-->
<%@include file="WEB-INF/header.jsp"%>
<div class="d-flex align-items-stretch">
	<%@include file="WEB-INF/sidebar.jsp"%>
	<%--内容--%>

	<div class="page-holder w-100 d-flex flex-wrap">
		<div class="container-fluid px-xl-5">
			<section class="py-5">
				<div class="row">
					<!-- Form Elements -->
					<div class="col-lg-12 mb-5">
						<div class="card">
							<div class="card-header">
								<h3 class="h6 text-uppercase mb-0">购买保险</h3>
							</div>
							<div class="card-body">
								<%--在这里再次显示该保险产品--%>
								<form class="form-horizontal" action = "InsuredServlet" method="post">
									<div class="form-group row">
										<%--得到投保人姓名ID--%>
										<label class="col-md-3 form-control-label">付款账户</label>
										<div class="col-md-9">
											<select name="cardID" class="form-control">
												<%
													i=0;
													int j=0;
													String uID1 = session.getAttribute("uID").toString();
													service=new BankCardServiceImpl();
													List<BankCard> cards = service.getAllBankCards(Long.parseLong(uID1));
													for(j=0;j<cards.size();j++){
														out.print("<option>"+cards.get(j).getID()+"</option>");
													}
												%>
											</select>
										</div>
									</div>
									<div class="line"></div>

									<div class="form-group row">
										<label class="col-md-3 form-control-label">保险产品总保费</label>
										<div class="col-md-9">
											<input type="text" readonly class="form-control" name="TotalPremium" value="<%=((InsRegular)(session.getAttribute("currentIrp"))).getTotalPremium()%>"/>
										</div>
									</div>
									<div class="line"></div>

									<div class="form-group row">
										<label class="col-md-3 form-control-label">受保人身份证号</label>
										<div class="col-md-9">
											<input type="text" maxlength="18" class="form-control" name="insuredID"/>
										</div>
									</div>
									<div class="line"></div>

									<div class="form-group row">
										<label class="col-md-3 form-control-label">受保人真实姓名</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="insuredName" />
											<%--<small class="form-text text-muted ml-3"> * 贷款将发放到此银行卡</small>--%>
										</div>
									</div>
									<div class="line"></div>

									<div class="form-group row">
										<label class="col-md-3 form-control-label">受益人身份证号</label>
										<div class="col-md-9">
											<input type="text" maxlength="18" class="form-control" name="BeneficiaryID"/>
										</div>
									</div>
									<div class="line"></div>

									<div class="form-group row">
										<label class="col-md-3 form-control-label">受益人姓名</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="BeneficiaryName" />
										</div>
									</div>
									<div class="line"></div>

									<div class="form-group row">
										<label class="col-md-3 form-control-label">需要确定</label>
										<div class="col-md-9">
											<input type="checkbox" id="checkbox1">
											<label for="checkbox1">
												本人已阅读保险条款、产品说明书和投保提示书，了解本产品的特点和保单利益的不确定性
											</label>
										</div>
									</div>
									<div class="line"></div>

									<div class="form-group row">
										<label class="col-md-3 form-control-label">投保人年收入</label>
										<div class="col-md-9">
											<input type="text" class="form-control" />
										</div>
									</div>
									<div class="line"></div>

									<div class="line"></div>

									<div class="form-group row">
										<div class="col-md-9 ml-auto">
											<button type="submit" class="btn btn-primary">确认购买</button>
											<button type="reset" class="btn btn-secondary">重置</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
<%--		尾部 --%>
		<footer class="footer bg-white shadow align-self-end py-3 px-xl-5 w-100">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6 text-center text-md-left text-primary">
						<p class="mb-2 mb-md-0">网上银行系统 &copy; 2018-2020</p>
					</div>
					<div class="col-md-6 text-center text-md-right text-gray-400">
						<p class="mb-0">Copyright &copy; 2019.Company name All rights reserved.<a target="_blank" href="http://127.0.0.1:8080/bankms/">网上银行系统</a></p>
						<!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
					</div>
				</div>
			</div>
		</footer>
	</div>
</div>
<!-- JavaScript files-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="js/js.cookie.min.js"></script>
<script src="js/front.js"></script>
</body>
</html>