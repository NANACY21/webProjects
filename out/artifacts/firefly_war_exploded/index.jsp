<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
    <title>jq����֪ʶ</title>
    <script src="js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="css/friendList.css">
    <style>
        a {
            /*float: left;*/
            text-decoration: none;
            color: yellowgreen;
        }
        div {
            border: 2px solid yellowgreen;
            margin: 30px 30px 30px 30px;
        }
        .model {
            height: auto;
            max-height: 600px;
            overflow: scroll;
            padding: 30px 30px 30px 30px;
        }
        a:hover {
            text-decoration: underline;
            /*text-decoration: greenyellow;*/
        }

        div:hover {
            border: 2px solid red;
            border-bottom: 3px solid red;
            border-radius: 10px;
        }
        p:hover {
            /*border: 2px solid fuchsia;*/
        }

        h1,h2,h3,h4,h5,h6{
            text-align: center;
            color: red;
        }
        label{
            color: red;
        }

        #knowledge li,#wti li,#help li {

            list-style: none;
            /*���ø���֮�󲻻��������*/
            float: left;
            margin: 10px 40px 0px 0px;
        }
        /*�����Է���*/
        .houduan,.houduan li a{
            color: #55db78;
        }
        .qianduan,.qianduan li a{
            color: deeppink;
        }
        .db,.db li a {
            color: #4C84FF;
        }
        .network,.network li a {
            color: fuchsia;
        }
        .ds,.ds li a{
            color: lightseagreen;
        }
        .suanfa,.suanfa li a {
            color: #4C84FF;
        }
        .jvm,.jvm li a {
            color: blue;
        }
        .linux,.linux li a{
            color: #4C84FF;
        }
        .msnr,.msnr li a{
            color: red;
        }
        .docccccc,.docccccc li a{
            color: #6c5328;
        }
        .ques,.ques li a{
            color: #1caf9a;
        }

        /*�����ĵ�����*/
        .doc,.doc li a {
            color: deeppink;
        }
        .jsjc,.jsjc li a {

            color: yellowgreen;
        }
        .install,.install li a {
            color: blue;
        }
        .use,.use li a {
            color: indianred;
        }
        .download,.download li a {
            color: blueviolet;
        }
        .ow,.ow li a {
            color: orange;
        }
        .acm,.acm li a {
            color: lightseagreen;
        }
    </style>
</head>
<body>

<div class="index">
    <a target="_blank" href="html.jsp">htmlʾ��</a>
    <a target="_blank" title="����¼" href="css.jsp">cssʾ��</a>
    <a target="_blank" href="js.jsp">js����/BOM/����</a>
    <a target="_blank" href="DOM.html">js��DOM����</a>
    <a href="jquery.html">jQuery����</a>
    <a href="selector.html">jqueryѡ����ʾ��</a>
    <a href="action.html">jquery�¼�ʾ��</a>
    <a href="Ajax.html">jquery - Ajaxʾ��</a>
    <a href="JSON.html">JSON</a>
</div>

<div class="index">
    <a href="form.html">�����л�</a>
    <a href="preventdefault.html">�¼���Ĭ����Ϊ</a>
    <a title="VUE���" target="_blank" href="vue.html">VUE</a>
    <a title="ǰ��ʾ��" target="_blank" href="tpp.html">�Ծ��ӡ</a>
    <a href="/nancy/">servletʾ��</a>
    <a href="el.jsp">EL���ʽ</a>
    <a href="JSTL.jsp">JSTL</a>
    <a href="Filter.jsp">������Filter</a>
    <a href="JSTL.jsp">������listener</a>
</div>

<div class="index">
    <a href="upload.jsp">�ļ��ϴ�</a>
    <a href="upload.jsp">���ݿ����ӳ�</a>
    <a href="upload.jsp">tomcat-���ݿ����ӳ�</a>
    <a href="#mvc">mvc</a>
    <a href="#maven">maven</a>
    <a href="#Spring">Spring</a>
    <a href="#Spring MVC">Spring MVC</a>
    <a href="#Mybatis">Mybatis</a>
    <a href="#Spring Boot">Spring Boot</a>
</div>

<div class="index">
    <a href="#Spring Data JPA">Spring Data JPA</a>
    <a href="#Spring Cloud">Spring Cloud</a>
    <a title="IDEAʹ��ʱ����������" target="_blank" href="idea.html">IDEA</a>
    <a title="Linux����" target="_blank" href="linux.html">Linux</a>
    <a title="�����й�Gitѧϰ����������" target="_blank" href="git.html">Git</a>
</div>

<div class="index">
    <a href="#note">����¼</a>
    <a href="#wti">������</a>
    <a href="#knowledge">����֪ʶ</a>
    <a href="#help">�����ĵ�</a>
    <a title="����" target="_blank" href="yonyou.html">������־</a>
</div>

<div id="mvc" class="model">
    <h1>mvc</h1>
    <p>
        ��Ŀ��ѭmvc���淶<br/>
        ���ݷ��ʲ�ʹ�õ���daoģʽ<br/>
        web�㣨ui��ʹ�õ���mvcģʽ<br/>
        mvcģ�ͺͷֲ㲻��ͻ<br/>
        mvc��ui��<br/>
    </p>
    <hr/>
    �ͻ�->view->controller->model->controller->view<br/>
    <hr/>
    ����ֱ������controller��<br/>

    <p>��ĿԽ��Խ�������ּ���ǽ���ϡ�</p>
    <p>�û�Խ��Խ�࣬�����ּ���Ǹ߲�����</p>
    <p>����Խ��Խ�࣬�����ּ���Ǵ����ݡ�</p>
    <p>����Խ��Խ���ӣ������ּ����AI��</p>
    <p>��ˣ��ֲ�ʽ����������Ҫ��</p>
</div>

<div id="maven" class="model">
    <h1>maven</h1>

    <p>
        maven�ǿ�ƽ̨��Ŀ�����ߣ��������Ϊһ��jar�ֿ⣬��Ϊ���زֿ��Զ�ֿ̲⡣<br/>
        maven���Թ�����Ŀ�������ڣ�<strong>����������ϵ������jar����</strong>
    </p>
    <hr/>
    <p>
        IDEA�Դ�maven������������Լ����ص�maven�����Լ���maven�йؼ��ļ���Ŀ¼����λ�ã�
    <ul>
        <li style="color: red">settings.xml��Ҫ�ڸ������ļ�������repositoryĿ¼��·��������repositoryĿ¼��������ˣ���IDEA���Զ���repositoryĿ¼</li>
        <li style="color: blue;">repositoryĿ¼&emsp;<a style="color: blue" href="https://zhidao.baidu.com/question/621815348718681892.html">��ע</a> </li>
    </ul>
    ʹIDEA��maven���ܣ��²������Ȼ�������������Լ����ص�maven����ѡIDEA���õ�maven<br/>
    <ul>
        <li><a target="_blank" href="https://www.jb51.net/article/129456.htm">IDEA���òο�1</a></li>
        <li><a target="_blank" href="https://www.cnblogs.com/zhangchengzi/p/9865100.html">IDEA���òο�2</a></li>
        <li><a target="_blank" href="https://jingyan.baidu.com/article/7f766dafe93d214101e1d039.html">IDEA���òο�3</a></li>
    </ul>
    ����IDEA����mavenOK����maven���Դ���web��Ŀ��Java��Ŀ��
    </p>
    <hr/>
    <p>
    <ul>
        <li><a href="https://www.cnblogs.com/weibanggang/p/9652570.html" target="_blank">IDEA����maven��Ŀ</a><br/>
            ���ִ�����ʽ�ᴴ��һ��moduleģ�壬�����ǵ����Ŀյĸ�maven��Ŀ��<br/>
            <hr/>
            <span style="color: green">���⣬���ڴ���maven��Ŀ�����ǿ���(1)�����յĸ�maven��Ŀ��֮�����½�ģ�飻(2)������ģ���maven��Ŀ��(3)����һ����ģ��ģ���maven��Ŀ����Ȼ�����ǿ�����ʱ���ģ�飬ģ��Ҳ����Ŀ��</span><br/>
            <a target="_blank" href="https://blog.csdn.net/sinat_30160727/article/details/78109769">������ģ���maven��Ŀ</a><br/>
            <a href="https://blog.csdn.net/T2080305/article/details/80545880">������ģ���maven��Ŀ��������</a><br/>
        </li>
        <li><a href="https://jingyan.baidu.com/article/0964eca2ac437e8285f536c3.html" target="_blank">IDEA����maven��Ŀ��������</a></li>
        <li><a href="https://www.jianshu.com/p/99dfec9be081" target="_blank">��������</a> </li>
        <li></li>
        <li><a href="https://blog.csdn.net/hwy_java/article/details/85005649">mavenWeb��Ŀ����Ŀ¼�ṹ</a> </li>
        <li><a href="https://blog.csdn.net/qq_31496897/article/details/77186576">���<strong>web�汾��2.3</strong></a> </li>
        <li><strong>û��src/main/javaĿ¼��Ŀ¼�ṹ��eclipse��һ������</strong>�Ҿ����ֶ��½��Ϳ����ˡ�</li>
    </ul>
    <a title="������������Ҫ��jar������" style="color: blue" href="https://mvnrepository.com/">maven������ַ</a><br/>
    �ڸ���վ���ҵ�����Ҫ��jar��֮������pom.xml����浽�㱾�ص�maven�ֿ⣬�´�������ͬ��jar���ļ��Ͳ���Ҫ�����ˡ�
    </p>
    <hr/>
    <p>
        maven˽��
    </p>
</div>

<div id="Spring" class="model">

    <%--�����ǩ�Դ�p��ǩ--%>
    <h1>Spring</h1>
    <h1><a href="https://spring.io/" target="_blank">spring����</a></h1>


    <h3>spring����</h3>
    <p>
        spring���������J2EE����Ľ��������<br/>
        Java��������ķ�ʽ��new���ӹ���ȡһ�����󣨹���ģʽ��Ӧ�ã������䣨������䣩�� spring���ǰ�����䣬������Ҫ��ʱ���ٸ��㣬spring��һ��bean������<br/>
    </p>


    <h3>spring��������IOC��AOP֮IOC����sonģ�飩</h3>
    <p>
        <label>IOC�����Ʒ�ת��</label>��IOC������������е�һ�����ԭ�򣬼����ֶ��������󣬽���spring����������������������ڡ�����ķ�ʽ��DI������ע�룩������spring��ܵĺ��ġ�<br/>
        springIOC�����Խ���˶��󴴽������⡢������ϵά�������⡣<br/>
        ioc��Spring�����bean����������Ҫ�����÷��似��������仺����󣬹��������������������ע�롣Spring��bean�������������þ��ǻ������<br/>
        <strong>������ϵ����ĸ�ֵ����spring���������</strong><br/>
        ����һ��bean��ֻ��һ�����÷�ʽ��ע������ -> xml���û�ע�⣬�Լ�д��classһ��ʹ��ע�⡣��ע�����������дxml��bean��<br/>
    </p>


    <h3>spring��������IOC��AOP֮AOP����son2ģ�飩</h3>
    <p>
        <label>AOP�����������̣�</label>��AOP����IOC��AOP�Ƕ�OOP�Ĳ��䣬����OOP����ͻ����ʹ�����ھ��Ը��ߡ�<br/>
        AOP����ʹ���������϶Ƚ��ͣ�AOP���ض�Ӧ�ó��������������������ķֲ�<br/>
        һ�����ܣ�����ִ��˳�򣬼���Σ�<br/>
        <strong>���ԣ�ʲô��AOP�����������̣������Σ�ui->db������Ҫ���úܶ෽�����е���˳�򣩣�db->ui�����кܶ�㣬������������棬</strong><br/>
        ����������������������˼�롣<br/>
        <label>�ѷǹ����Դ��루���¼���ˣ���ȡ����...�����빦�ܴ���ִ��ǰ���ÿ��ҳ�涼д��ͬ��code ��ÿ��ҳ�涼Ҫ��¼���ܷ��ʣ�����ȡ�������AOP��</label><br/>

        ���룺IOC�ǻ���bean��AOP�ǻ���ǹ����Է��������Ƿ��䡣<br/>
        <label><strong>AOP�ײ���ƣ���̬��������ΪĿ���ࣨĿ�깦�ܣ�����ǰ/���ô��롣���Ƕ�����Ŀ���ࡣ</strong></label>
    </p>


    <h3>spring��dao��֧�֣���son2ģ�飩</h3>
    <p>
        springJDBC��<br/>
        �����������ݱ���һ�ֶΣ�ɾ��ʱ�䣬��̬����ɾ����־[��֪ͨ]<br/>
        spring�������в�����־�������������ִ����־��<label>����spring����������֧�֡�</label> <br/>
        spring�����񴫲��Ĺ���<br/>
    </p>

</div>

<div id="Spring MVC" class="model">
    <h1>Spring MVC</h1>
    <h3>Spring MVC����</h3>
    <p>
        Spring MVC��spring��ܵĺ�����Ʒ����һ������MVC��web��ܣ�Զ��struts2��<br/>
        <label>�˽⣺Spring MVC��ܴ�������ͼ������ģʽ</label><br/>
    </p>
    <h3>Spring MVC���Ĺ��ܣ���son3ģ�飩</h3>
    <p>
        ��400 -> �ͻ��˴���<br/>
        ����ӳ��<br/>
        ��������ֵ<br/>
        �����󶨣���springmvc�У�data��ui��db���ٷ�֮<br/>
        ת����<br/>
        ����У�飺��jsУ�飬����ȫ���ڿ�����У�飬service�������Զ����쳣��dao������Щ��<br/>
        ���ݻ��ԣ���Ϊ��ɢ�����ݡ�pojo<br/>
        �쳣����ͳһ�׸�һ���쳣������������ÿ����try catch��<br/>
        �����������ƹ�������������������־��δ��¼���ص�<br/>
        �ļ��ϴ�<br/>
        json���ݽ���<br/>
        RESTful��������״̬���ݣ�һ������ܹ����ǰ��˷���<br/>
        ����<br/>
    </p>
    <h3>����</h3>
    <p>
        <a target="_blank" href="https://blog.csdn.net/eson_15/article/details/51725470">����У��</a>&emsp;
    </p>
    <h3>���֪ʶ������</h3>
    <ol>
        <li>����У��Ϊʲô��properties�ļ����󣬱������⣿</li>
    </ol>
</div>

<div id="Mybatis" class="model">
    <h1>Mybatis</h1>
    <h1><a title="��Ҳ������maven" href="https://github.com/mybatis">Mybatis���ص�ַ</a></h1>
    <h3>Mybatis����</h3>
    <p>
        Mybatis��ԭ����iBatis������һ��ORM�������ϵӳ�䣩��ܣ���һ���־ò��ܣ��ǻ���java�ĳ־ò��ܣ�MyBatis�����˼������е�JDBC������ֶ����ò����Լ���ȡ�������<br/>
        MyBatis����ʹ�ü򵥵�XML��ע�������ú�ӳ��ԭ����Ϣ�����ӿں�Java��POJOs���򵥵�Java����ʵ���ࣩӳ������ݿ��еļ�¼��<br/>
        dao&emsp;-&emsp;�־ò㣨�������ݳ־û���&emsp;-&emsp;db<br/>
        �־ò��dao���ں�һ����ʹ��<br/>
        ORM��ܽ����������������Ժ͹�ϵ�����ݿⲻƥ������⣬Mybatis��ʹ�������ݿ���ʹ�������������һ��<br/>
        hibernate�Ǵ�ORM��ܣ���Mybatis�ǰ�ORM��ܣ�Ҫ��дsql��<br/>
        <label>MybatisҪ������ -> ʵ�����sql֮�佨��ӳ���ϵ</label><br/>
    </p>
    <h3>Mybatis�������ã���son4ģ�飩</h3>
    <h3>mybatis����dao�㣨��son4ģ�飩</h3>
    <p>
        1.��ͳ������ʽ��mybatis��dao��֧�֣���daoimpl�ӳ�Ա����sqlsession����<br/>
        2.mapper��������ʽ��mybatis��dao��֧�֣�ֻ��ʵ�ֽӿڣ�����֤��ӳ���ļ�����һ�£������ɴ���ʵ���࣬<br/>
        ʹ��mapper����ע�⣺namespace��ӳ���ļ�insert�ȵ�id�ͽӿڷ�����һ�¡���������=�ӿڷ����β����͡�����ֵҲҪһ��<br/>
    </p>
    <h3>mybatis���Ĺ��ܣ���son4ģ�飩</h3>
    <p>
        mybatis���򹤳̣��������������main->db��������Java code����pojo��mapper�ӿڡ�ӳ���ļ����޸�һ�£�����������������<br/>
        <label><strong>��̬sql</strong></label><br/>
        <label><strong>mybatis������ѯ�ͣ���ҳ��ѯ���ã��ӳټ��أ��ص㣡������son4ģ�飩</strong></label><br/>
        mybatis��ѯ�������ã��ռ任ʱ��<br/>
        һ�����棺�ڶ��β�ѯ�ӻ�����ȡ������һ��sqlsession�Ự����û��ʱ����ͬsql���/�������ֻ������/��ѯһ��mysql<br/>
        �������棺��namespace����ģ�ͬһ���ӿڵ���ͬ��ѯ����������棬Ҫ�ʵ�����<br/>
        soap���򵥶������Э�飬����webservice�Ļ�����soa��������� �칹ϵͳ֮�䴫��data<br/>
        ����xml�����ڲ��ؼ��ˣ���dom4j<br/>
        ˼����������spring IOC��ܣ�������һ��xml������springbean��xml��2019-08-16-1��10���ӣ���dom4j����xml<br/>
        ����SSM����son3ģ�飬��ģ�麬5�㣩��struts2+spring+hibernate->Java���SSM<br/>
    </p>
    <h3>���֪ʶ������</h3>
    <ol>
        <li><a target="_blank" href="https://www.cnblogs.com/zhuangfei/p/9492915.html">�������ݵ�ӳ������</a></li>
        <li><a target="_blank" href="https://blog.csdn.net/weixin_42215286/article/details/86765076">���򹤳���Ч</a>&emsp;</li>
        <li>
            ����ʱ�Ҳ�����Ӧӳ��xml�ļ���<br/>
            ӳ���ļ�namespaceΪmapper�ӿڣ�<br/>
            xml�ļ�Ҫ����resources�SSM����ʱsqlSessionFactory bean������Ҫ˵��ӳ���ļ���λ��
        </li>
    </ol>
</div>

<div id="Spring Boot" class="model">
    <h1>Spring Boot</h1>
    <h3>Spring Boot����</h3>
    <p>
        Spring Boot��Spring MVC�������棬��һ�������ļ���һվʽ���񣬴���SSM��<br/>


    </p>
    <h3>֪ʶ��</h3>
    <ul>
        <li>���������¼�demo��Ŀ������</li>
        <li>����servlet��2�ַ�ʽ</li>
        <li>��̬��Դ�ķ���</li>
        <li>����jsp�����ص㣩</li>
        <li>���������¼�heal��Ŀ������</li>
        <li>����Thymeleaf</li>
        <li>Spring Boot��������SSM</li>

        <li>����֤</li>
        <li>�쳣����</li>
        <li>����junit</li>
        <li>�Ȳ���</li>
    </ul>
    <h3>���֪ʶ������</h3>
    <p>
        <a target="_blank" href="https://blog.csdn.net/qq_40550973/article/details/85109572">�汾ƥ������</a>&emsp;
        <a target="_blank" href="https://www.jianshu.com/p/a98049ae3869">SpringBoot��У��</a>&emsp;
    </p>
</div>

<div id="Spring Data JPA" class="model">
    <h1>Spring Data JPA</h1>
    <h3>Spring Data JPA����</h3>
    <p>
        spring�������Ϻܶ��ܣ���mybatis��hibernate��jpa��Java�־û�Ӧ�ã���<br/>
        jpa��һ�׹淶�������в�Ʒ��hibernate jpa��springdata jpa<br/>
        springdata jpa��spring data��Ŀ�µ�ģ�飬�ײ���hibernate jpa<br/>


    </p>
    <h3>֪ʶ�㣨��son5����spring data��jpa��һ���֣�</h3>
    <p>
        spring��spring data jpa���ϣ�spring data jpa�������ݲ�����ʽ<br/>
        hibernateҪ������������<br/>
        spring data��ѯ��ҳ���������<br/>
        �������ϵ���ã�pojo�У����ⲻ��Ҫ���ű������ˣ��ӳټ������ԣ�һ�Զ��ϵ��<br/>
        <br/>
    </p>
    <h3>���֪ʶ������</h3>
    <p>
        <a target="_blank" href="https://www.cnblogs.com/KAZMA/articles/5329732.html">ָ��session���ӳٹر�</a>&emsp;
    </p>
</div>

<div id="Spring Cloud" class="model">
    <h1>Spring Cloud</h1>
    <p>
        ��ȥ��һ����վֻ��һ���������ϣ����Ǵ�ͳ�ܹ���<br/>
        ��һ����Ŀ�������Ŀ����Щ����Ŀ֮��Ҫͨ�ŵģ����Ƿֲ�ʽ�ܹ�<br/>
        SOA�ܹ����������ܹ����ѹ�ͬ��ҵ���߼���ȡ�����γ�һ�������ṩ����������ӿڽ��е��ã����������֮�����ʹ��rpcԶ�̼���<br/>
        rpcԶ�̣���xml��ʽͨѶ�����ݵ����ݷ�װ��xml�<br/>

        ΢����ܹ�����SOA�ܹ��ݱ������<br/>
        ����֮�䲻Ӱ�죬�����������<br/>
        ΢����ܹ�������httpЭ�鴫�����ݣ�������rpc��restful���API��ʽ������ͨѶ��json��ʽ���ݴ��䣬������xml���ݸ�ʽ�����ݲ��ö����ƣ�<br/>
        ΢�����ÿһ��ְ��һ���ܴ���ڶ����ķ����У��������Ĳ���<br/>
        ÿ�����������ڵ����Ľ�����<br/>
        ÿ���������Լ��������ݿ�洢��ʵ�������Լ������Ļ��桢db����Ϣ���е���Դ<br/>
        <strong>һ����Ŀ�������ֳܷ�����Ŀ����Щ����Ŀ��������ͬ�������ϣ�Ҳ�����ڲ�ͬ�������ϣ�����Ŀ֮��ͨ�š�</strong><br/>

    </p>
    <h3>Spring Cloud����</h3>
    <p>
        Spring Cloud�ǻ���Spring Boot����֮�Ͽ�����΢�����ܣ�Spring Cloud�ṩ��һ��������΢���������������ݰ�����������ע�����ġ����ù�����·��������·�ɡ�΢�����������ߡ�ȫ�������ֲ�ʽ�Ự�ȣ�΢�������ж�����������<br/>
        һ�㼯���Ű���Ͱͳ�Ʒ��Dubbo�ֲ�ʽ�����ܣ���ȫok�ˣ�<br/>
        Spring Cloud�����ڶ������Ŀ��<br/>

    </p>
    <ul>
        <li>Spring Cloud config���ֲ�ʽ��������</li>
        <li>Spring Cloud netflix���������
            <ul>
                <li>Eureka���������� ע������</li>
                <li>Hystrix�����񱣻����</li>
                <li>Ribbon���ͻ����ؾ�����</li>
                <li>Feign������ribbon��hystrix������ʽ����������</li>
                <li>Zuul������������ṩ����·�ɡ����ʹ��˵ȹ���</li>
            </ul>
        </li>


    </ul>

    <h3>�������� Spring Cloud Eureka����Դ����</h3>
    <p>
        ʲô�Ƿ�������<br/>
        �ڴ�ͳrpcԶ�̵����У����������������ϵ������Ƚϸ��ӣ�������Ҫʹ�÷�������������������֮��������ϵ��<br/>
        ����ʵ�ַ�����á����ؾ��⡢�ݴ�ȣ�<br/>
        ʵ�ַ�������ע��<br/>
    </p>
    <h3>����ķ�����ע��</h3>
    <p>
        �ڷ���ע���뷢���У���һ������ע�����ģ���������������ʱ�򣬻�ѵ�ǰ�Լ�����������Ϣ ���� �����ַͨѶ��ַ���Ա�����ʽע��<br/>
        ������ע�������ϣ���������ע�����ľ����ҵ���������ˡ�<br/>
        ��һ��������������[��ʹ��ĳ������ģ�ʹ�ýӿڵ�]������ṩ��[����ʹ��������񣬶����ṩ/��¶�ӿ�]�����Ըñ����ķ�ʽȥ����ע�������ϻ�ȡ��ʵ�ʵķ���ͨѶ��ַ��<br/>
        �ú���ʵ�ֱ���rpc����Զ��<br/>
    </p>
    <h3>�����ע�����ģ���son6[Spring Cloud Eureka Server]��maven��Ŀ��</h3>
    <p>

    </p>
    <h3>΢����ܹ�son6-son8</h3>
    <p>
        ע�����ģ������ṩ�ߣ�����������<br/>
        ȱ�㣬ע�����Ĺ��ˣ������ӽڵ�����ṩ�ߣ����������߶��������ˣ����Ը�ע���������߿��ã��滻ע������<br/>
        ��Spring Cloud���ýڵ���໥ע�ᣬ����������Ϊע�����ģ���������Ϊ����ڵ㣬һ�����ˣ�����һ������ʽ��ע�����ĵ�register-with-eureka: false�ĳ�true<br/>
    </p>

</div>

<div id="note" class="model">
    <h1>����¼</h1>
    <ol>
        <li>8.17hadoopû��</li>
        <li>���ݽṹ</li>
        <li>��ҵ��Ŀ</li>
    </ol>
    <h2>bug</h2>
    <ol>
        <li>web��Ŀ�����Ų���������Ƿ�����</li>
    </ol>
</div>

<div id="wti" class="model">
    <h1 title="����/���Լ�¼">������</h1>
    <h3><label class="houduan">���</label>&emsp;<label class="jvm">JVM</label>&emsp;<label class="qianduan">Webǰ��</label>&emsp;<label class="db">���ݿ�</label>&emsp;<label class="network">���������</label>&emsp;<label class="ds">���ݽṹ</label>&emsp;<label class="suanfa">�㷨</label>&emsp;<label class="linux">Linux</label>&emsp;<label class="msnr">��������</label> </h3>
    <ul class="houduan">
        <li><a target="_blank" href="https://blog.csdn.net/qq_33275597/article/details/79692056">HashMap��ô����̰߳�ȫ</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/aspirant/p/11450839.html">HashMap�̲߳���ȫ�ĺ��</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/gududedabai/article/details/85784161">ΪʲôHashMap������2���ݴ�</a> </li>
        <li><a target="_blank" href="https://www.wandouip.com/t5i169104/">HashMap����Ϊʲô��2��</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/shakinghead/p/7651502.html">�������/ǳ�����������ʵ��</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/weixin_40909099/article/details/81239509">arraylist���������</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/qq_32004233/article/details/78324573">thread/runable�����߳�����</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/tjudzj/p/7053980.html">������쳣</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/128651465.html">servlet��������</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/iyyy/p/7993788.html">synchronized/Lock����</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/QQ846300233/p/6683819.html">String�������</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/EasonJim/p/7967138.html">list/set/map����</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/qq_41247433/article/details/79437973">ֵ/������������</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/xiaoming0601/p/5864106.html">���ϳ�ʼ���ȡ���������</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/qq_37932082/article/details/79455676">������ײ�ʵ��ԭ��</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/244534987.html">Java IO ��ô��⻺����</a> </li>
        <li><a target="_blank" href="http://www.cnblogs.com/smallbug/p/4413981.html">Java IO ��ô��⻺����</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/chenpt/p/9803298.html">����������</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/8023-CHD/p/11067141.html">session/cookie����</a> </li>
        <li><a target="_blank" href="https://www.jianshu.com/p/ec5a40628730">spring ioc�����ļ�װ�����</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/javaxuexi123/article/details/80804800">spring�ײ�</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/zwingblog/p/8523128.html">hadoop��Ⱥ��HDFSĬ�ϸ�������</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/shuigu/p/6911827.html">��Ϊ��ģʽ</a> </li>
    </ul>
    <ul class="jvm">
        <li><a target="_blank" href="https://cloud.tencent.com/developer/article/1124423">�����ڴ�ķ������</a> </li>
    </ul>
    <ul class="qianduan">
        <li><a target="_blank" href="https://www.cnblogs.com/kevinZhu/p/10288417.html">HTTP״̬��</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/666666CFH88888888/p/9832401.html">ajaxʵ��ԭ��</a> </li>
        <li><a target="_blank" href="https://www.jb51.net/article/154559.htm">js�������</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/hellofangfang/p/9626652.html">cookie��localStorage����</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/265099789450307365.html">get��post����</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/judyge/article/details/50225463">DOM����ڵ�</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/zhaoxiaoying/p/9031890.html">var/let/const����</a> </li>
    </ul>
    <ul class="db">
        <li><a target="_blank" href="https://blog.csdn.net/u013019431/article/details/78545749">֧�����������</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/huanongying/p/7021555.html">MySQL4��������뼶��</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/qq_33226422/article/details/82969414">���/�ö�/�����ظ���</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/paul8339/p/7737012.html">MySQL��������</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/ifollowrivers/article/details/73614549">MySQL��B+������ԭ��</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/Michaeles/article/details/86584158">ǳ̸MySQL��B+��</a> </li>
    </ul>
    <ul class="network">
        <li><a target="_blank" href="https://blog.csdn.net/SoaringLee_fighting/article/details/70473787">ping����</a> </li>
        <li><a title="HTTP��һ��ͨ��Э��" target="_blank" href="http://baijiahao.baidu.com/s?id=1597818044986889385&wfr=spider&for=pc">ǳ̸HTTPЭ��</a> </li>
        <li><a target="_blank" href="https://cloud.tencent.com/developer/article/1124672">HTTP����</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/jesse131/p/9080925.html">http/https����</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/laojiao/p/9653108.html">TCP/IPЭ��</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/chaoshenzhaoxichao/article/details/79785318">tcp/ip��udp��socket֮���ϵ</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/qq_38950316/article/details/81087809">�����������Ĵλ���</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/beiyang/p/10293642.html">url�س�������ʲô</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/chenjfblog/p/7865834.html">url�س�������ʲô</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/575685698.html">˽��ip��ַ</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/408332913.html">tcp���ն��ظ�</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/unix21/article/details/16918307">Ϊ��TIME_WAIT״̬����2MSL</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/softidea/p/5741192.html">tcp����״̬���</a> </li>
    </ul>
    <ul class="ds">
        <li><a target="_blank" href="https://blog.csdn.net/qq_34154570/article/details/82700094">������ǰ������->����</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/u013176681/article/details/41786263">��������Ƚϴ���</a> </li>
        <li><a target="_blank" href="http://www.imooc.com/wenda/detail/575460">hash��O(1)</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/1866218468514439547.html">����/����/������</a> </li>
    </ul>
    <ul class="suanfa">
        <li><a href="https://blog.csdn.net/be_gin_ner/article/details/86586743">��Ʊ����</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/bulo1025/article/details/86600707">�����ܳ�����</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/jpbirdy/article/details/42779815">������������ֵ</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/zlb666/article/details/89249519">��ͬ������ɵ���һ���������</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/keeya/p/9689927.html">������ת����</a> </li>
    </ul>
    <ul class="linux">
        <li><a target="_blank" href="https://zhidao.baidu.com/question/924435768820131619.html">linux���ں˻���΢�ں�</a> </li>
    </ul>
    <ul class="msnr">
        <li><a target="_blank" href="https://blog.csdn.net/qq_34149581/article/details/96154157">�ֽ�������������</a> </li>
        <li><a target="_blank" href="https://www.jianshu.com/p/05d44e107470">�ֽ������澭</a> </li>
        <li><a target="_blank" href="http://dy.163.com/v2/article/detail/E94Q6KEO05382XHV.html">����ֽ�����ͨ��</a> </li>
    </ul>
</div>

<div id="knowledge" class="model">
    <h1>����֪ʶ</h1>
    <h3><label class="houduan">���</label>&emsp;<label class="jvm">JVM</label>&emsp;<label class="qianduan">Webǰ��</label>&emsp;<label class="db">���ݿ�</label>&emsp;<label class="network">���������</label>&emsp;<label class="linux">Linux</label>&emsp;<label class="docccccc">д�ĵ�</label> &emsp;<label class="ques">����</label></h3>
    <ul class="houduan">
        <li><a target="_blank" href="https://blog.csdn.net/vbirdbest/article/details/80296136">Javadocʹ�����</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/zmx729618/article/details/54093075">Java����/����/ʵ��</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/linkworld/p/7819270.html">JUC</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/q151860/p/8589683.html">JUC</a> </li>
        <li><a target="_blank" href="https://www.jianshu.com/p/8a58d8335270">JMM</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/weixin_37352094/article/details/80500202">JMS</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/jmcui/p/8906803.html">JMS</a> </li>
        <li><a target="_blank" href="https://www.jianshu.com/p/de85fad05dcb">RMI</a> </li>
        <li><a target="_blank" href="https://www.jianshu.com/p/362b365e1bcc">NIO</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/guanghuichenshao/article/details/79375967">NIO/BIO/AIO</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/sxkgeek/p/9488703.html">NIO/BIO/AIO</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/lianjiangwei/article/details/50848531">J2EE�������</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/haiyunlx/article/details/83221652">J2EE����API�����</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/goxcheer/p/9299181.html">����/����/����</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/weixin_42950079/article/details/83544064">as��ӡ��־���</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/wn084/article/details/80729230">JNDI</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/shizhijie/p/8422662.html">session��������</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/1883180201393389668.html">�ֲ�ʽ</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/jiangyu1013/article/details/80417961">�ֲ�ʽ/��Ⱥ����</a> </li>
        <li><a target="_blank" href="http://www.360doc.com/content/18/0509/10/40060546_752383974.shtml">�ֲ�ʽ/��Ⱥ����</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/Java_3y/article/details/89235190">��Ϣ����</a> </li>
        <li><a target="_blank" href="https://ask.csdn.net/questions/761329">�ֲ�ʽϵͳͬ������Ч</a> </li>
        <li><a target="_blank" href="https://juejin.im/post/5c974072f265da60d428fadd">�ֲ�ʽϵͳ���ڵ�״̬ͬ��</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/skychmz/p/11498782.html">ͬ����������ֲ�ʽ��ʹ��</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/duqi_2009/article/details/94939145">volatile��ʲô</a> </li>
        <li><a target="_blank" href="https://www.jianshu.com/p/2bbf4fcc74c0">volatile������</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/lp284558195/article/details/80271853">Kafka</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/Javajishuzhai/p/11358138.html">�ֲ�ʽ��������</a> </li>
    </ul>
    <ul class="jvm">
        <li><a target="_blank" href="https://blog.csdn.net/csdnliuxin123524/article/details/81303711">JVMԭ����</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/bright60/article/details/78930752">JAVA8��JVM�ı仯���Ż�</a> </li>
    </ul>
    <ul class="qianduan">
        <li><a target="_blank" href="https://www.cnblogs.com/yangguoe/p/9128400.html">VUE��Ŀ�ļ�����</a> </li>
    </ul>
    <ul class="db">
        <li><a target="_blank" href="https://www.jianshu.com/p/84c64adc6adb">db�к��ѹ�ϵ���</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/1371019710496860339.html">mysql�Ƿ�����Զ������</a> </li>
    </ul>
    <ul class="network">
        <li><a target="_blank" href="https://baike.baidu.com/item/%E8%BF%9C%E7%A8%8B%E8%BF%87%E7%A8%8B%E8%B0%83%E7%94%A8%E5%8D%8F%E8%AE%AE/6893245?fromtitle=RPC&fromid=609861&fr=aladdin">rpc</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/leiflyy/article/details/51864801">ripЭ��javaģ��ʵ��</a> </li>
    </ul>
    <ul class="linux">
        <li><a target="_blank" href="https://zhidao.baidu.com/question/429154844.html">linux/shell��������</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/qq_24879495/article/details/78411497">linuxϵͳrwx��421����777Ȩ�����</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/myrunning/p/5177566.html">linux�°�װ����rpc����</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/873571868982546612.html">Linux make install</a> </li>
    </ul>
    <ul class="docccccc">
        <li><a target="_blank" href="https://blog.csdn.net/fanyun_01/article/details/52172308">UML��ģ���</a> </li>
    </ul>
    <ul class="ques">
        <li><a target="_blank" href="https://blog.csdn.net/czh500/article/details/80220580">cookie getmaxage��-1</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/czh500/article/details/80220605">cookie getmaxage��-1</a> </li>
    </ul>

</div>

<div id="help" class="model">
    <h1>�����ĵ�</h1>
    <h3><label class="doc">�����ĵ�</label>&emsp;<label class="jsjc">�����̳�</label>&emsp;<label class="install">���߰�װ�̳�</label>&emsp;<label class="use">��������/ʹ�ý̳�</label>&emsp;<label class="download">����</label>&emsp;<label class="ow">����</label>&emsp;<label class="acm">acm��</label></h3>
    <ul class="doc">
        <li><a target="_blank" href="https://download.csdn.net/download/pengjunlee/9959414">html�����ĵ�</a> </li>
        <li><a target="_blank" href="https://www.w3school.com.cn/cssref/index.asp">CSS�ο��ֲ�</a> </li>
        <li><a target="_blank" href="http://jquery.cuishifeng.cn/">jqAPI</a> </li>
        <li><a target="_blank" href="http://www.jq22.com/">jq�����</a> </li>
        <li><a target="_blank" href="https://element.eleme.cn/#/zh-CN/component/installation">Element UI���ʹ��</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/larryzeal/p/5799195.html">Spring Boot�ĵ�</a> </li>
        <li><a target="_blank" href="https://www.redis.net.cn/">Redis�ĵ�</a> </li>
        <li><a target="_blank" title="�����й�linuxѧϰ������������������ȫҲ������" href="https://www.runoob.com/linux/">Linuxѧϰ</a> </li>
        <li><a target="_blank" title="�����й�shellѧϰ����������" href="https://www.runoob.com/linux/linux-tutorial.html">shellѧϰ</a> </li>
        <li><a target="_blank" href="https://developer.android.google.cn/docs">Android�������ĵ�</a> </li>
    </ul>
    <ul class="jsjc">
        <li><a target="_blank" href="https://maven.apache.org/">maven����</a> </li>
        <li><a target="_blank" href="https://jquery.com/">jq����</a> </li>
        <li><a target="_blank" href="https://www.bootcss.com/">Bootstrap����</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com">����԰����</a> </li>
        <li><a target="_blank" href="https://www.runoob.com/">����̳̹���</a> </li>
        <li><a title="ѧϰǰ��" target="_blank" href="https://www.w3cschool.cn/">w3cschool����</a> </li>
        <li><a target="_blank" href="https://www.csdn.net/">CSDN����</a> </li>
        <li><a target="_blank" href="https://www.oschina.net/">��Դ�й�����</a> </li>
        <li><a title="���ѧϰ" target="_blank" href="https://www.liaoxuefeng.com/">��ѩ�����</a> </li>
        <li><a title="ѧϰhadoop" target="_blank" href="http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html">hadoop�̳�</a> </li>
        <li><a target="_blank" href="https://source.android.google.cn/setup/build/requirements">Android��Դ��Ŀ����</a> </li>
        <li><a target="_blank" href="http://androidxref.com/">AndroidԴ�����</a> </li>
        <li><a target="_blank" href="http://codesimple.cc/">Linux���ð�׿Դ�뿪��</a> </li>
    </ul>
    <ul class="install">
        <li><a target="_blank" href="https://www.cnblogs.com/fhen/p/6045840.html">centOS6.5_64��װMongoDB</a> </li>
        <li><a target="_blank" href="https://jingyan.baidu.com/article/1612d500af1c97e20e1eee25.html">Xshell��װʹ�ý̳�</a> </li>
    </ul>
    <ul class="use">
        <li><a target="_blank" href="https://www.cnblogs.com/wuyun-blog/p/5679073.html">DRUID���ӳ�ʵ������</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/fxbin123/article/details/80428216">postmanʹ�����</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/qq_39660344/article/details/83381715">SpringBoot/Cloud���Ŀ</a> </li>
    </ul>
    <ul class="download">
        <li><a target="_blank" href="https://blog.csdn.net/sinat_34677820/article/details/78328708">Android����Դ������</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/LJN951118/article/details/82875444">JSTL����</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/weixin_33739541/article/details/85582671">powerdesigner����</a> </li>
    </ul>
    <ul class="ow">
        <li><a title="������������" target="_blank" href="https://juejin.im/">������</a> </li>
        <li><a title="����������̽����IT���²۵�ƽ̨" target="_blank" href="https://www.v2ex.com/">V2EX����</a> </li>
        <li><a target="_blank" href="https://www.adobe.com/cn/#">adobe����</a> </li>
        <li><a target="_blank" href="https://www.mysql.com/">MySQL����</a> </li>
        <li><a title="��һЩ��־" target="_blank" href="https://www.logonews.cn/">��־�鱨�ֹ���</a> </li>
        <li><a title="ͼ�α༭��ƽ����ƹ���" target="_blank" href="https://www.chuangkit.com/">����������</a> </li>
        <li><a title="gif��ͼ��������" target="_blank" href="https://www.soogif.com/">SOOGIF��ͼ����</a> </li>
        <li><a title="������ͼƬ��" target="_blank" href="https://500px.me/">500px����</a> </li>
    </ul>
    <ul class="acm">
        <li><a target="_blank" href="https://www.jisuanke.com/">�����</a> </li>
        <li><a target="_blank" href="https://leetcode-cn.com/">���۹���</a> </li>
    </ul>
</div>

</body>
</html>