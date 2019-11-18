<%@ page import="java.util.Vector" %>
<%@ page import="java.util.List" %>
<%@ page import="vo.insProduct.InsRegular" %>
<%@ page import="vo.InsPolicy" %>
<%@ page language="java" pageEncoding="gbk"%>
<%--�������--%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="gbk">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>bankms - ���� - ��ҳ</title>
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
	<%--ע������css˳��--%>
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
	<%--����--%>
	<div class="page-holder w-100 d-flex flex-wrap">
		<div class="container-fluid px-xl-5">
			<div class="container">
				<h1 class="mt-5">�������й���ϵͳ���� - ����</h1>
				<p>
				<a href="https://baike.baidu.com/item/%E8%B4%B7%E6%AC%BE" class="btn btn-outline-primary btn-large">�˽����</a>
				</p>
			</div>
			<div class="index">
				<a href="#insuringNotice" title="�����յ�ע������" >Ͷ����֪</a>&emsp;
				<a href="#allInsProduct" title="��Ʒ����" >��Ʒ����</a>&emsp;
				<a href="#SSCard" title="����һ���籣��" >���籣��</a>&emsp;
				<a href="#myIns" title="�ҵı���" >�ҵı���</a>&emsp;
			</div>
			<%--ʵ������--%>
			<div class="container">
				<div id="insuringNotice" class="jumbotron bg-hover-gradient-info">
					<h1>Ͷ����֪</h1>
					<div class="line"></div>
					<ul>
						<li>�����ǹ���������֮һ -- ���д��������м����մ����ˣ�</li>
						<li>Ͷ�����裺</li>
						<ol>
							<li>ѡ��һ�����ղ�Ʒ -> ��ϸ�Ķ��ò�Ʒ������Ϣ��������ʾͼ -></li>
							<li>ȷ��Ͷ���� -> ��Ҫ������֧�����Ѽ��ɷѽ��ɷѷ�ʽ��һ����֧����ָ���˻�ÿ�¹̶����˻���Ǯ�� -></li>
							<li>ǩ���պ�ͬ -> ��ȡ���� -> Ͷ��������</li>
						</ol>
					</ul>
				</div>
				<div id="allInsProduct" class="jumbotron bg-hover-gradient-info">
					<h1>��Ʒ����</h1>
					<ul>
						<li>�����ṩ�˲�ͬ���͵ı��ղ�Ʒ��</li>
						<li>�����ﹺ������Ҫ�ı��գ�Ͷ����</li>
					</ul>
					<%
						List allirp=(List) session.getAttribute("allInsRegular");//���б��ղ�Ʒ
						int j=1;
						i=0;
						for(i=0,j=1;i<allirp.size();i++,j++){
							InsRegular irp=(InsRegular) allirp.get(i);
							long id = irp.getID();//��ǰ���ղ�Ʒid
							out.print("<div class=\"InsProduct\" onclick=\"return InsProductClick("+id+");\">");
							if(j>5){
								j=1;
							}
							out.print("<img src=\"img/InsProduct"+j+".JPG\">");
							out.print(irp.getName()+"&emsp;"+"�ڽ�");
							out.print("<br/>");
							out.print("�ܱ��ѣ�"+irp.getTotalPremium()+"Ԫ"+"&emsp;<a href=\"\">�˽�����</a>");
							out.print("</div>");
						}
						allirp=null;
					%>
				</div>


				<div class="jumbotron bg-hover-gradient-warning" id="SSCard">
					<h1>��ᱣ�Ͽ�</h1>
					<div class="line"></div>
					<h3>��ᱣ�Ͽ�</h3>
					<p>��ᱣ�Ͽ�</p>
					<h3>��ᱣ�Ͽ�</h3>
					<p>��ᱣ�Ͽ���</p>
					<h3>��ᱣ�Ͽ�</h3>
					<p>��ᱣ�Ͽ���</p>
				</div>

				<div id="myIns" class="jumbotron bg-hover-gradient-info">
					<h2>�ҵı���</h2>
					<ul>
						<li>���ѹ����ȫ�����գ����ֳ��е�ȫ������������������<a href="">���ɱ���</a>��ÿ�¹̶����˻���Ǯ��</li>
						<li><a href="">�鿴��ʷ����</a> </li>
					</ul>
					<%
						Vector<InsPolicy> allInsPolicy = (Vector<InsPolicy>) session.getAttribute("allInsPolicy");
						j=1;
						i=0;
						for(i=0,j=1;i<allInsPolicy.size();i++,j++){
							InsPolicy ip=(InsPolicy) allInsPolicy.elementAt(i);
							long id = ip.getID();//��ǰ����id
							out.print("<div title=\"�������ı���������Բ鿴�ñ���\" class=\"InsProduct\" onclick=\"return InsPolicyClick("+id+");\">");
							if(j>5){
								j=0;
							}
							out.print("<img src=\"img/InsProduct"+j+".JPG\">");
							out.print("�����ţ�"+ip.getID());
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
	//����κ�һ�����ղ�Ʒ�����˺���
	function InsProductClick(arg0) {
		location.href="InsProductDetail.jsp?InsProductID="+arg0;
		return false;
	}

	//����κ�һ�����������˺���
	function InsPolicyClick(arg0) {
		location.href="insPolicy.jsp?insPolicyID="+arg0;
		return false;
	}
</script>
</body>
<script type="text/javascript" src="js/insur.js" charset="GBK"></script>
</html>