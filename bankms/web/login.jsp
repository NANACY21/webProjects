<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
	<%--10����Զ�����ָ��url--%>
	<%--<meta http-equiv="refresh" content="10; url=index.html">--%>
	<title>bankms - ��¼</title>
	<link rel="stylesheet" href="css/general.css">
	<link rel="stylesheet" href="css/friendList.css">
	<link rel="stylesheet" href="css/login.css">
	<script src="js/jquery-3.2.1.min.js"></script>
</head>

<body class="hasBg">
<%
	session.setAttribute("uID", null);
	//�ĶԼ�ֵ��
	String cookie1Value = "", cookie2Value = "", cookie3Value = "", cookie4Value = "";
	Cookie[] cookies = request.getCookies();//��ȡ����Cookie
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {//��������Cookie��Ѱ��4����
			if (cookies[i].getName().equals("username")) {//�ҵ�
				cookie1Value = cookies[i].getValue();//��ȡCookieֵ
			} else if (cookies[i].getName().equals("password")) {//�ҵ�
				cookie2Value = cookies[i].getValue();//��ȡCookieֵ
			} else if (cookies[i].getName().equals("usernameChecked")) {//�ҵ�
				cookie3Value = cookies[i].getValue();//��ȡCookieֵ
			} else if (cookies[i].getName().equals("passwordChecked")) {//�ҵ�
				cookie4Value = cookies[i].getValue();//��ȡCookieֵ
			}
		}
	}
%>

<%--��һ���ֲ�����ͼ��ʽ--%>
<%--<jsp:include page="./WEB-INF/rotationChart.jsp"></jsp:include>--%>
<jsp:include page="./WEB-INF/header.jsp"></jsp:include>
<div class="index">
	<a title="����һ����ͨ���п��������¼���쿨���Զ���ͨ�����������ֻ�����" href="#" onclick="return handleCard();">�쿨</a>
	<a title="����һ�����ÿ��������¼" href="#" onclick="return handleCard();">�����ÿ�</a>
	<a title="��������˻�" id="aa" href="#" onclick="return accountActivation();">�˻�����</a>
	<a title="��ʧ����˻�" href="#" onclick="return accountReport();">�˻���ʧ</a>
	<a title="֧��" href="index.jsp">֧��</a>
</div>

<%--�û���¼��--%>
<div id="loginForm" class="form">
	<form name="loginForm" action="LoginServlet" method="post">
		<table class="table" border="0" cellspacing="0" cellpadding="0">
			<%--���align="right"��ʹdiv�߶�Ϊ0--%>
			<tr class="tr">
				<td></td>
				<td colspan="2" align="center"><label>��ӭ��¼ - �������й���ϵͳ</label></td>
			</tr>
			<tr class="tr">
				<td colspan="4" align="center">
					<%
						/*	err����¼������Ϣ��requestһ������֮�ڶ���Ч
						����session��ԭ�򣺴洢ʱ�䳤��Ϊ��������Ǹ�ҳ��	*/
						String errMessage = (String)request.getAttribute("error");
						if(errMessage!=null){
							out.print("<font color=red>"+errMessage+"</font>");
						}
					%>
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">
					<label id="label1">�û�</label>��
				</td>
				<td align="left" colspan="2" class="mid_td">
					<%--	ֻ���������֣����Ȳ��ܳ���18������
					�����ı����Զ�����֮ǰ���������	--%>
					<input autofocus placeholder="�û�ע��ʱ��д���ǳ�" type="text" class="text" name="username" value="<%=cookie1Value%>" autocomplete="off"; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">��&emsp;��</td>
				<td align="left" colspan="2" class="mid_td">
					<input type="password" class="text" name="password" placeholder="�Ե�¼bankms" value="<%=cookie2Value%>" autocomplete="off" onclick=this.value=""; />
				</td>
				<td class="edge_td">
					<a href="">��������?</a>
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td">��֤��</td>
				<td align="left" colspan="2" class="mid_td">
					<input required placeholder="������֤��" type="text" class="text" name="verificationCode" autocomplete="off" onclick=this.value=""; />
				</td>
				<td align="left" class="edge_td">
					<img src="VerificationCodeServlet" id="verificationCode" onclick="this.src='VerificationCodeServlet?'+Math.random()"/>
				</td>
			</tr>
			<tr class="tr">
				<td></td>
				<td align="center" colspan="1">
					<input type="checkbox" id="checkbox1" class="checkbox" name="rememberUsername" value="sUsername" onchange="check1();"<%=cookie3Value%>/>
					<label id="label2" for="checkbox1">�����û���</label>
				</td>
				<td></td>
			</tr>
			<tr class="tr">
				<td></td>
				<td align="center" colspan="1">
					<input type="checkbox" id="checkbox2" class="checkbox" name="rememberPassword" value="sPassword" onchange="check2();"<%=cookie4Value%>/>
					<label for="checkbox2">��������</label>
				</td>
				<td></td>
			</tr>
			<tr class="tr">
				<td></td>
				<td align="center">
					<input type="radio" id="radio1" name="actor" value="user" checked="checked" onchange="return Radio1();"/>
					<label for="radio1">�û�</label>
				</td>
				<td align="center">
					<input type="radio" id="radio2" name="actor" value="administrator" onchange="return Radio2();"/>
					<label for="radio2">����Ա</label>
				</td>
			</tr>
			<tr align="center" class="tr">
				<td></td>
				<td align="center" colspan="1">
					<input type="submit" class="button" id="userLoginSubmit" value="��¼"/>
				</td>
				<td align="center" colspan="1">
					<input type="reset" class="button" value="����"/>
				</td>
				<td align="left" colspan="1">
					<a title="ע���Գ�Ϊһ�����û�" id="a1" href="register.jsp" target="_blank">�û�ע��</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<%--�쿨��--%>
<div id="handleCardForm" class="form">
	<form name="handleCardForm" action="HandleCardServlet?Jsp=<%=this.getClass().getSimpleName().replaceAll("_",".")%>" method="post">
		<table class="table" border="0" cellspacing="0" cellpadding="0">
			<tr class="tr">
				<td></td>
				<td colspan="2" align="center"><label>�������й���ϵͳ - ����һ�������п�</label></td>
			</tr>
			<tr class="tr">
				<td colspan="4" align="center"></td>
			</tr>
			<tr class="tr">
				<td class="edge_td"></td>
				<td align="left" colspan="2" class="mid_td">
					<input type="number" oninput="if(value.length>18) value=value.slice(0,18)" placeholder="������֤��(18λ����)" class="text" name="userID" id="userID" value="" autocomplete="off"; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td"></td>
				<td align="left" colspan="2" class="mid_td">
					<input type="text" placeholder="�����ʵ����" class="text" name="userName" id="userRealName" value="" autocomplete="off"; />
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
					<input type="submit" class="button" id="submit1" value="ȷ��" onclick="return handleCardSubmit();"/>
				</td>
				<td align="center" colspan="1">
					<input type="reset" class="button" value="ȡ��" onclick="handleCardCancel()"/>
				</td>
				<td align="left" colspan="1"></td>
			</tr>
		</table>
	</form>
</div>

<%--�˻������--%>
<div id="accountActivationForm" class="form">
	<form name="loginForm" action="accountActivationServlet?Jsp=<%=this.getClass().getSimpleName().replaceAll("_",".")%>" method="post">
		<table class="table" border="0" cellspacing="0" cellpadding="0">
			<tr class="tr">
				<td></td>
				<td colspan="2" align="center"><label>�������й���ϵͳ -- �˻�����</label></td>
			</tr>
			<tr class="tr">
				<td colspan="4" align="center"></td>
			</tr>
			<tr class="tr">
				<td class="edge_td"></td>
				<td align="left" colspan="2" class="mid_td">
					<input type="number" oninput="if(value.length>16) value=value.slice(0,16)" placeholder="���п���(16λ����)" class="text" name="cardID" id="cardID" value="" autocomplete="off"; />
				</td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td"></td>
				<td align="left" colspan="2" class="mid_td">
					<input type="text" placeholder="�������" class="text" name="userName" id="userName" value="" autocomplete="off"; />
				</td>
				<td class="edge_td"></td>
			</tr>
			<tr class="tr">
				<td></td>
				<td colspan="2" align="center"><label>�����˻�����</label></td>
			</tr>
			<tr class="tr">
				<td align="right" class="edge_td"></td>
				<td align="left" colspan="2" class="mid_td">
					<input placeholder="��ʼ/ԭ����(6λ����)" type="password" maxlength="6" class="text" name="initialPassword" id="initialPassword" autocomplete="off" onclick=this.value=""; />
				</td>
				<td align="left" class="edge_td"></td>
			</tr>
			<tr class="tr">
				<td></td>
				<td align="center" colspan="2" class="mid_td">
					<input type="password" placeholder="����������(6λ����)" maxlength="6" class="text" name="password_st" id="password_st" onclick=this.value="">
				</td>
				<td></td>
			</tr>
			<tr class="tr">
				<td></td>
				<td align="center" colspan="2" class="mid_td">
					<input type="password" placeholder="ȷ��������(6λ����)" maxlength="6" class="text" name="password_nd" id="password_nd" onclick=this.value="">
				</td>
				<td>
				</td>
			</tr>
			<tr align="center" class="tr">
				<td></td>
				<td align="center" colspan="1">
					<input type="submit" class="button" id="accountActivationSubmit" value="ȷ�ϼ����˻�" onclick="return accountActivationSubmit();"/>
				</td>
				<td align="center" colspan="1">
					<input type="reset" class="button" value="ȡ��" onclick="accountActivationCancel()"/>
				</td>
				<td align="left" colspan="1"></td>
			</tr>
		</table>
	</form>
</div>

</body>
<script type="text/javascript" src="js/login.js" charset="gbk"></script>

</html>