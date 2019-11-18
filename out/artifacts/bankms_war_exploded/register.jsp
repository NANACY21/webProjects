<%@ page language="java" pageEncoding="gbk"%>
<jsp:include page="WEB-INF/header.jsp"></jsp:include>
<html>
<head>
	<title>bankms - 注册</title>
	<link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/general.css">
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script src="js/register.js"></script>
</head>
<body class="hasBg">
<div id="registerForm" class="form">
	<form name="registerForm" action="RegisterServlet" method="post">
		<table class="table" border="0" cellspacing="0" cellpadding="0">
			<tr class="tr">
				<td></td>
				<td colspan="2" align="center"><label>欢迎<label id="who">用户</label>注册 - 网上银行管理系统</label></td>
			</tr>
			<tr class="tr">
				<td colspan="4" align="center">
					<%
						String errMessage = (String)request.getAttribute("err");
						if(errMessage!=null){
							out.print("<font color=red>"+errMessage+"</font>");
						}
					%>
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">身份证号</td>
				<td colspan="2" class="mid_td">
					<input placeholder="18位数字（必填）" type="number" oninput="if(value.length>18) value=value.slice(0,18)" class="text" name="userID" id="userID" autocomplete="off"; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">姓&emsp;&emsp;名</td>
				<td colspan="2" class="mid_td">
					<input required type="text" class="text" placeholder="你的真实姓名（必填）" name="username" id="username" autocomplete="off"; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">设置密码</td>
				<td colspan="2" class="mid_td">
					<input type="password" placeholder="8~14个键盘上的字符（必填）" class="text" name="password1" id="password1" autocomplete="off" onclick=this.value=""; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">确认密码</td>
				<td colspan="2" class="mid_td">
					<input type="password" placeholder="确认密码（必填）" class="text" name="password2" id="password2" autocomplete="off" onclick=this.value=""; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">昵&emsp;&emsp;称</td>
				<td colspan="2" class="mid_td">
					<input type="text" placeholder="作为用户名登录本系统（必填）" class="text" name="nickname" id="nickname" autocomplete="off"; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">性&emsp;&emsp;别</td>
				<td colspan="2" class="mid_td">
					<input type="radio" id="radio1" name="sex" value="男" checked="checked"/>
					<label for="radio1">男</label>
					<input type="radio" id="radio2" name="sex" value="女"/>
					<label for="radio2">女</label>
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">手机号码</td>
				<td colspan="2" class="mid_td">
					<input type="number" placeholder="选填" class="text" name="telephone" id="telephone" autocomplete="off"; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">邮箱地址</td>
				<td colspan="2" class="mid_td">
					<input type="email" placeholder="选填" class="text" name="email" id="email" autocomplete="off"; />
				</td>
			</tr>
			<tr class="tr">
				<td></td>
				<td colspan="1" align="center">
					<input type="submit" class="button" value="注册" onclick="return regVer();" />
				</td>
				<td align="center">
					<input type="reset" class="button" value="重置"/>
				</td>
				<td class="edge_td">
					<a href="login.jsp">登录</a>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>