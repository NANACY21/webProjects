<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
    <title>jq所有知识</title>
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
            /*设置浮动之后不会向右溢出*/
            float: left;
            margin: 10px 40px 0px 0px;
        }
        /*笔面试分类*/
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

        /*技术文档分类*/
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
    <a target="_blank" href="html.jsp">html示例</a>
    <a target="_blank" title="备忘录" href="css.jsp">css示例</a>
    <a target="_blank" href="js.jsp">js基础/BOM/正则</a>
    <a target="_blank" href="DOM.html">js的DOM对象</a>
    <a href="jquery.html">jQuery基础</a>
    <a href="selector.html">jquery选择器示例</a>
    <a href="action.html">jquery事件示例</a>
    <a href="Ajax.html">jquery - Ajax示例</a>
    <a href="JSON.html">JSON</a>
</div>

<div class="index">
    <a href="form.html">表单序列化</a>
    <a href="preventdefault.html">事件的默认行为</a>
    <a title="VUE框架" target="_blank" href="vue.html">VUE</a>
    <a title="前端示例" target="_blank" href="tpp.html">试卷打印</a>
    <a href="/nancy/">servlet示例</a>
    <a href="el.jsp">EL表达式</a>
    <a href="JSTL.jsp">JSTL</a>
    <a href="Filter.jsp">过滤器Filter</a>
    <a href="JSTL.jsp">监听器listener</a>
</div>

<div class="index">
    <a href="upload.jsp">文件上传</a>
    <a href="upload.jsp">数据库连接池</a>
    <a href="upload.jsp">tomcat-数据库连接池</a>
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
    <a title="IDEA使用时遇到的问题" target="_blank" href="idea.html">IDEA</a>
    <a title="Linux入门" target="_blank" href="linux.html">Linux</a>
    <a title="所有有关Git学习，都在这里" target="_blank" href="git.html">Git</a>
</div>

<div class="index">
    <a href="#note">备忘录</a>
    <a href="#wti">笔面试</a>
    <a href="#knowledge">技术知识</a>
    <a href="#help">技术文档</a>
    <a title="用友" target="_blank" href="yonyou.html">工作日志</a>
</div>

<div id="mvc" class="model">
    <h1>mvc</h1>
    <p>
        项目遵循mvc五层规范<br/>
        数据访问层使用的是dao模式<br/>
        web层（ui）使用的是mvc模式<br/>
        mvc模型和分层不冲突<br/>
        mvc在ui层<br/>
    </p>
    <hr/>
    客户->view->controller->model->controller->view<br/>
    <hr/>
    还有直接请求controller的<br/>

    <p>项目越来越大，最高宗旨就是解耦合。</p>
    <p>用户越来越多，最高宗旨就是高并发。</p>
    <p>数据越来越多，最高宗旨就是大数据。</p>
    <p>需求越来越复杂，最高宗旨就是AI。</p>
    <p>因此，分布式服务器很重要。</p>
</div>

<div id="maven" class="model">
    <h1>maven</h1>

    <p>
        maven是跨平台项目管理工具，可以理解为一个jar仓库，分为本地仓库和远程仓库。<br/>
        maven可以管理项目生命周期，<strong>管理依赖关系，管理jar包。</strong>
    </p>
    <hr/>
    <p>
        IDEA自带maven插件，我们用自己下载的maven，在自己的maven中关键文件或目录及其位置：
    <ul>
        <li style="color: red">settings.xml，要在该配置文件中设置repository目录的路径（对于repository目录，仅需如此），IDEA会自动找repository目录</li>
        <li style="color: blue;">repository目录&emsp;<a style="color: blue" href="https://zhidao.baidu.com/question/621815348718681892.html">备注</a> </li>
    </ul>
    使IDEA有maven功能（下插件），然后在其中设置自己下载的maven，不选IDEA内置的maven<br/>
    <ul>
        <li><a target="_blank" href="https://www.jb51.net/article/129456.htm">IDEA配置参考1</a></li>
        <li><a target="_blank" href="https://www.cnblogs.com/zhangchengzi/p/9865100.html">IDEA配置参考2</a></li>
        <li><a target="_blank" href="https://jingyan.baidu.com/article/7f766dafe93d214101e1d039.html">IDEA配置参考3</a></li>
    </ul>
    至此IDEA集成mavenOK。用maven可以创建web项目、Java项目。
    </p>
    <hr/>
    <p>
    <ul>
        <li><a href="https://www.cnblogs.com/weibanggang/p/9652570.html" target="_blank">IDEA创建maven项目</a><br/>
            这种创建方式会创建一个module模板，即不是单纯的空的父maven项目。<br/>
            <hr/>
            <span style="color: green">另外，关于创建maven项目，我们可以(1)创建空的父maven项目，之后再新建模块；(2)创建多模块的maven项目；(3)创建一个带模块模板的maven项目。当然，我们可以随时添加模块，模块也是项目。</span><br/>
            <a target="_blank" href="https://blog.csdn.net/sinat_30160727/article/details/78109769">创建多模块的maven项目</a><br/>
            <a href="https://blog.csdn.net/T2080305/article/details/80545880">创建多模块的maven项目（辅助）</a><br/>
        </li>
        <li><a href="https://jingyan.baidu.com/article/0964eca2ac437e8285f536c3.html" target="_blank">IDEA创建maven项目（辅助）</a></li>
        <li><a href="https://www.jianshu.com/p/99dfec9be081" target="_blank">辅助内容</a> </li>
        <li></li>
        <li><a href="https://blog.csdn.net/hwy_java/article/details/85005649">mavenWeb项目完整目录结构</a> </li>
        <li><a href="https://blog.csdn.net/qq_31496897/article/details/77186576">解决<strong>web版本是2.3</strong></a> </li>
        <li><strong>没有src/main/java目录（目录结构和eclipse不一样）：</strong>我觉得手动新建就可以了。</li>
    </ul>
    <a title="在这里找你需要的jar包依赖" style="color: blue" href="https://mvnrepository.com/">maven坐标网址</a><br/>
    在该网站上找到你需要的jar包之后，配置pom.xml，会存到你本地的maven仓库，下次再用相同的jar包文件就不需要上网了。
    </p>
    <hr/>
    <p>
        maven私服
    </p>
</div>

<div id="Spring" class="model">

    <%--标题标签自带p标签--%>
    <h1>Spring</h1>
    <h1><a href="https://spring.io/" target="_blank">spring官网</a></h1>


    <h3>spring概述</h3>
    <p>
        spring框架致力于J2EE各层的解决方案。<br/>
        Java创建对象的方式：new、从工厂取一个对象（工厂模式的应用）、反射（按需分配）。 spring就是按需分配，当你需要的时候再给你，spring有一个bean容器。<br/>
    </p>


    <h3>spring两大特性IOC、AOP之IOC（见son模块）</h3>
    <p>
        <label>IOC（控制反转）</label>，IOC是面向对象编程中的一种设计原则，即不手动创建对象，交给spring来管理整个对象的生命周期。最常见的方式是DI（依赖注入），这是spring框架的核心。<br/>
        springIOC的特性解决了对象创建的问题、依赖关系维护的问题。<br/>
        ioc，Spring的这个bean工厂容器主要是利用反射技术按需分配缓存对象，管理对象，描述依赖，依赖注入。Spring的bean工厂容器的作用就是缓存对象<br/>
        <strong>依赖关系对象的赋值交给spring容器来完成</strong><br/>
        定义一个bean，只用一种配置方式以注入容器 -> xml配置或注解，自己写的class一般使用注解。而注入第三方对象写xml的bean。<br/>
    </p>


    <h3>spring两大特性IOC、AOP之AOP（见son2模块）</h3>
    <p>
        <label>AOP（面向切面编程）</label>，AOP基于IOC，AOP是对OOP的补充，但和OOP不冲突，这使代码内聚性更高。<br/>
        AOP可以使软件各层耦合度降低，AOP有特定应用场景，面向切面就是软件的分层<br/>
        一个功能，方法执行顺序，即层次，<br/>
        <strong>所以，什么是AOP？面向切面编程，软件层次，ui->db（这需要调用很多方法，有调用顺序），db->ui，这有很多层，这就是面向切面，</strong><br/>
        过滤器，就是面向切面编程思想。<br/>
        <label>把非功能性代码（如登录过滤）提取出来...，插入功能代码执行前或后，每个页面都写相同的code ，每个页面都要登录才能访问，故提取，这就是AOP。</label><br/>

        设想：IOC是缓存bean，AOP是缓存非功能性方法。都是反射。<br/>
        <label><strong>AOP底层机制：动态代理，就是为目标类（目标功能）加上前/后置代码。就是定制了目标类。</strong></label>
    </p>


    <h3>spring对dao的支持（见son2模块）</h3>
    <p>
        springJDBC，<br/>
        创建备份数据表，加一字段：删除时间，动态代理删除日志[后通知]<br/>
        spring事务处理，有操作日志，有问题可以重执行日志，<label>这是spring对事务管理的支持。</label> <br/>
        spring：事务传播的管理<br/>
    </p>

</div>

<div id="Spring MVC" class="model">
    <h1>Spring MVC</h1>
    <h3>Spring MVC概述</h3>
    <p>
        Spring MVC是spring框架的后续产品，是一个基于MVC的web框架，远超struts2。<br/>
        <label>了解：Spring MVC框架处理流程图：策略模式</label><br/>
    </p>
    <h3>Spring MVC核心功能（见son3模块）</h3>
    <p>
        爆400 -> 客户端错误<br/>
        请求映射<br/>
        方法返回值<br/>
        参数绑定：在springmvc中，data从ui到db，再反之<br/>
        转换器<br/>
        数据校验：有js校验，更安全的在控制器校验，service还可以自定义异常，dao不做这些。<br/>
        数据回显：分为离散的数据、pojo<br/>
        异常处理：统一抛给一个异常处理器，不用每个都try catch了<br/>
        拦截器：类似过滤器。可以做操作日志、未登录拦截等<br/>
        文件上传<br/>
        json数据交互<br/>
        RESTful：表述性状态传递，一种软件架构风格，前后端分离<br/>
        跨域<br/>
    </p>
    <h3>链接</h3>
    <p>
        <a target="_blank" href="https://blog.csdn.net/eson_15/article/details/51725470">数据校验</a>&emsp;
    </p>
    <h3>相关知识和问题</h3>
    <ol>
        <li>数据校验为什么读properties文件错误，编码问题？</li>
    </ol>
</div>

<div id="Mybatis" class="model">
    <h1>Mybatis</h1>
    <h1><a title="你也可以用maven" href="https://github.com/mybatis">Mybatis下载地址</a></h1>
    <h3>Mybatis概述</h3>
    <p>
        Mybatis（原名：iBatis），是一个ORM（对象关系映射）框架，是一个持久层框架，是基于java的持久层框架，MyBatis避免了几乎所有的JDBC代码和手动设置参数以及获取结果集。<br/>
        MyBatis可以使用简单的XML或注解来配置和映射原生信息，将接口和Java的POJOs（简单的Java对象、实体类）映射成数据库中的记录。<br/>
        dao&emsp;-&emsp;持久层（用来数据持久化）&emsp;-&emsp;db<br/>
        持久层和dao层融合一起来使用<br/>
        ORM框架解决的是面向对象语言和关系型数据库不匹配的问题，Mybatis能使操作数据库像使用面向对象语言一样<br/>
        hibernate是纯ORM框架；而Mybatis是半ORM框架，要手写sql的<br/>
        <label>Mybatis要做的事 -> 实体类和sql之间建立映射关系</label><br/>
    </p>
    <h3>Mybatis核心配置（见son4模块）</h3>
    <h3>mybatis开发dao层（见son4模块）</h3>
    <p>
        1.传统开发方式：mybatis对dao的支持：在daoimpl加成员变量sqlsession工厂<br/>
        2.mapper代理开发方式：mybatis对dao的支持，只需实现接口，并保证和映射文件名字一致，会生成代理实现类，<br/>
        使用mapper代理注意：namespace、映射文件insert等的id和接口方法名一致、参数类型=接口方法形参类型、返回值也要一致<br/>
    </p>
    <h3>mybatis核心功能（见son4模块）</h3>
    <p>
        mybatis逆向工程（反向代理）：运行main->db单表生成Java code，如pojo、mapper接口、映射文件，修改一下，完了再做上述的事<br/>
        <label><strong>动态sql</strong></label><br/>
        <label><strong>mybatis关联查询和，分页查询设置，延迟加载，重点！！（见son4模块）</strong></label><br/>
        mybatis查询缓存配置，空间换时间<br/>
        一级缓存：第二次查询从缓存里取，对于一次sqlsession会话，还没关时，相同sql语句/结果集，只会命中/查询一次mysql<br/>
        二级缓存：是namespace级别的，同一个接口的相同查询，会二级缓存，要适当来用<br/>
        soap，简单对象访问协议，它是webservice的基础，soa（面向服务） 异构系统之间传输data<br/>
        解析xml（现在不关键了），dom4j<br/>
        思考：如何设计spring IOC框架，必须有一个xml，仿照springbean的xml，2019-08-16-1后10分钟，用dom4j解析xml<br/>
        整合SSM（见son3模块，该模块含5层）。struts2+spring+hibernate->Java框架SSM<br/>
    </p>
    <h3>相关知识和问题</h3>
    <ol>
        <li><a target="_blank" href="https://www.cnblogs.com/zhuangfei/p/9492915.html">各种数据的映射类型</a></li>
        <li><a target="_blank" href="https://blog.csdn.net/weixin_42215286/article/details/86765076">逆向工程无效</a>&emsp;</li>
        <li>
            运行时找不到对应映射xml文件：<br/>
            映射文件namespace为mapper接口，<br/>
            xml文件要放在resources里，SSM整合时sqlSessionFactory bean的属性要说明映射文件的位置
        </li>
    </ol>
</div>

<div id="Spring Boot" class="model">
    <h1>Spring Boot</h1>
    <h3>Spring Boot概述</h3>
    <p>
        Spring Boot是Spring MVC的升级版，就一个配置文件，一站式服务，代替SSM，<br/>


    </p>
    <h3>知识点</h3>
    <ul>
        <li>！！！以下见demo项目！！！</li>
        <li>整合servlet的2种方式</li>
        <li>静态资源的访问</li>
        <li>整合jsp（非重点）</li>
        <li>！！！以下见heal项目！！！</li>
        <li>整合Thymeleaf</li>
        <li>Spring Boot类似整合SSM</li>

        <li>表单验证</li>
        <li>异常处理</li>
        <li>整合junit</li>
        <li>热部署</li>
    </ul>
    <h3>相关知识和问题</h3>
    <p>
        <a target="_blank" href="https://blog.csdn.net/qq_40550973/article/details/85109572">版本匹配问题</a>&emsp;
        <a target="_blank" href="https://www.jianshu.com/p/a98049ae3869">SpringBoot表单校验</a>&emsp;
    </p>
</div>

<div id="Spring Data JPA" class="model">
    <h1>Spring Data JPA</h1>
    <h3>Spring Data JPA概述</h3>
    <p>
        spring可以整合很多框架，如mybatis、hibernate、jpa（Java持久化应用），<br/>
        jpa是一套规范，必须有产品：hibernate jpa、springdata jpa<br/>
        springdata jpa是spring data项目下的模块，底层是hibernate jpa<br/>


    </p>
    <h3>知识点（见son5）（spring data中jpa这一部分）</h3>
    <p>
        spring、spring data jpa整合；spring data jpa基本数据操作方式<br/>
        hibernate要求表必须有主键<br/>
        spring data查询分页、排序相关<br/>
        表关联关系配置（pojo中），这不需要两张表联立了；延迟加载属性；一对多关系；<br/>
        <br/>
    </p>
    <h3>相关知识和问题</h3>
    <p>
        <a target="_blank" href="https://www.cnblogs.com/KAZMA/articles/5329732.html">指定session的延迟关闭</a>&emsp;
    </p>
</div>

<div id="Spring Cloud" class="model">
    <h1>Spring Cloud</h1>
    <p>
        过去，一个网站只在一个服务器上，这是传统架构，<br/>
        把一个项目拆成子项目，这些子项目之间要通信的，这是分布式架构<br/>
        SOA架构：面向服务架构，把共同的业务逻辑抽取出来形成一个服务，提供给其它服务接口进行调用，服务与服务之间调用使用rpc远程技术<br/>
        rpc远程：以xml方式通讯，传递的数据封装在xml里，<br/>

        微服务架构，是SOA架构演变而来，<br/>
        服务之间不影响，服务独立部署<br/>
        微服务架构特征：http协议传输数据，而不是rpc；restful风格API形式来进行通讯；json格式数据传输，而不是xml数据格式，数据采用二进制；<br/>
        微服务把每一个职责单一功能存放在独立的服务中，即独立的部署，<br/>
        每个服务运行在单独的进程中<br/>
        每个服务有自己独立数据库存储、实际上有自己独立的缓存、db、消息队列等资源<br/>
        <strong>一个项目，按功能分成子项目，这些子项目可以在相同服务器上，也可以在不同服务器上，子项目之间通信。</strong><br/>

    </p>
    <h3>Spring Cloud概述</h3>
    <p>
        Spring Cloud是基于Spring Boot基础之上开发的微服务框架，Spring Cloud提供了一套完整的微服务解决方案，内容包含服务治理、注册中心、配置管理、断路器、智能路由、微代理、控制总线、全局锁、分布式会话等，微服务所有东西都包含了<br/>
        一般集合着阿里巴巴出品的Dubbo分布式服务框架，就全ok了，<br/>
        Spring Cloud包含众多的子项目：<br/>

    </p>
    <ul>
        <li>Spring Cloud config：分布式配置中心</li>
        <li>Spring Cloud netflix：核心组件
            <ul>
                <li>Eureka：服务治理 注册中心</li>
                <li>Hystrix：服务保护框架</li>
                <li>Ribbon：客户负载均衡器</li>
                <li>Feign：基于ribbon和hystrix的声明式服务调用组件</li>
                <li>Zuul：网关组件，提供智能路由、访问过滤等功能</li>
            </ul>
        </li>


    </ul>

    <h3>服务治理 Spring Cloud Eureka（闭源）：</h3>
    <p>
        什么是服务治理？<br/>
        在传统rpc远程调用中，服务与服务依赖关系，管理比较复杂，所以需要使用服务治理，管理服务与服务之间依赖关系，<br/>
        可以实现服务调用、负载均衡、容错等，<br/>
        实现服务发现与注册<br/>
    </p>
    <h3>服务的发现与注册</h3>
    <p>
        在服务注册与发现中，有一个服务注册中心，当服务器启动的时候，会把当前自己服务器的信息 比如 服务地址通讯地址等以别名方式注册<br/>
        到服务注册中心上，这样服务注册中心就能找到这个服务了。<br/>
        另一方（服务消费者[即使用某个服务的，使用接口的]或服务提供者[即被使用这个服务，对外提供/暴露接口]），以该别名的方式去服务注册中心上获取到实际的服务通讯地址，<br/>
        让后者实现本地rpc调用远程<br/>
    </p>
    <h3>搭建服务注册中心（见son6[Spring Cloud Eureka Server]，maven项目）</h3>
    <p>

    </p>
    <h3>微服务架构son6-son8</h3>
    <p>
        注册中心，服务提供者，服务消费者<br/>
        缺点，注册中心挂了，则其子节点服务提供者，服务消费者都不能用了，所以给注册中心做高可用，替换注册中心<br/>
        而Spring Cloud采用节点间相互注册，即都可以作为注册中心，都可以作为服务节点，一个挂了，用另一个，方式：注册中心的register-with-eureka: false改成true<br/>
    </p>

</div>

<div id="note" class="model">
    <h1>备忘录</h1>
    <ol>
        <li>8.17hadoop没看</li>
        <li>数据结构</li>
        <li>毕业项目</li>
    </ol>
    <h2>bug</h2>
    <ol>
        <li>web项目出错，排查过滤器、是否有网</li>
    </ol>
</div>

<div id="wti" class="model">
    <h1 title="笔试/面试记录">笔面试</h1>
    <h3><label class="houduan">后端</label>&emsp;<label class="jvm">JVM</label>&emsp;<label class="qianduan">Web前端</label>&emsp;<label class="db">数据库</label>&emsp;<label class="network">计算机网络</label>&emsp;<label class="ds">数据结构</label>&emsp;<label class="suanfa">算法</label>&emsp;<label class="linux">Linux</label>&emsp;<label class="msnr">面试内容</label> </h3>
    <ul class="houduan">
        <li><a target="_blank" href="https://blog.csdn.net/qq_33275597/article/details/79692056">HashMap怎么变成线程安全</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/aspirant/p/11450839.html">HashMap线程不安全的后果</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/gududedabai/article/details/85784161">为什么HashMap扩容是2的幂次</a> </li>
        <li><a target="_blank" href="https://www.wandouip.com/t5i169104/">HashMap扩容为什么是2倍</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/shakinghead/p/7651502.html">对象深拷贝/浅拷贝区别，如何实现</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/weixin_40909099/article/details/81239509">arraylist对象的扩充</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/qq_32004233/article/details/78324573">thread/runable创建线程区别</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/tjudzj/p/7053980.html">检查型异常</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/128651465.html">servlet生命周期</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/iyyy/p/7993788.html">synchronized/Lock区别</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/QQ846300233/p/6683819.html">String倒序输出</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/EasonJim/p/7967138.html">list/set/map区别</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/qq_41247433/article/details/79437973">值/引用类型区别</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/xiaoming0601/p/5864106.html">集合初始长度、扩容问题</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/qq_37932082/article/details/79455676">集合类底层实现原理</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/244534987.html">Java IO 怎么理解缓冲区</a> </li>
        <li><a target="_blank" href="http://www.cnblogs.com/smallbug/p/4413981.html">Java IO 怎么理解缓冲区</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/chenpt/p/9803298.html">垃圾回收器</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/8023-CHD/p/11067141.html">session/cookie区别</a> </li>
        <li><a target="_blank" href="https://www.jianshu.com/p/ec5a40628730">spring ioc配置文件装配过程</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/javaxuexi123/article/details/80804800">spring底层</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/zwingblog/p/8523128.html">hadoop集群中HDFS默认副本块数</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/shuigu/p/6911827.html">行为型模式</a> </li>
    </ul>
    <ul class="jvm">
        <li><a target="_blank" href="https://cloud.tencent.com/developer/article/1124423">对象内存的分配策略</a> </li>
    </ul>
    <ul class="qianduan">
        <li><a target="_blank" href="https://www.cnblogs.com/kevinZhu/p/10288417.html">HTTP状态码</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/666666CFH88888888/p/9832401.html">ajax实现原理</a> </li>
        <li><a target="_blank" href="https://www.jb51.net/article/154559.htm">js数组求和</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/hellofangfang/p/9626652.html">cookie、localStorage区别</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/265099789450307365.html">get、post区别</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/judyge/article/details/50225463">DOM三大节点</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/zhaoxiaoying/p/9031890.html">var/let/const区别</a> </li>
    </ul>
    <ul class="db">
        <li><a target="_blank" href="https://blog.csdn.net/u013019431/article/details/78545749">支持事务的引擎</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/huanongying/p/7021555.html">MySQL4种事务隔离级别</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/qq_33226422/article/details/82969414">脏读/幻读/不可重复读</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/paul8339/p/7737012.html">MySQL并发控制</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/ifollowrivers/article/details/73614549">MySQL中B+树索引原理</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/Michaeles/article/details/86584158">浅谈MySQL中B+树</a> </li>
    </ul>
    <ul class="network">
        <li><a target="_blank" href="https://blog.csdn.net/SoaringLee_fighting/article/details/70473787">ping命令</a> </li>
        <li><a title="HTTP是一个通信协议" target="_blank" href="http://baijiahao.baidu.com/s?id=1597818044986889385&wfr=spider&for=pc">浅谈HTTP协议</a> </li>
        <li><a target="_blank" href="https://cloud.tencent.com/developer/article/1124672">HTTP方法</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/jesse131/p/9080925.html">http/https区别</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/laojiao/p/9653108.html">TCP/IP协议</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/chaoshenzhaoxichao/article/details/79785318">tcp/ip、udp、socket之间关系</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/qq_38950316/article/details/81087809">三次握手与四次挥手</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/beiyang/p/10293642.html">url回车发生了什么</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/chenjfblog/p/7865834.html">url回车发生了什么</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/575685698.html">私有ip地址</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/408332913.html">tcp接收端重复</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/unix21/article/details/16918307">为何TIME_WAIT状态保持2MSL</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/softidea/p/5741192.html">tcp连接状态详解</a> </li>
    </ul>
    <ul class="ds">
        <li><a target="_blank" href="https://blog.csdn.net/qq_34154570/article/details/82700094">二叉树前序中序->后序</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/u013176681/article/details/41786263">各种排序比较次数</a> </li>
        <li><a target="_blank" href="http://www.imooc.com/wenda/detail/575460">hash表O(1)</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/1866218468514439547.html">数组/链表/二叉树</a> </li>
    </ul>
    <ul class="suanfa">
        <li><a href="https://blog.csdn.net/be_gin_ner/article/details/86586743">股票交易</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/bulo1025/article/details/86600707">岛屿周长问题</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/jpbirdy/article/details/42779815">相邻数差的最大值</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/zlb666/article/details/89249519">相同数字组成的下一个更大的数</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/keeya/p/9689927.html">搜索旋转排序</a> </li>
    </ul>
    <ul class="linux">
        <li><a target="_blank" href="https://zhidao.baidu.com/question/924435768820131619.html">linux单内核还是微内核</a> </li>
    </ul>
    <ul class="msnr">
        <li><a target="_blank" href="https://blog.csdn.net/qq_34149581/article/details/96154157">字节跳动面试内容</a> </li>
        <li><a target="_blank" href="https://www.jianshu.com/p/05d44e107470">字节跳动面经</a> </li>
        <li><a target="_blank" href="http://dy.163.com/v2/article/detail/E94Q6KEO05382XHV.html">如何字节跳动通过</a> </li>
    </ul>
</div>

<div id="knowledge" class="model">
    <h1>技术知识</h1>
    <h3><label class="houduan">后端</label>&emsp;<label class="jvm">JVM</label>&emsp;<label class="qianduan">Web前端</label>&emsp;<label class="db">数据库</label>&emsp;<label class="network">计算机网络</label>&emsp;<label class="linux">Linux</label>&emsp;<label class="docccccc">写文档</label> &emsp;<label class="ques">问题</label></h3>
    <ul class="houduan">
        <li><a target="_blank" href="https://blog.csdn.net/vbirdbest/article/details/80296136">Javadoc使用详解</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/zmx729618/article/details/54093075">Java对象/引用/实例</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/linkworld/p/7819270.html">JUC</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/q151860/p/8589683.html">JUC</a> </li>
        <li><a target="_blank" href="https://www.jianshu.com/p/8a58d8335270">JMM</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/weixin_37352094/article/details/80500202">JMS</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/jmcui/p/8906803.html">JMS</a> </li>
        <li><a target="_blank" href="https://www.jianshu.com/p/de85fad05dcb">RMI</a> </li>
        <li><a target="_blank" href="https://www.jianshu.com/p/362b365e1bcc">NIO</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/guanghuichenshao/article/details/79375967">NIO/BIO/AIO</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/sxkgeek/p/9488703.html">NIO/BIO/AIO</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/lianjiangwei/article/details/50848531">J2EE基本组件</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/haiyunlx/article/details/83221652">J2EE核心API与组件</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/goxcheer/p/9299181.html">串行/并行/并发</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/weixin_42950079/article/details/83544064">as打印日志语句</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/wn084/article/details/80729230">JNDI</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/shizhijie/p/8422662.html">session生命周期</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/1883180201393389668.html">分布式</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/jiangyu1013/article/details/80417961">分布式/集群区别</a> </li>
        <li><a target="_blank" href="http://www.360doc.com/content/18/0509/10/40060546_752383974.shtml">分布式/集群区别</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/Java_3y/article/details/89235190">消息队列</a> </li>
        <li><a target="_blank" href="https://ask.csdn.net/questions/761329">分布式系统同步锁无效</a> </li>
        <li><a target="_blank" href="https://juejin.im/post/5c974072f265da60d428fadd">分布式系统各节点状态同步</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/skychmz/p/11498782.html">同步锁不足与分布式锁使用</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/duqi_2009/article/details/94939145">volatile是什么</a> </li>
        <li><a target="_blank" href="https://www.jianshu.com/p/2bbf4fcc74c0">volatile的作用</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/lp284558195/article/details/80271853">Kafka</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/Javajishuzhai/p/11358138.html">分布式服务限流</a> </li>
    </ul>
    <ul class="jvm">
        <li><a target="_blank" href="https://blog.csdn.net/csdnliuxin123524/article/details/81303711">JVM原理讲解</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/bright60/article/details/78930752">JAVA8中JVM的变化和优化</a> </li>
    </ul>
    <ul class="qianduan">
        <li><a target="_blank" href="https://www.cnblogs.com/yangguoe/p/9128400.html">VUE项目文件调用</a> </li>
    </ul>
    <ul class="db">
        <li><a target="_blank" href="https://www.jianshu.com/p/84c64adc6adb">db中好友关系设计</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/1371019710496860339.html">mysql是否允许远程连接</a> </li>
    </ul>
    <ul class="network">
        <li><a target="_blank" href="https://baike.baidu.com/item/%E8%BF%9C%E7%A8%8B%E8%BF%87%E7%A8%8B%E8%B0%83%E7%94%A8%E5%8D%8F%E8%AE%AE/6893245?fromtitle=RPC&fromid=609861&fr=aladdin">rpc</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/leiflyy/article/details/51864801">rip协议java模拟实现</a> </li>
    </ul>
    <ul class="linux">
        <li><a target="_blank" href="https://zhidao.baidu.com/question/429154844.html">linux/shell命令区别</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/qq_24879495/article/details/78411497">linux系统rwx（421）、777权限详解</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/myrunning/p/5177566.html">linux下安装启动rpc服务</a> </li>
        <li><a target="_blank" href="https://zhidao.baidu.com/question/873571868982546612.html">Linux make install</a> </li>
    </ul>
    <ul class="docccccc">
        <li><a target="_blank" href="https://blog.csdn.net/fanyun_01/article/details/52172308">UML建模详解</a> </li>
    </ul>
    <ul class="ques">
        <li><a target="_blank" href="https://blog.csdn.net/czh500/article/details/80220580">cookie getmaxage是-1</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/czh500/article/details/80220605">cookie getmaxage是-1</a> </li>
    </ul>

</div>

<div id="help" class="model">
    <h1>技术文档</h1>
    <h3><label class="doc">技术文档</label>&emsp;<label class="jsjc">技术教程</label>&emsp;<label class="install">工具安装教程</label>&emsp;<label class="use">工具配置/使用教程</label>&emsp;<label class="download">下载</label>&emsp;<label class="ow">官网</label>&emsp;<label class="acm">acm题</label></h3>
    <ul class="doc">
        <li><a target="_blank" href="https://download.csdn.net/download/pengjunlee/9959414">html帮助文档</a> </li>
        <li><a target="_blank" href="https://www.w3school.com.cn/cssref/index.asp">CSS参考手册</a> </li>
        <li><a target="_blank" href="http://jquery.cuishifeng.cn/">jqAPI</a> </li>
        <li><a target="_blank" href="http://www.jq22.com/">jq插件库</a> </li>
        <li><a target="_blank" href="https://element.eleme.cn/#/zh-CN/component/installation">Element UI框架使用</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/larryzeal/p/5799195.html">Spring Boot文档</a> </li>
        <li><a target="_blank" href="https://www.redis.net.cn/">Redis文档</a> </li>
        <li><a target="_blank" title="所有有关linux学习，都在这里，还有命令大全也在这里" href="https://www.runoob.com/linux/">Linux学习</a> </li>
        <li><a target="_blank" title="所有有关shell学习，都在这里" href="https://www.runoob.com/linux/linux-tutorial.html">shell学习</a> </li>
        <li><a target="_blank" href="https://developer.android.google.cn/docs">Android开发者文档</a> </li>
    </ul>
    <ul class="jsjc">
        <li><a target="_blank" href="https://maven.apache.org/">maven官网</a> </li>
        <li><a target="_blank" href="https://jquery.com/">jq官网</a> </li>
        <li><a target="_blank" href="https://www.bootcss.com/">Bootstrap官网</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com">博客园官网</a> </li>
        <li><a target="_blank" href="https://www.runoob.com/">菜鸟教程官网</a> </li>
        <li><a title="学习前端" target="_blank" href="https://www.w3cschool.cn/">w3cschool官网</a> </li>
        <li><a target="_blank" href="https://www.csdn.net/">CSDN官网</a> </li>
        <li><a target="_blank" href="https://www.oschina.net/">开源中国官网</a> </li>
        <li><a title="编程学习" target="_blank" href="https://www.liaoxuefeng.com/">廖雪峰官网</a> </li>
        <li><a title="学习hadoop" target="_blank" href="http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html">hadoop教程</a> </li>
        <li><a target="_blank" href="https://source.android.google.cn/setup/build/requirements">Android开源项目官网</a> </li>
        <li><a target="_blank" href="http://androidxref.com/">Android源码解析</a> </li>
        <li><a target="_blank" href="http://codesimple.cc/">Linux配置安卓源码开发</a> </li>
    </ul>
    <ul class="install">
        <li><a target="_blank" href="https://www.cnblogs.com/fhen/p/6045840.html">centOS6.5_64安装MongoDB</a> </li>
        <li><a target="_blank" href="https://jingyan.baidu.com/article/1612d500af1c97e20e1eee25.html">Xshell安装使用教程</a> </li>
    </ul>
    <ul class="use">
        <li><a target="_blank" href="https://www.cnblogs.com/wuyun-blog/p/5679073.html">DRUID连接池实用配置</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/fxbin123/article/details/80428216">postman使用详解</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/qq_39660344/article/details/83381715">SpringBoot/Cloud搭建项目</a> </li>
    </ul>
    <ul class="download">
        <li><a target="_blank" href="https://blog.csdn.net/sinat_34677820/article/details/78328708">Android国内源码下载</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/LJN951118/article/details/82875444">JSTL下载</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/weixin_33739541/article/details/85582671">powerdesigner下载</a> </li>
    </ul>
    <ul class="ow">
        <li><a title="技术交流社区" target="_blank" href="https://juejin.im/">掘金官网</a> </li>
        <li><a title="技术交流和探索、IT人吐槽的平台" target="_blank" href="https://www.v2ex.com/">V2EX官网</a> </li>
        <li><a target="_blank" href="https://www.adobe.com/cn/#">adobe官网</a> </li>
        <li><a target="_blank" href="https://www.mysql.com/">MySQL官网</a> </li>
        <li><a title="找一些标志" target="_blank" href="https://www.logonews.cn/">标志情报局官网</a> </li>
        <li><a title="图形编辑和平面设计工具" target="_blank" href="https://www.chuangkit.com/">创客贴官网</a> </li>
        <li><a title="gif动图搜索引擎" target="_blank" href="https://www.soogif.com/">SOOGIF动图官网</a> </li>
        <li><a title="高质量图片库" target="_blank" href="https://500px.me/">500px官网</a> </li>
    </ul>
    <ul class="acm">
        <li><a target="_blank" href="https://www.jisuanke.com/">计蒜客</a> </li>
        <li><a target="_blank" href="https://leetcode-cn.com/">力扣官网</a> </li>
    </ul>
</div>

</body>
</html>