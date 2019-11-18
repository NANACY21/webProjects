<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="vo.user.NUser" %>
<head>
    <title>bankms - ��ҳ - �ҵĺ����б� - һ�����ѵ���ϸ��Ϣ��</title>
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
    <link rel="stylesheet" href="css/general.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<%@include file="WEB-INF/header.jsp"%>
<div class="d-flex align-items-stretch">
    <%@include file="WEB-INF/sidebar.jsp"%>
    <%
//        String reason = request.getParameter("reason");
//        Friend f=new Friend();
//        String submitValue="";
//        if(reason.equals("updateFriend") || reason.equals("update")){
//            reason="�޸ĺ���";
//            f = (Friend)session.getAttribute("friend");
//            submitValue="ȷ���޸�";
//        }
//        else if(reason.equals("addNewF") || reason.equals("add")){
//            reason="����º���";
//            submitValue="ȷ�����";
//        }
        NUser me = service1.getNUserByuID(Long.parseLong(uID));
    %>
    <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5" id="friendInfoForm">
            <section class="py-5">
                <div class="row">
                    <!-- Form Elements -->
                    <div class="col-lg-12 mb-5">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="h6 text-uppercase mb-0">�༭������Ϣ</h3>
                            </div>
                            <div class="card-body">
                                <form id="form1" name="friendInfoForm" class="form-horizontal" action = "" onsubmit="decision();" method="post">
                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">�ǳ�</label>
                                        <div class="col-md-9">
                                            <input required type="text" class="form-control" name="nickname" value="<%=me.getNickname()%>"/>
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">���ڵ�¼bankms������</label>
                                        <div class="col-md-9">
                                            <input required type="text" class="form-control" name="password" value="<%=me.getPassword()%>"/>
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">���֤��</label>
                                        <div class="col-md-9">
                                            <input required type="text" class="form-control" name="ID" value="<%=me.getID()%>"/>
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">����</label>
                                        <div class="col-md-9">
                                            <input required type="text" class="form-control" name="name" value="<%=me.getName()%>"/>
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">�Ա�</label>
                                        <div class="col-md-9">
                                            <input type="radio" id="radio1" name="sex" value="��" checked="checked"/>
                                            <label for="radio1">��</label>
                                            <input type="radio" id="radio2" name="sex" value="Ů"/>
                                            <label for="radio2">Ů</label>
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">�ֻ���</label>
                                        <div class="col-md-9 select mb-3">
                                            <input required type="number" class="form-control" name="telephone" value="<%=me.getTelephone()%>"/>
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">email</label>
                                        <div class="col-md-9 select mb-3">
                                            <input type="email" class="form-control" name="email" value="<%=me.getEmail()%>"/>
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">����</label>
                                        <div class="col-md-9">
                                            <input type="date" min="0" max="500" class="form-control" name="birthday" value="<%=me.getBirthday()%>"/>
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">qq��</label>
                                        <div class="col-md-9 select mb-3">
                                            <input type="text" name="qq" class="form-control" value="<%=me.getQq()%>"/>
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">סַ</label>
                                        <div class="col-md-9 select mb-3">
                                            <input type="text" class="form-control" name="address" value="<%=me.getAddress()%>"/>
                                        </div>
                                    </div>
                                    <div class="line"></div>
                                    <div class="form-group row">
                                        <div class="col-md-9 ml-auto">
                                            <button type="reset" class="btn btn-secondary">������Ϣ</button>
                                            <a href="main.jsp" class="btn btn-secondary">ȡ��</a>
                                            <button id="submit1" type="submit" class="btn btn-primary">�����޸�</button>
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
<%@include file="WEB-INF/footer.jsp"%>
<script>
    //����
    function decision() {

        /*  session��ָ�����ڷ������ĻỰ����js�������ڿͻ��˵�
        ����ȡsession�����ֵ����ʹ�ö�̬������ҳ����������ݲ�����JS��������ʹ�ýӿ�����ȡ
        ��js��̬�޸�html���form��action���ԣ��������ύʱ�پ����������ҳ��
        ��һ����ť�����ݰ�ť����ȷ���Ѹñ��ύ����һ��servlet */

        var a = document.getElementById("submit1");
        if (a.innerHTML == "�����޸�") {
            document.friendInfoForm.action = "UpdateNUserServlet";
            document.friendInfoForm.submit();
        } else if (a.innerHTML == "ȷ�����") {
            document.friendInfoForm.action = "AddFriendServlet";
            document.friendInfoForm.submit();
        } else if (a.innerHTML == "ȷ���޸�") {
            document.friendInfoForm.action = "UpdateNUserServlet";
            document.friendInfoForm.submit();
        }
    }
</script>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="js/js.cookie.min.js"></script>
<script src="js/charts-home.js"></script>
<script src="js/front.js"></script>
</body>
