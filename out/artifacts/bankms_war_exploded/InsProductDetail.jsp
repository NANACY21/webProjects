<%@ page import="java.util.List" pageEncoding="gbk" %>
<%@ page import="vo.insProduct.InsRegular" %>
<%@ page import="model.impl.BankCardServiceImpl" %>
<%@ page import="vo.card.BankCard" %><%--
  Created by IntelliJ IDEA.
  User: ��}
  Date: 2019/6/18
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" %>
<html>
<head>
    <title>bankms - ���� - ��ҳ - ���ղ�Ʒ����</title>
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
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/general.css">
    <%--<link rel="stylesheet" href="css/general.css">--%>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/InsProductDetail.css">
</head>
<body>
<%--ͷ��--%>
<%@include file="WEB-INF/header.jsp"%>
<%--����--%>
<div class="d-flex align-items-stretch">
    <%--��ߵ���--%>
    <%@include file="WEB-INF/sidebar.jsp"%>
    <div class="page-holder w-100 d-flex flex-wrap">
        <%
            i=0;
            InsRegular irp=null;
            if(request.getParameter("InsProductID")==null){
                irp= (InsRegular) session.getAttribute("currentIrp");
            }
            else{
                String insProductID = request.getParameter("InsProductID");//�õ����ղ�Ʒid
//    ��ʾ�ñ��ղ�Ʒ����ϸ��Ϣ
                List<InsRegular> allirp=(List<InsRegular>) session.getAttribute("allInsRegular");//���б��ղ�Ʒ
                i=0;
                for(i=0;i<allirp.size();i++){
                    if(i==Integer.parseInt(insProductID)){

                        irp = allirp.get(i);//��ʾ������ղ�Ʒ������

                        //�ڴ�ʱ����Ҫ����ı��ղ�Ʒ�����Ḳ�ǣ������ֶ��ÿ�
                        session.setAttribute("currentIrp",irp);//��ǰҪͶ���ı��ղ�Ʒ
//            return;//����˳�
                        break;
                    }
                }
            }
        %>
        <%--���ղ�Ʒ�����--%>
        <div class="form" id="InsProductDetail">
            <%
                out.print("<img src=\"img/InsProduct3.JPG\">");
            %>
            <h1>���ղ�Ʒ��ϸ��Ϣ</h1>
            <form align="center" id="form1" action="insured.jsp" onsubmit="decision();" method="post">
                <table class="table" align="center" border="0" cellspacing="0" cellpadding="0">
                    <tr class="tr">
                        <td>���ղ�Ʒ����&emsp;</td>
                        <td class="mid_td" colspan="2">
                            <label class="form-control"><%=irp.getName()%></label>
                        </td>
                    </tr>
                    <tr class="tr">
                        <td class="edge_td">���չ�˾&emsp;</td>
                        <td class="mid_td" colspan="2">
                            <label class="form-control"><%=irp.getInsCompanyName()%></label>
                        </td>
                    </tr>
                    <tr class="tr">
                        <td class="edge_td">�ܱ��շ�&emsp;</td>
                        <td colspan="2" class="mid_td">
                            <label class="form-control"><%=irp.getTotalPremium()%>Ԫ�����</label>
                        </td>
                    </tr>
                    <tr class="tr">
                        <td class="edge_td">���ɱ��մ���&emsp;</td>
                        <td class="mid_td" colspan="2">
                            <label class="form-control"><%=(irp.getF()+"")%></label>
                        </td>
                    </tr>
                    <tr class="tr">
                        <td class="edge_td">���ɱ��շ�ʽ&emsp;</td>
                        <td class="mid_td" colspan="2">
                            <label class="form-control">�ڽ�</label>
                        </td>
                    </tr>
                    <tr class="tr">
                        <td class="edge_td">���ɱ�������&emsp;</td>
                        <td class="mid_td" colspan="2">
                            <label class="form-control"><%=(irp.getFlag()==0)?"�꽻":"�½�"%></label>
                        </td>
                    </tr>
                    <tr class="tr">
                        <td class="edge_td">��������&emsp;</td>
                        <td class="mid_td" colspan="2">
                            <label><%=irp.getDetail()%></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input onclick="window.location='insur.jsp'" type="button" value="���ر�����ҳ" class="button"/>
                        </td>
                        <td align="center">
                            <input type="submit" value="Ͷ��" class="button"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
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
