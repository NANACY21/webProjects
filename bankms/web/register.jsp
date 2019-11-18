<%@ page language="java" pageEncoding="gbk"%>
<jsp:include page="WEB-INF/header.jsp"></jsp:include>
<html>
<head>
	<title>bankms - ע��</title>
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
				<td colspan="2" align="center"><label>��ӭ<label id="who">�û�</label>ע�� - �������й���ϵͳ</label></td>
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
				<td align="right" class="edge_td">���֤��</td>
				<td colspan="2" class="mid_td">
					<input placeholder="18λ���֣����" type="number" oninput="if(value.length>18) value=value.slice(0,18)" class="text" name="userID" id="userID" autocomplete="off"; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">��&emsp;&emsp;��</td>
				<td colspan="2" class="mid_td">
					<input required type="text" class="text" placeholder="�����ʵ���������" name="username" id="username" autocomplete="off"; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">��������</td>
				<td colspan="2" class="mid_td">
					<input type="password" placeholder="8~14�������ϵ��ַ������" class="text" name="password1" id="password1" autocomplete="off" onclick=this.value=""; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">ȷ������</td>
				<td colspan="2" class="mid_td">
					<input type="password" placeholder="ȷ�����루���" class="text" name="password2" id="password2" autocomplete="off" onclick=this.value=""; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">��&emsp;&emsp;��</td>
				<td colspan="2" class="mid_td">
					<input type="text" placeholder="��Ϊ�û�����¼��ϵͳ�����" class="text" name="nickname" id="nickname" autocomplete="off"; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">��&emsp;&emsp;��</td>
				<td colspan="2" class="mid_td">
					<input type="radio" id="radio1" name="sex" value="��" checked="checked"/>
					<label for="radio1">��</label>
					<input type="radio" id="radio2" name="sex" value="Ů"/>
					<label for="radio2">Ů</label>
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">�ֻ�����</td>
				<td colspan="2" class="mid_td">
					<input type="number" placeholder="ѡ��" class="text" name="telephone" id="telephone" autocomplete="off"; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">�����ַ</td>
				<td colspan="2" class="mid_td">
					<input type="email" placeholder="ѡ��" class="text" name="email" id="email" autocomplete="off"; />
				</td>
			</tr>
			<tr class="tr">
				<td></td>
				<td colspan="1" align="center">
					<input type="submit" class="button" value="ע��" onclick="return regVer();" />
				</td>
				<td align="center">
					<input type="reset" class="button" value="����"/>
				</td>
				<td class="edge_td">
					<a href="login.jsp">��¼</a>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>