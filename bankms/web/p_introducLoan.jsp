<%@ page import="model.impl.BankCardServiceImpl" %>
<%@ page import="model.impl.NUserServiceImpl" %>
<%@ page import="vo.user.NUser" %>
<%@ page language="java" pageEncoding="gbk"%>

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
<!-- navbar-->

<%@include file="WEB-INF/header.jsp"%>
<div class="d-flex align-items-stretch">
    <%@include file="WEB-INF/sidebar.jsp"%>
    <%
        service = new BankCardServiceImpl();
        NUserServiceImpl nudao=new NUserServiceImpl();
//        long uID;
        if(request.getSession().getAttribute("uID")!=null){
            uID =(String) request.getSession().getAttribute("uID").toString();

        }else{
//            uID = 9L;
        }
        allBc = service.getAllBankCards(Long.parseLong(uID));
        NUser user = nudao.getNUserByuID(Long.parseLong(uID));
    %>
    <%--	����--%>
    <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">
            <div class="container">
                <h1 class="mt-5">�������</h1>
                <p>
                    <a href="https://baike.baidu.com/item/%E8%B4%B7%E6%AC%BE" class="btn btn-outline-primary btn-large">�˽���� </a>
                    <a href="http://127.0.0.1:8080/bankms/p_applyLoan.jsp" class="btn btn-primary btn-large">�������� </a>
                </p>
            </div>
            <div class="container">
                <div class="jumbotron bg-hover-gradient-info">
                    <h1>�����������</h1>
                    <div class="line"></div>
                    <p>����ֶ��ڡ������볤�ڴ�����ڴ��ϵָ����������1�����ڣ���1�꣩�Ĵ��
                        ���ڴ��ϵָ����������1�����ϣ�����1�꣩5�����£���5�꣩�Ĵ��
                        ���ڴ��ϵָ����������5�꣨����5�꣩���ϵĴ��</p>
                </div>
                <div class="jumbotron bg-hover-gradient-violet">
                    <h1>�������ʽ���</h1>
                    <div class="line"></div>
                    <table class="table table-striped table-sm card-text">
                        <thead>
                        <tr>

                            <th>����</th>
                            <th>������</th>
                            <th>����������</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1������(��1��)</td>
                            <td>4.35%</td>
                            <td>6.09%</td>
                        </tr>
                        <tr>
                            <td>1�굽5��(��5��)</td>
                            <td>4.75%</td>
                            <td>6.65%</td>
                        </tr>
                        <tr>
                            <td>5������</td>
                            <td>4.90%</td>
                            <td>6.86%</td>
                        </tr>
                        </tbody>
                    </table>
                    <small class="form-text text-muted ml-3"> * ����Ϊ���й����Ĵ����׼���ʣ������Դ�Ϊ��׼�ϸ����µ������ѡ���Ӫ������������ʲ���ܴ󣬵���һ�㲻�ᳬ��5�������ʵ�4����</small>
                    <small class="form-text text-muted ml-3"> * ���ڴ�����Ϣ���������ڴ�����ɵķ���Ϣ��������ָ�����˲����պ�ͬ��Լ���黹���ĳ��ڷ�Ϣ��һ���������ԭ�������ʵĻ�����������30%-50%�ķ�Ϣ��</small>
                    <small class="form-text text-muted ml-3"> * ���ս���Ȩ�鱾�Ŷ����С�</small>
                </div>

                <div class="jumbotron bg-hover-gradient-warning">
                    <h1>��������</h1>
                    <div class="line"></div>
                    <h3>�����Ⱥ�����</h3>
                    <p>ÿ�ʴ������������1000Ԫ����߿ɴ�20�򡣴����������3���£��ʮ�ꡣ</p>
                    <h3>�����</h3>
                    <p>���һ���Է��ŵ�ָ�����п��˻��С�</p>
                    <h3>�����</h3>
                    <p>һ�������汾�塣</p>
                </div>
            </div>
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