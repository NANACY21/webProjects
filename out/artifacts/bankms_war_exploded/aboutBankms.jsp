<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
    <title>bankms - ���ڱ�ϵͳ</title>
    <%--ģ��--%>
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
<%--ͷ��--%>
<%@include file="WEB-INF/header.jsp"%>
<%--����--%>
<div class="d-flex align-items-stretch">
    <%--��ߵ���--%>
    <%@include file="WEB-INF/sidebar.jsp"%>
    <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">
            <div class="container">
                <h1 class="mt-5">****</h1>
                <p>
                    <a title="����bankms��session�����������й������ԣ���õ����м�ֵ��" href="UtilServlet?Jsp=<%=this.getClass().getSimpleName().replaceAll("_",".")%>" class="btn btn-outline-primary btn-large">bankms��session</a>
                    <a href="" class="btn btn-primary btn-large">��������</a>
                </p>
            </div>
            <div class="container">
                <div class="jumbotron bg-hover-gradient-info">
                    <h1>����˵��</h1>
                    <div class="line"></div>
                    <p>
                        bankms - һ������<br/>
                        bankms��һ���������й���ϵͳ����վ��Java Web��Ŀ<br/>
                    </p>
                    <div class="line"></div>
                    <p>
                        <h5>������п�</h5>
                        ��������ϵͳ��������п����������п�<br/>
                        ��ϵͳ��������п�����İ���һ�����п�
                    </p>
                    <div class="line"></div>
                    <p>
                        <h5>���</h5>
                        �����ƣ�������Ʋ�Ʒ������˻����������˻�
                    </p>
                    <div class="line"></div>
                    <p>
                    <h5>����</h5>
                    ҽ�ơ�����<br/>
                    ���պ������ڽ���������ɱ���
                    </p>
                    <div class="line"></div>
                    <p>
                        <h5>�����߹���</h5>

                    ע��ĳ�ֻ��ſ�ͨ���ֻ����з���<br/>
                        �û�����������Ϣ֪ͨ��ɨ��֧��������Ӳ������������֤�롢�������ܡ����Ƹ�����Ϣ����Ϣ֪ͨ����¼ϵͳ����δ����Ϣ����ϢԴ��tr����һ����ť��ͬʱ���������¼�����ż�¼�����棨js��css����
                    ����ĳЩҵ����˻�����ģ��������ù��ܣ�����ơ�
                    <br/>
                        ����Ա���������m_showUnApproveServlet�����鿴�û�������־��ͳ�ơ�����->�ó��û�ϲ�õķ���->���ܵ�ǿ���Ż������������ֵĸı�<br/>
                    ����Ա��ϵͳ���û����˻��Ĳ�����Ϣ����Ա���ɼ�������ϵͳ����ÿ���û�������������Ƿ�ʱ�����ÿ�������������������
                    </p>
                    <div class="line"></div>
                    <p>
                    <h5>���Ǻ�����</h5>
                    �쿨��ת�˿��Ƕ��û��߲���<br/>
                    ������ܴ���db
                    </p>
                </div>
                <div class="jumbotron bg-hover-gradient-info">
                    <h1>����˵��</h1>
                    <div class="line"></div>
                    <p>
                        ����session setAttribute���ڿ��Ʋ㡢UI��
                    </p>
                </div>

                <div class="jumbotron bg-hover-gradient-info">
                    <h1>�ѷ�����д��&emsp;��ȥ�İ汾</h1>
                    <div class="line"></div>
                    <p>
                        <ul>
                            <li>����¼������һ��LoginVerification.jsp</li>
                            <li>���ں���¼����ͨ�û�uID�������������ģʽ��<br/>
                            һ����ͨ�û����һ������->�¼�һ��Ԫ��</li>
                            <li>info.jsp&emsp;ԭ����friendDetail.jsp<br/>
                            ����ҳ��һ��������ȥ�������/�޸ĺ��ѣ����ڽ����ڱ༭������Ϣ<br/>
                            �޸�ѡ�к��ѣ�����޸�����->ͨ��һ��Ԥ�����������ȡ�ú��ѵ���Ϣ��session����������session��ʾ��ui-><br/>
                            ͨ��һ�������������޸�<br/>
                            </li>
                        </ul>
                    </p>
                </div>

                <div class="jumbotron bg-hover-gradient-info">
                    <h1>д��</h1>
                    <div class="line"></div>
                    <p>
                    <ul>
                        <li>������ܶ�����ĳһ��jsp��session�ȸ��ǣ��ʶ�ȡsession����</li>
                        <li>������ܶ�����ĳһ��jsp��js����jsp��servlet����jsp�����Ӳ�����Ȼ��jsp��ʶ��ò�����ȷ���ñ��Ĺ��ܡ�</li>
                    </ul>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="WEB-INF/footer.jsp"%>
<%--ģ��--%>
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
