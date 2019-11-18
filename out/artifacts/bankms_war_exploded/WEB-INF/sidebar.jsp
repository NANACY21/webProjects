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
<%--��ߵ���--%>
<div id="sidebar" class="sidebar py-3">
    <div class="text-gray-400 text-uppercase px-3 px-lg-4 py-4 font-weight-bold small headings-font-family">
        �ҵ�uID&emsp;<%=session.getAttribute("uID")%><br/>bankms - ����
    </div>
    <ul class="sidebar-menu list-unstyled">
        <li class="sidebar-list-item"><a title="�˻�����֧��������" href="#" data-toggle="collapse" data-target="#accountm" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>�˻�����</span></a>
            <div id="accountm" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <%
                        BankCardServiceImpl service = new BankCardServiceImpl();
                        String uID = session.getAttribute("uID").toString();
                        List<BankCard> allBc = service.getAllBankCards(Long.parseLong(uID));
                        int i = 0;
                        for (i=0;i<allBc.size();i++){
                            out.print("<li class=\"sidebar-list-item\"><a title=\"���п���\" href=\"#\" onclick=\"return accountLogin(this);\" class=\"sidebar-link text-muted pl-lg-5\">"+allBc.get(i).getID()+"</a></li>");
                        }

                        NUserServiceImpl service1=new NUserServiceImpl();
                        long ID = service1.getNUserByuID(Long.parseLong(uID)).getID();
                        String myName = service1.getNUserByuID(Long.parseLong(uID)).getName();
                    %>
                    <li class="sidebar-list-item"><a title="�쿨" class="sidebar-link text-muted pl-lg-5" data-toggle="modal" data-target="#HandleCard">&emsp;+&emsp;������п�</a></li>
                    <li class="sidebar-list-item"><a title="�������п�" class="sidebar-link text-muted pl-lg-5" data-toggle="modal" data-target="#AccountActivation">&emsp;!&emsp;�������п�</a></li>
                    <li class="sidebar-list-item"><a title="��ʧ���п�" class="sidebar-link text-muted pl-lg-5" data-toggle="modal" data-target="#AccountActivation">&emsp;-&emsp;��ʧ���п�</a></li>
                </ul>
            </div>
        </li>
        <li class="sidebar-list-item"><a title="ת�˺ͻ��" href="#" data-toggle="collapse" data-target="#tatr" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>ת�˺ͻ��</span></a>
            <div id="tatr" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <li class="sidebar-list-item"><a title="���" href="#" class="sidebar-link text-muted pl-lg-5">���</a></li>
                    <li class="sidebar-list-item"><a title="ȡ��" href="#" class="sidebar-link text-muted pl-lg-5">ȡ��</a></li>
                    <li class="sidebar-list-item"><a title="ת��" href="#" class="sidebar-link text-muted pl-lg-5">ת��</a></li>
                    <li class="sidebar-list-item"><a title="���" href="#" class="sidebar-link text-muted pl-lg-5">���</a></li>
                </ul>
            </div>
        </li>
        <li class="sidebar-list-item"><a title="����ɷ�" href="#" data-toggle="collapse" data-target="#lifepay" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>����ɷ�</span></a>
            <div id="lifepay" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <li class="sidebar-list-item"><a title="������" href="lifePay.jsp" class="sidebar-link text-muted pl-lg-5">�ƶ��ɷ�</a></li>
                    <li class="sidebar-list-item"><a title="ˮ��ú���ɷ�" href="#" class="sidebar-link text-muted pl-lg-5">ˮ��ú���ɷ�</a></li>
                    <li class="sidebar-list-item"><a title="ѧ��" href="#" class="sidebar-link text-muted pl-lg-5">ѧ��</a></li>
                    <li class="sidebar-list-item"><a title="�ɷѼ�¼" href="#" class="sidebar-link text-muted pl-lg-5">�ɷѼ�¼</a></li>
                </ul>
            </div>
        </li>
        <li class="sidebar-list-item"><a title="����" href="p_introducLoan.jsp" data-toggle="collapse" data-target="#pages" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-app-layout-1 mr-3 text-gray"></i><span>����</span></a>
            <div id="pages" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <li class="sidebar-list-item"><a title="�������" href="p_applyLoan.jsp" class="sidebar-link text-muted pl-lg-5">��������</a></li>
                    <li class="sidebar-list-item"><a title="�鿴����״̬������Ա�����Ƿ񷢷Ŵ����֮ǰ����ȡ���������û�����" href="p_myLoanServlet" class="sidebar-link text-muted pl-lg-5">�ҵĴ���</a></li>
                    <li class="sidebar-list-item"><a title="�������" href="p_introducLoan.jsp" class="sidebar-link text-muted pl-lg-5">�������</a></li>
                    <li class="sidebar-list-item"><a title="��Ȳ�ѯ" href="#" class="sidebar-link text-muted pl-lg-5">��Ȳ�ѯ</a></li>
                </ul>
            </div>
        </li>
        <li class="sidebar-list-item"><a title="�������" href="p_AnalysisServlet" class="sidebar-link text-muted "><i class="o-sales-up-1 mr-3 text-gray"></i><span>�������</span></a></li>
        <li class="sidebar-list-item"><a title="�����շ���Ͷ���ͽ��ɱ��գ��йر��յĶ�������" href="#" data-toggle="collapse" data-target="#ins" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>����</span></a>
            <div id="ins" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <li class="sidebar-list-item"><a title="�����յ�ע������" href="InsServlet?target=insuringNotice" class="sidebar-link text-muted pl-lg-5">Ͷ����֪</a></li>
                    <li class="sidebar-list-item"><a title="��Ʒ���ģ�ѡ����Ҫ����ı��գ����ڽ��������ַ�ʽ" href="InsServlet?target=allInsProduct" class="sidebar-link text-muted pl-lg-5">��Ʒ����</a></li>
                    <li class="sidebar-list-item"><a title="����һ���籣��" href="InsServlet?target=SSCard" class="sidebar-link text-muted pl-lg-5">���籣��</a></li>
                    <li class="sidebar-list-item"><a title="�ҵı���" href="InsServlet?target=myIns" class="sidebar-link text-muted pl-lg-5">�ҵı���</a></li>
                </ul>
            </div>
        </li>
        <li class="sidebar-list-item"><a title="������" href="#" data-toggle="collapse" data-target="#mLot" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>������</span></a>
            <div id="mLot" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <li class="sidebar-list-item"><a title="��Ʋ�Ʒ" href="#" class="sidebar-link text-muted pl-lg-5">��Ʋ�Ʒ</a></li>
                    <li class="sidebar-list-item"><a title="�ṹ�Դ��" href="#" class="sidebar-link text-muted pl-lg-5">�ṹ�Դ��</a></li>
                    <li class="sidebar-list-item"><a title="�ҵ�Ͷ��" href="#"  class="sidebar-link text-muted pl-lg-5">�ҵ�Ͷ��</a></li>
                </ul>
            </div>
        </li>
        <li class="sidebar-list-item"><a title="��ѯ����������(����)��������Ϣ" href="#" data-toggle="collapse" data-target="#wangdian" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>�����ѯ</span></a>
            <div id="wangdian" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <li class="sidebar-list-item"><a title="��ʾ��ͼ" href="ShowMapServlet" class="sidebar-link text-muted pl-lg-5">��ʾ��ͼ</a></li>
                    <li class="sidebar-list-item"><a title="��ʾ���л�����Ϣ" href="ShowMapServlet" class="sidebar-link text-muted pl-lg-5">��ʾ���л�����Ϣ</a></li>
                </ul>
            </div>
        </li>
        <li class="sidebar-list-item"><a title="���͹���" href="#" data-toggle="collapse" data-target="#jiehui" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>���͹���</span></a>
            <div id="jiehui" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <li class="sidebar-list-item"><a title="����������Ϣ" href="FESandFEPServlet?target=rate" class="sidebar-link text-muted pl-lg-5">��������</a></li>
                    <li class="sidebar-list-item"><a title="���" href="FESandFEPServlet?target=FES" class="sidebar-link text-muted pl-lg-5">���</a></li>
                    <li class="sidebar-list-item"><a title="����" href="FESandFEPServlet?target=FEP" class="sidebar-link text-muted pl-lg-5">����</a></li>
                    <li class="sidebar-list-item"><a title="���͹��㽻�ײ�ѯ" href="FESandFEPServlet?target=FFTR" class="sidebar-link text-muted pl-lg-5">���ײ�ѯ</a></li>
                </ul>
            </div>
        </li>
        <li class="sidebar-list-item"><a title="��������" href="#" data-toggle="collapse" data-target="#other" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>��������</span></a>
            <div id="other" class="collapse">
                <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                    <li class="sidebar-list-item"><a title="��ʾ�ҵĺ����б�" href="GetAllFriendServlet" class="sidebar-link text-muted pl-lg-5">�ҵĺ���</a></li>
                    <li class="sidebar-list-item"><a title="��������ѧѧ�������ѯ" href="GPA.jsp" class="sidebar-link text-muted pl-lg-5">�����ѯ</a></li>
                    <li class="sidebar-list-item"><a title="faq" href="faq.jsp" class="sidebar-link text-muted pl-lg-5">faq</a></li>
                    <%
                        String name="������Ϸ";
                    %>
                    <li class="sidebar-list-item"><a title="������Ϸ" href="guessNumber.jsp?name=<%=name%>" charset="gbk" class="sidebar-link text-muted pl-lg-5">������Ϸ</a></li>
                </ul>
            </div>
        </li>
    </ul>
    <div class="text-gray-400 text-uppercase px-3 px-lg-4 py-4 font-weight-bold small headings-font-family">bankms - EXTRAS</div>
    <ul class="sidebar-menu list-unstyled">
        <li class="sidebar-list-item"><a title="�ҵ���Ϣ" href="info.jsp" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>��</span></a></li>
        <%--session��uID��Ϊ�ղ���ʾ--%>
        <li class="sidebar-list-item"><a title="���µ�¼��ϵͳ" href="LogoutServlet" class="sidebar-link text-muted"><i class="o-exit-1 mr-3 text-gray"></i><span>���µ�¼</span></a></li>
        <li class="sidebar-list-item"><a title="��ȡ���з������Ϣ��������ѯ" href="#" class="sidebar-link text-muted"><i class="o-survey-1 mr-3 text-gray"></i><span>��Ѷ����ѯ</span></a></li>
        <li class="sidebar-list-item"><a title="����bankms������˵��" href="aboutBankms.jsp" class="sidebar-link text-muted"><i class="o-imac-screen-1 mr-3 text-gray"></i><span>����bankms</span></a></li>
        <li class="sidebar-list-item"><a title="���ڼ���֧��" href="#" class="sidebar-link text-muted"><i class="o-database-1 mr-3 text-gray"></i><span>���ڼ���֧��</span></a></li>
        <li class="sidebar-list-item"><a title="���ڿ������Ŷ�" href="#" class="sidebar-link text-muted"><i class="o-paperwork-1 mr-3 text-gray"></i><span>���ڿ������Ŷ�</span></a></li>
    </ul>
</div>

<%--�쿨������--%>
<div id="HandleCard" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="exampleModalLabel" class="modal-title">���һ�����п�</h4>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">��</span></button>
            </div>
            <div class="modal-body">
                <p>���һ�����п�</p>
                <form action="HandleCardServlet?Jsp=<%=this.getClass().getSimpleName().replaceAll("_",".")%>" method="post">
                    <div class="form-group">
                        <label>���֤��</label>
                        <input type="number" maxlength="18" placeholder="������֤��(18λ����)" class="form-control" name="userID" value="<%=ID%>">
                    </div>
                    <div class="form-group">
                        <label>��ʵ����</label>
                        <input type="text" maxlength="18" placeholder="�����ʵ����" class="form-control" name="userName" value="<%=myName%>">
                    </div>
                    <div class="form-group">
                        <input type="submit" value="ȷ��" class="btn btn-primary">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-secondary">ȡ��</button>
                <button type="button" class="btn btn-primary">��ʱ�����޸�</button>
            </div>
        </div>
    </div>
</div>

<%--�������п�������--%>
<div id="AccountActivation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="exampleModalLabel1" class="modal-title">����һ�����п�</h4>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">��</span></button>
            </div>
            <div class="modal-body">
                <p>���һ�����п�</p>
                <form action="accountActivationServlet?Jsp=<%=this.getClass().getSimpleName().replaceAll("_",".")%>" method="post">
                    <div class="form-group">
                        <label>���п���</label>
                        <input type="number" oninput="if(value.length>16) value=value.slice(0,16)" placeholder="���п���(16λ����)" class="form-control" name="cardID" id="cardID" value="" autocomplete="off"; />
                    </div>
                    <div class="form-group">
                        <label>��ʵ����</label>
                        <input type="text" placeholder="�������" class="form-control" name="userName" id="userName" value="<%=myName%>" autocomplete="off"; />
                    </div>
                    <div class="form-group">
                        <label>���п���ʼ����(6λ����)</label>
                        <input placeholder="��ʼ/ԭ����(6λ����)" type="password" maxlength="6" class="form-control" name="initialPassword" id="initialPassword" autocomplete="off" onclick=this.value=""; />
                    </div>
                    <div class="form-group">
                        <label>������(6λ����)</label>
                        <input type="password" placeholder="����������(6λ����)" maxlength="6" class="form-control" name="password_st" id="password_st" onclick=this.value="">
                    </div>
                    <div class="form-group">
                        <label>ȷ��������(λ����)</label>
                        <input type="password" placeholder="ȷ��������(6λ����)" maxlength="6" class="form-control" name="password_nd" id="password_nd" onclick=this.value="">
                    </div>
                    <div class="form-group">
                        <input type="submit" value="ȷ��" class="btn btn-primary">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-secondary">ȡ��</button>
                <button type="button" class="btn btn-primary">��ʱ�����޸�</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>