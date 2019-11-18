<%@ page import="vo.card.BankCard" %>
<%@ page import="java.util.List" %>
<%@ page import="model.impl.BankCardServiceImpl" %>
<%@ page import="model.impl.NUserServiceImpl" %>
<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk"%>
<html>
<head>
    <link rel="stylesheet" href="css/general.css">
    <script type="text/javascript" charset="gbk" src="js/sidebar.js"></script>
</head>
<body>
<%--侧边导航--%>
<div id="sidebar" class="sidebar py-3">
    <div class="text-gray-400 text-uppercase px-3 px-lg-4 py-4 font-weight-bold small headings-font-family">
        我的uID&emsp;<%=session.getAttribute("uID")%><br/>bankms - 导航
    </div>
    <ul class="sidebar-menu list-unstyled">
        <li class="sidebar-list-item"><a title="账户余额的支出和收入" href="#" data-toggle="collapse" data-target="#accountm" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>账户管理</span></a>
            <div id="accountm" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <%
                        BankCardServiceImpl service = new BankCardServiceImpl();
                        String uID = session.getAttribute("uID").toString();
                        List<BankCard> allBc = service.getAllBankCards(Long.parseLong(uID));
                        int i = 0;
                        for (i=0;i<allBc.size();i++){
                            out.print("<li class=\"sidebar-list-item\"><a title=\"银行卡号\" href=\"#\" onclick=\"return accountLogin(this);\" class=\"sidebar-link text-muted pl-lg-5\">"+allBc.get(i).getID()+"</a></li>");
                        }

                        NUserServiceImpl service1=new NUserServiceImpl();
                        long ID = service1.getNUserByuID(Long.parseLong(uID)).getID();
                        String myName = service1.getNUserByuID(Long.parseLong(uID)).getName();
                    %>
                    <li class="sidebar-list-item"><a title="办卡" class="sidebar-link text-muted pl-lg-5" data-toggle="modal" data-target="#HandleCard">&emsp;+&emsp;添加银行卡</a></li>
                    <li class="sidebar-list-item"><a title="激活银行卡" class="sidebar-link text-muted pl-lg-5" data-toggle="modal" data-target="#AccountActivation">&emsp;!&emsp;激活银行卡</a></li>
                    <li class="sidebar-list-item"><a title="挂失银行卡" class="sidebar-link text-muted pl-lg-5" data-toggle="modal" data-target="#AccountActivation">&emsp;-&emsp;挂失银行卡</a></li>
                </ul>
            </div>
        </li>
        <li class="sidebar-list-item"><a title="转账和汇款" href="#" data-toggle="collapse" data-target="#tatr" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>转账和汇款</span></a>
            <div id="tatr" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <li class="sidebar-list-item"><a title="存款" href="#" class="sidebar-link text-muted pl-lg-5">存款</a></li>
                    <li class="sidebar-list-item"><a title="取款" href="#" class="sidebar-link text-muted pl-lg-5">取款</a></li>
                    <li class="sidebar-list-item"><a title="转账" href="#" class="sidebar-link text-muted pl-lg-5">转账</a></li>
                    <li class="sidebar-list-item"><a title="汇款" href="#" class="sidebar-link text-muted pl-lg-5">汇款</a></li>
                </ul>
            </div>
        </li>
        <li class="sidebar-list-item"><a title="生活缴费" href="#" data-toggle="collapse" data-target="#lifepay" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>生活缴费</span></a>
            <div id="lifepay" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <li class="sidebar-list-item"><a title="交话费" href="lifePay.jsp" class="sidebar-link text-muted pl-lg-5">移动缴费</a></li>
                    <li class="sidebar-list-item"><a title="水电煤气缴费" href="#" class="sidebar-link text-muted pl-lg-5">水电煤气缴费</a></li>
                    <li class="sidebar-list-item"><a title="学费" href="#" class="sidebar-link text-muted pl-lg-5">学费</a></li>
                    <li class="sidebar-list-item"><a title="缴费记录" href="#" class="sidebar-link text-muted pl-lg-5">缴费记录</a></li>
                </ul>
            </div>
        </li>
        <li class="sidebar-list-item"><a title="贷款" href="p_introducLoan.jsp" data-toggle="collapse" data-target="#pages" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-app-layout-1 mr-3 text-gray"></i><span>贷款</span></a>
            <div id="pages" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <li class="sidebar-list-item"><a title="办理贷款" href="p_applyLoan.jsp" class="sidebar-link text-muted pl-lg-5">贷款申请</a></li>
                    <li class="sidebar-list-item"><a title="查看贷款状态，管理员决定是否发放贷款，这之前可以取消。到期用户还贷" href="p_myLoanServlet" class="sidebar-link text-muted pl-lg-5">我的贷款</a></li>
                    <li class="sidebar-list-item"><a title="贷款介绍" href="p_introducLoan.jsp" class="sidebar-link text-muted pl-lg-5">贷款介绍</a></li>
                    <li class="sidebar-list-item"><a title="额度查询" href="#" class="sidebar-link text-muted pl-lg-5">额度查询</a></li>
                </ul>
            </div>
        </li>
        <li class="sidebar-list-item"><a title="财务分析" href="p_AnalysisServlet" class="sidebar-link text-muted "><i class="o-sales-up-1 mr-3 text-gray"></i><span>财务分析</span></a></li>
        <li class="sidebar-list-item"><a title="代理保险服务，投保和缴纳保险，有关保险的都在这里" href="#" data-toggle="collapse" data-target="#ins" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>保险</span></a>
            <div id="ins" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <li class="sidebar-list-item"><a title="购买保险的注意事项" href="InsServlet?target=insuringNotice" class="sidebar-link text-muted pl-lg-5">投保须知</a></li>
                    <li class="sidebar-list-item"><a title="产品中心，选择想要购买的保险，有期交趸交两种方式" href="InsServlet?target=allInsProduct" class="sidebar-link text-muted pl-lg-5">产品中心</a></li>
                    <li class="sidebar-list-item"><a title="办理一张社保卡" href="InsServlet?target=SSCard" class="sidebar-link text-muted pl-lg-5">办社保卡</a></li>
                    <li class="sidebar-list-item"><a title="我的保险" href="InsServlet?target=myIns" class="sidebar-link text-muted pl-lg-5">我的保险</a></li>
                </ul>
            </div>
        </li>
        <li class="sidebar-list-item"><a title="余额理财" href="#" data-toggle="collapse" data-target="#mLot" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>余额理财</span></a>
            <div id="mLot" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <li class="sidebar-list-item"><a title="理财产品" href="#" class="sidebar-link text-muted pl-lg-5">理财产品</a></li>
                    <li class="sidebar-list-item"><a title="结构性存款" href="#" class="sidebar-link text-muted pl-lg-5">结构性存款</a></li>
                    <li class="sidebar-list-item"><a title="我的投资" href="#"  class="sidebar-link text-muted pl-lg-5">我的投资</a></li>
                </ul>
            </div>
        </li>
        <li class="sidebar-list-item"><a title="查询附近的网点(银行)及网点信息" href="#" data-toggle="collapse" data-target="#wangdian" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>网点查询</span></a>
            <div id="wangdian" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <li class="sidebar-list-item"><a title="显示地图" href="ShowMapServlet" class="sidebar-link text-muted pl-lg-5">显示地图</a></li>
                    <li class="sidebar-list-item"><a title="显示银行基本信息" href="ShowMapServlet" class="sidebar-link text-muted pl-lg-5">显示银行基本信息</a></li>
                </ul>
            </div>
        </li>
        <li class="sidebar-list-item"><a title="结汇和购汇" href="#" data-toggle="collapse" data-target="#jiehui" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>结汇和购汇</span></a>
            <div id="jiehui" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <li class="sidebar-list-item"><a title="汇率行情信息" href="FESandFEPServlet?target=rate" class="sidebar-link text-muted pl-lg-5">汇率行情</a></li>
                    <li class="sidebar-list-item"><a title="结汇" href="FESandFEPServlet?target=FES" class="sidebar-link text-muted pl-lg-5">结汇</a></li>
                    <li class="sidebar-list-item"><a title="购汇" href="FESandFEPServlet?target=FEP" class="sidebar-link text-muted pl-lg-5">购汇</a></li>
                    <li class="sidebar-list-item"><a title="结汇和购汇交易查询" href="FESandFEPServlet?target=FFTR" class="sidebar-link text-muted pl-lg-5">交易查询</a></li>
                </ul>
            </div>
        </li>
        <li class="sidebar-list-item"><a title="其它服务" href="#" data-toggle="collapse" data-target="#other" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>其它服务</span></a>
            <div id="other" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <li class="sidebar-list-item"><a title="显示我的好友列表" href="GetAllFriendServlet" class="sidebar-link text-muted pl-lg-5">我的好友</a></li>
                    <li class="sidebar-list-item"><a title="黑龙江大学学生绩点查询" href="GPA.jsp" class="sidebar-link text-muted pl-lg-5">绩点查询</a></li>
                    <li class="sidebar-list-item"><a title="faq" href="faq.jsp" class="sidebar-link text-muted pl-lg-5">faq</a></li>
                    <%
                        String name="猜数游戏";
                    %>
                    <li class="sidebar-list-item"><a title="猜数游戏" href="guessNumber.jsp?name=<%=name%>" charset="gbk" class="sidebar-link text-muted pl-lg-5">猜数游戏</a></li>
                </ul>
            </div>
        </li>
    </ul>
    <div class="text-gray-400 text-uppercase px-3 px-lg-4 py-4 font-weight-bold small headings-font-family">bankms - EXTRAS</div>
    <ul class="sidebar-menu list-unstyled">
        <li class="sidebar-list-item"><a title="我的信息" href="info.jsp" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>我</span></a></li>
        <%--session的uID不为空才显示--%>
        <li class="sidebar-list-item"><a title="重新登录本系统" href="LogoutServlet" class="sidebar-link text-muted"><i class="o-exit-1 mr-3 text-gray"></i><span>重新登录</span></a></li>
        <li class="sidebar-list-item"><a title="获取银行方面的信息和问题咨询" href="#" class="sidebar-link text-muted"><i class="o-survey-1 mr-3 text-gray"></i><span>资讯和咨询</span></a></li>
        <li class="sidebar-list-item"><a title="关于bankms的所有说明" href="aboutBankms.jsp" class="sidebar-link text-muted"><i class="o-imac-screen-1 mr-3 text-gray"></i><span>关于bankms</span></a></li>
        <li class="sidebar-list-item"><a title="关于技术支持" href="#" class="sidebar-link text-muted"><i class="o-database-1 mr-3 text-gray"></i><span>关于技术支持</span></a></li>
        <li class="sidebar-list-item"><a title="关于开发者团队" href="#" class="sidebar-link text-muted"><i class="o-paperwork-1 mr-3 text-gray"></i><span>关于开发者团队</span></a></li>
    </ul>
</div>

<%--办卡弹出框--%>
<div id="HandleCard" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="exampleModalLabel" class="modal-title">添加一张银行卡</h4>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <p>添加一张银行卡</p>
                <form action="HandleCardServlet?Jsp=<%=this.getClass().getSimpleName().replaceAll("_",".")%>" method="post">
                    <div class="form-group">
                        <label>身份证号</label>
                        <input type="number" maxlength="18" placeholder="你的身份证号(18位数字)" class="form-control" name="userID" value="<%=ID%>">
                    </div>
                    <div class="form-group">
                        <label>真实姓名</label>
                        <input type="text" maxlength="18" placeholder="你的真实姓名" class="form-control" name="userName" value="<%=myName%>">
                    </div>
                    <div class="form-group">
                        <input type="submit" value="确定" class="btn btn-primary">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-secondary">取消</button>
                <button type="button" class="btn btn-primary">暂时保存修改</button>
            </div>
        </div>
    </div>
</div>

<%--激活银行卡弹出框--%>
<div id="AccountActivation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="exampleModalLabel1" class="modal-title">激活一张银行卡</h4>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <p>添加一张银行卡</p>
                <form action="accountActivationServlet?Jsp=<%=this.getClass().getSimpleName().replaceAll("_",".")%>" method="post">
                    <div class="form-group">
                        <label>银行卡号</label>
                        <input type="number" oninput="if(value.length>16) value=value.slice(0,16)" placeholder="银行卡号(16位数字)" class="form-control" name="cardID" id="cardID" value="" autocomplete="off"; />
                    </div>
                    <div class="form-group">
                        <label>真实姓名</label>
                        <input type="text" placeholder="你的姓名" class="form-control" name="userName" id="userName" value="<%=myName%>" autocomplete="off"; />
                    </div>
                    <div class="form-group">
                        <label>银行卡初始密码(6位密码)</label>
                        <input placeholder="初始/原密码(6位数字)" type="password" maxlength="6" class="form-control" name="initialPassword" id="initialPassword" autocomplete="off" onclick=this.value=""; />
                    </div>
                    <div class="form-group">
                        <label>新密码(6位数字)</label>
                        <input type="password" placeholder="创建新密码(6位数字)" maxlength="6" class="form-control" name="password_st" id="password_st" onclick=this.value="">
                    </div>
                    <div class="form-group">
                        <label>确认新密码(位数字)</label>
                        <input type="password" placeholder="确认新密码(6位数字)" maxlength="6" class="form-control" name="password_nd" id="password_nd" onclick=this.value="">
                    </div>
                    <div class="form-group">
                        <input type="submit" value="确定" class="btn btn-primary">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-secondary">取消</button>
                <button type="button" class="btn btn-primary">暂时保存修改</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>