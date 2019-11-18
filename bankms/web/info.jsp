<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="vo.user.NUser" %>
<head>
    <title>bankms - 主页 - 我的好友列表 - 一个好友的详细信息表单</title>
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
//            reason="修改好友";
//            f = (Friend)session.getAttribute("friend");
//            submitValue="确认修改";
//        }
//        else if(reason.equals("addNewF") || reason.equals("add")){
//            reason="添加新好友";
//            submitValue="确认添加";
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
                                <h3 class="h6 text-uppercase mb-0">编辑个人信息</h3>
                            </div>
                            <div class="card-body">
                                <form id="form1" name="friendInfoForm" class="form-horizontal" action = "" onsubmit="decision();" method="post">
                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">昵称</label>
                                        <div class="col-md-9">
                                            <input required type="text" class="form-control" name="nickname" value="<%=me.getNickname()%>"/>
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">用于登录bankms的密码</label>
                                        <div class="col-md-9">
                                            <input required type="text" class="form-control" name="password" value="<%=me.getPassword()%>"/>
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">身份证号</label>
                                        <div class="col-md-9">
                                            <input required type="text" class="form-control" name="ID" value="<%=me.getID()%>"/>
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">姓名</label>
                                        <div class="col-md-9">
                                            <input required type="text" class="form-control" name="name" value="<%=me.getName()%>"/>
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">性别</label>
                                        <div class="col-md-9">
                                            <input type="radio" id="radio1" name="sex" value="男" checked="checked"/>
                                            <label for="radio1">男</label>
                                            <input type="radio" id="radio2" name="sex" value="女"/>
                                            <label for="radio2">女</label>
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">手机号</label>
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
                                        <label class="col-md-3 form-control-label">生日</label>
                                        <div class="col-md-9">
                                            <input type="date" min="0" max="500" class="form-control" name="birthday" value="<%=me.getBirthday()%>"/>
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">qq号</label>
                                        <div class="col-md-9 select mb-3">
                                            <input type="text" name="qq" class="form-control" value="<%=me.getQq()%>"/>
                                        </div>
                                    </div>
                                    <div class="line"></div>

                                    <div class="form-group row">
                                        <label class="col-md-3 form-control-label">住址</label>
                                        <div class="col-md-9 select mb-3">
                                            <input type="text" class="form-control" name="address" value="<%=me.getAddress()%>"/>
                                        </div>
                                    </div>
                                    <div class="line"></div>
                                    <div class="form-group row">
                                        <div class="col-md-9 ml-auto">
                                            <button type="reset" class="btn btn-secondary">重置信息</button>
                                            <a href="main.jsp" class="btn btn-secondary">取消</a>
                                            <button id="submit1" type="submit" class="btn btn-primary">保存修改</button>
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
    //决策
    function decision() {

        /*  session是指保存在服务器的会话，而js是运行在客户端的
        若想取session里面的值，需使用动态语言在页面上输出内容并赋给JS变量，或使用接口来获取
        用js动态修改html组件form的action属性，可以在提交时再决定处理表单的页面
        共一个按钮，根据按钮文字确定把该表单提交到哪一个servlet */

        var a = document.getElementById("submit1");
        if (a.innerHTML == "保存修改") {
            document.friendInfoForm.action = "UpdateNUserServlet";
            document.friendInfoForm.submit();
        } else if (a.innerHTML == "确认添加") {
            document.friendInfoForm.action = "AddFriendServlet";
            document.friendInfoForm.submit();
        } else if (a.innerHTML == "确认修改") {
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
