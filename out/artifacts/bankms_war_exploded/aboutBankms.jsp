<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
    <title>bankms - 关于本系统</title>
    <%--模板--%>
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
</head>
<body>
<%--头部--%>
<%@include file="WEB-INF/header.jsp"%>
<%--内容--%>
<div class="d-flex align-items-stretch">
    <%--侧边导航--%>
    <%@include file="WEB-INF/sidebar.jsp"%>
    <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">
            <div class="container">
                <h1 class="mt-5">****</h1>
                <p>
                    <a title="现在bankms的session。运行完所有功能再试，会得到所有键值对" href="UtilServlet?Jsp=<%=this.getClass().getSimpleName().replaceAll("_",".")%>" class="btn btn-outline-primary btn-large">bankms的session</a>
                    <a href="" class="btn btn-primary btn-large">立即申请</a>
                </p>
            </div>
            <div class="container">
                <div class="jumbotron bg-hover-gradient-info">
                    <h1>功能说明</h1>
                    <div class="line"></div>
                    <p>
                        bankms - 一种银行<br/>
                        bankms是一款网上银行管理系统，网站，Java Web项目<br/>
                    </p>
                    <div class="line"></div>
                    <p>
                        <h5>添加银行卡</h5>
                        真正银行系统的添加银行卡：已有银行卡<br/>
                        本系统的添加银行卡：真的办理一张银行卡
                    </p>
                    <div class="line"></div>
                    <p>
                        <h5>理财</h5>
                        余额理财，购买理财产品。理财账户即第三方账户
                    </p>
                    <div class="line"></div>
                    <p>
                    <h5>保险</h5>
                    医疗、养老<br/>
                    买保险后续：期交保险须缴纳保险
                    </p>
                    <div class="line"></div>
                    <p>
                        <h5>待上线功能</h5>

                    注销某手机号开通的手机银行服务<br/>
                        用户：搜索、消息通知、扫码支付（体现硬件）、短信验证码、搜索功能、完善个人信息、消息通知（登录系统后有未读消息，消息源：tr）、一个按钮：同时清除搜索记录、播放记录、缓存（js、css）。
                    办理某些业务后，账户管理模块会新增该功能，如理财。
                    <br/>
                        管理员：审批贷款（m_showUnApproveServlet）、查看用户操作日志、统计、分析->得出用户喜好的分析->功能的强化优化和弱化，布局的改变<br/>
                    管理员子系统：用户的账户的部分信息管理员不可见。信用系统：看每个用户的信用情况：是否按时还信用卡、其它方面的信用如何
                    </p>
                    <div class="line"></div>
                    <p>
                    <h5>考虑和完善</h5>
                    办卡、转账考虑多用户高并发<br/>
                    密码加密存入db
                    </p>
                </div>
                <div class="jumbotron bg-hover-gradient-info">
                    <h1>开发说明</h1>
                    <div class="line"></div>
                    <p>
                        所有session setAttribute均在控制层、UI层
                    </p>
                </div>

                <div class="jumbotron bg-hover-gradient-info">
                    <h1>已废弃的写法&emsp;过去的版本</h1>
                    <div class="line"></div>
                    <p>
                        <ul>
                            <li>将登录表单交给一个LoginVerification.jsp</li>
                            <li>关于好友录，普通用户uID是外键，是树的模式，<br/>
                            一个普通用户添加一名好友->新加一行元组</li>
                            <li>info.jsp&emsp;原名：friendDetail.jsp<br/>
                            该网页是一个表单，过去用于添加/修改好友，现在仅用于编辑个人信息<br/>
                            修改选中好友：点击修改链接->通过一个预处理控制器提取该好友的信息到session，跳到表单读session显示在ui-><br/>
                            通过一个控制器真正修改<br/>
                            </li>
                        </ul>
                    </p>
                </div>

                <div class="jumbotron bg-hover-gradient-info">
                    <h1>写法</h1>
                    <div class="line"></div>
                    <p>
                    <ul>
                        <li>多个功能都请求某一个jsp，session先覆盖，故读取session即可</li>
                        <li>多个功能都请求某一个jsp（js跳到jsp、servlet跳到jsp），加参数，然后jsp中识别该参数以确定该表单的功能。</li>
                    </ul>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="WEB-INF/footer.jsp"%>
<%--模板--%>
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
