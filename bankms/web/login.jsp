<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
	<%--10秒后自动跳到指定url--%>
	<%--<meta http-equiv="refresh" content="10; url=index.html">--%>
	<title>bankms - 登录</title>
	<link rel="stylesheet" href="css/general.css">
	<link rel="stylesheet" href="css/friendList.css">
	<link rel="stylesheet" href="css/login.css">
	<script src="js/jquery-3.2.1.min.js"></script>
</head>

<body class="hasBg">
<%
	session.setAttribute("uID", null);
	//四对键值对
	String cookie1Value = "", cookie2Value = "", cookie3Value = "", cookie4Value = "";
	Cookie[] cookies = request.getCookies();//获取所有Cookie
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {//遍历所有Cookie，寻找4个键
			if (cookies[i].getName().equals("username")) {//找到
				cookie1Value = cookies[i].getValue();//获取Cookie值
			} else if (cookies[i].getName().equals("password")) {//找到
				cookie2Value = cookies[i].getValue();//获取Cookie值
			} else if (cookies[i].getName().equals("usernameChecked")) {//找到
				cookie3Value = cookies[i].getValue();//获取Cookie值
			} else if (cookies[i].getName().equals("passwordChecked")) {//找到
				cookie4Value = cookies[i].getValue();//获取Cookie值
			}
		}
	}
%>

<%--另一种轮播背景图方式--%>
<%--<jsp:include page="./WEB-INF/rotationChart.jsp"></jsp:include>--%>
<jsp:include page="./WEB-INF/header.jsp"></jsp:include>
<div class="index">
	<a title="办理一张普通银行卡，无需登录。办卡后自动开通个人网银、手机银行" href="#" onclick="return handleCard();">办卡</a>
	<a title="办理一张信用卡，无需登录" href="#" onclick="return handleCard();">办信用卡</a>
	<a title="激活你的账户" id="aa" href="#" onclick="return accountActivation();">账户激活</a>
	<a title="挂失你的账户" href="#" onclick="return accountReport();">账户挂失</a>
	<a title="支付" href="index.jsp">支付</a>
</div>

<%--用户登录表单--%>
<div id="loginForm" class="form">
	<form name="loginForm" action="LoginServlet" method="post">
		<table class="table" border="0" cellspacing="0" cellpadding="0">
			<%--表格align="right"会使div高度为0--%>
			<tr class="tr">
				<td></td>
				<td colspan="2" align="center"><label>欢迎登录 - 网上银行管理系统</label></td>
			</tr>
			<tr class="tr">
				<td colspan="4" align="center">
					<%
						/*	err：登录错误信息，request一次请求之内都有效
						不用session的原因：存储时间长，为了输出到那个页面	*/
						String errMessage = (String)request.getAttribute("error");
						if(errMessage!=null){
							out.print("<font color=red>"+errMessage+"</font>");
						}
					%>
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">
					<label id="label1">用户</label>名
				</td>
				<td align="left" colspan="2" class="mid_td">
					<%--	只能输入数字，长度不能超过18个数字
					消除文本框自动记忆之前输入的数据	--%>
					<input autofocus placeholder="用户注册时填写的昵称" type="text" class="text" name="username" value="<%=cookie1Value%>" autocomplete="off"; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">密&emsp;码</td>
				<td align="left" colspan="2" class="mid_td">
					<input type="password" class="text" name="password" placeholder="以登录bankms" value="<%=cookie2Value%>" autocomplete="off" onclick=this.value=""; />
				</td>
				<td class="edge_td">
					<a href="">忘记密码?</a>
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">验证码</td>
				<td align="left" colspan="2" class="mid_td">
					<input required placeholder="输入验证码" type="text" class="text" name="verificationCode" autocomplete="off" onclick=this.value=""; />
				</td>
				<td align="left" class="edge_td">
					<img src="VerificationCodeServlet" id="verificationCode" onclick="this.src='VerificationCodeServlet?'+Math.random()"/>
				</td>
			</tr>
			<tr class="tr">
				<td></td>
				<td align="center" colspan="1">
					<input type="checkbox" id="checkbox1" class="checkbox" name="rememberUsername" value="sUsername" onchange="check1();"<%=cookie3Value%>/>
					<label id="label2" for="checkbox1">保存用户名</label>
				</td>
				<td></td>
			</tr>
			<tr class="tr">
				<td></td>
				<td align="center" colspan="1">
					<input type="checkbox" id="checkbox2" class="checkbox" name="rememberPassword" value="sPassword" onchange="check2();"<%=cookie4Value%>/>
					<label for="checkbox2">保存密码</label>
				</td>
				<td></td>
			</tr>
			<tr class="tr">
				<td></td>
				<td align="center">
					<input type="radio" id="radio1" name="actor" value="user" checked="checked" onchange="return Radio1();"/>
					<label for="radio1">用户</label>
				</td>
				<td align="center">
					<input type="radio" id="radio2" name="actor" value="administrator" onchange="return Radio2();"/>
					<label for="radio2">管理员</label>
				</td>
			</tr>
			<tr align="center" class="tr">
				<td></td>
				<td align="center" colspan="1">
					<input type="submit" class="button" id="userLoginSubmit" value="登录"/>
				</td>
				<td align="center" colspan="1">
					<input type="reset" class="button" value="重置"/>
				</td>
				<td align="left" colspan="1">
					<a title="注册以成为一个新用户" id="a1" href="register.jsp" target="_blank">用户注册</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<%--办卡表单--%>
<div id="handleCardForm" class="form">
	<form name="handleCardForm" action="HandleCardServlet?Jsp=<%=this.getClass().getSimpleName().replaceAll("_",".")%>" method="post">
		<table class="table" border="0" cellspacing="0" cellpadding="0">
			<tr class="tr">
				<td></td>
				<td colspan="2" align="center"><label>网上银行管理系统 - 办理一张新银行卡</label></td>
			</tr>
			<tr class="tr">
				<td colspan="4" align="center"></td>
			</tr>
			<tr class="tr">
				<td class="edge_td"></td>
				<td align="left" colspan="2" class="mid_td">
					<input type="number" oninput="if(value.length>18) value=value.slice(0,18)" placeholder="你的身份证号(18位数字)" class="text" name="userID" id="userID" value="" autocomplete="off"; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td"></td>
				<td align="left" colspan="2" class="mid_td">
					<input type="text" placeholder="你的真实姓名" class="text" name="userName" id="userRealName" value="" autocomplete="off"; />
				</td>
				<td class="edge_td"></td>
			</tr>
			<tr class="tr">
				<td colspan="4" align="center"></td>
			</tr>
			<tr class="tr">
				<td colspan="4" align="center"></td>
			</tr>
			<tr class="tr">
				<td colspan="4" align="center"></td>
			</tr>
			<tr class="tr">
				<td colspan="4" align="center"></td>
			</tr>
			<tr align="center" class="tr">
				<td></td>
				<td align="center" colspan="1">
					<input type="submit" class="button" id="submit1" value="确定" onclick="return handleCardSubmit();"/>
				</td>
				<td align="center" colspan="1">
					<input type="reset" class="button" value="取消" onclick="handleCardCancel()"/>
				</td>
				<td align="left" colspan="1"></td>
			</tr>
		</table>
	</form>
</div>

<%--账户激活表单--%>
<div id="accountActivationForm" class="form">
	<form name="loginForm" action="accountActivationServlet?Jsp=<%=this.getClass().getSimpleName().replaceAll("_",".")%>" method="post">
		<table class="table" border="0" cellspacing="0" cellpadding="0">
			<tr class="tr">
				<td></td>
				<td colspan="2" align="center"><label>网上银行管理系统 -- 账户激活</label></td>
			</tr>
			<tr class="tr">
				<td colspan="4" align="center"></td>
			</tr>
			<tr class="tr">
				<td class="edge_td"></td>
				<td align="left" colspan="2" class="mid_td">
					<input type="number" oninput="if(value.length>16) value=value.slice(0,16)" placeholder="银行卡号(16位数字)" class="text" name="cardID" id="cardID" value="" autocomplete="off"; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td"></td>
				<td align="left" colspan="2" class="mid_td">
					<input type="text" placeholder="你的姓名" class="text" name="userName" id="userName" value="" autocomplete="off"; />
				</td>
				<td class="edge_td"></td>
			</tr>
			<tr class="tr">
				<td></td>
				<td colspan="2" align="center"><label>更新账户密码</label></td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td"></td>
				<td align="left" colspan="2" class="mid_td">
					<input placeholder="初始/原密码(6位数字)" type="password" maxlength="6" class="text" name="initialPassword" id="initialPassword" autocomplete="off" onclick=this.value=""; />
				</td>
				<td align="left" class="edge_td"></td>
			</tr>
			<tr class="tr">
				<td></td>
				<td align="center" colspan="2" class="mid_td">
					<input type="password" placeholder="创建新密码(6位数字)" maxlength="6" class="text" name="password_st" id="password_st" onclick=this.value="">
				</td>
				<td></td>
			</tr>
			<tr class="tr">
				<td></td>
				<td align="center" colspan="2" class="mid_td">
					<input type="password" placeholder="确认新密码(6位数字)" maxlength="6" class="text" name="password_nd" id="password_nd" onclick=this.value="">
				</td>
				<td>
				</td>
			</tr>
			<tr align="center" class="tr">
				<td></td>
				<td align="center" colspan="1">
					<input type="submit" class="button" id="accountActivationSubmit" value="确认激活账户" onclick="return accountActivationSubmit();"/>
				</td>
				<td align="center" colspan="1">
					<input type="reset" class="button" value="取消" onclick="accountActivationCancel()"/>
				</td>
				<td align="left" colspan="1"></td>
			</tr>
		</table>
	</form>
</div>

</body>
<script type="text/javascript" src="js/login.js" charset="gbk"></script>

</html>