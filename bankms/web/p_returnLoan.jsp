<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="model.impl.BankCardServiceImpl" %>
<%@ page import="vo.card.BankCard" %>
<%@ page import="model.impl.NUserServiceImpl" %>
<%@ page import="vo.user.NUser" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="gbk">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>bankms</title>
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
<%
	BankCardServiceImpl service = new BankCardServiceImpl();
	NUserServiceImpl nudao=new NUserServiceImpl();
	long uID;
	if(request.getSession().getAttribute("uID")!=null){
		uID =(long) request.getSession().getAttribute("uID");

	}else{
		uID = 9L;
	}
	List<BankCard> allBc = service.getAllBankCards(uID);
	NUser user = nudao.getNUserByuID(uID);
%>
<!-- navbar-->
<%@include file="WEB-INF/header.jsp"%>
<div class="d-flex align-items-stretch">
	<%@include file="/WEB-INF/sidebar.jsp"%>
	<%--	内容--%>
	<div class="page-holder w-100 d-flex flex-wrap">
		<div class="container-fluid px-xl-5">
			<section class="py-5">
				<div class="row">
					<!-- Form Elements -->
					<div class="col-lg-12 mb-5">
						<div class="card">
							<div class="card-header">
								<h3 class="h6 text-uppercase mb-0">还贷</h3>
							</div>
							<div class="card-body">
								<form class="form-horizontal" action = "p_returnLoanServlet" method="post">

									<%
										Long loanID = (Long)request.getAttribute("loanID");
										double amount = (double)request.getAttribute("amount");
										double interest = (double)request.getAttribute("interest");
										double overInterest =(double) request.getAttribute("overInterest");
										double allAmount = amount+interest+overInterest;

										//获取card ID

									%>

									<div class="form-group row">
										<label class="col-md-3 form-control-label">贷款号</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="loanID" value="<%=loanID%>">
										</div>
									</div>
									<div class="line"></div>

									<div class="form-group row">
										<label class="col-md-3 form-control-label">贷款金额</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="amount" value="<%=amount%>">
										</div>
									</div>
									<div class="line"></div>

									<div class="form-group row">
										<label class="col-md-3 form-control-label">期限内利息</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="interest" value="<%=interest%>">
										</div>
									</div>
									<div class="line"></div>

									<div class="form-group row">
										<label class="col-md-3 form-control-label">逾期利息</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="overInterest" value="<%=overInterest%>">
										</div>
									</div>
									<div class="line"></div>

									<div class="form-group row">
										<label class="col-md-3 form-control-label">总待还金额</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="allAmount" value="<%=allAmount%>">
										</div>
									</div>
									<div class="line"></div>

									<div class="form-group row">
										<label class="col-md-3 form-control-label">选择还款银行卡</label>
										<div class="col-md-9 select mb-3">
											<select name="cardID" class="form-control">
												<%
													for (int i=0;i<allBc.size();i++){
														out.println("<option value = "+allBc.get(i).getID()+">"+allBc.get(i).getID()+"</option>");
													}
												%>
											</select>
										</div>
									</div>
									<div class="line"></div>

									<div class="line"></div>

									<div class="form-group row">
										<div class="col-md-9 ml-auto" >
											<a href="http://127.0.0.1:8080/bankms/p_myLoanServlet" class="btn  btn-secondary">取消还款</a>
											<button type="submit" class="btn btn-primary">确认还款</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>

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