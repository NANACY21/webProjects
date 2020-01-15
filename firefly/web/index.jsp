<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
<%--    这是一个提醒事项框架--%>
    <title>提醒事项</title>
    <script src="js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="css/friendList.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>

<div class="index">
    <a target="_blank" href="css.jsp">css示例</a>
    <a target="_blank" href="js.jsp">js基础/BOM/正则</a>
    <a target="_blank" href="DOM.html">js的DOM对象</a>
    <a target="_blank" href="jquery.html">jQuery基础</a>
    <a target="_blank" href="selector.html">jquery选择器示例</a>
    <a target="_blank" href="action.html">jquery事件示例</a>
    <a target="_blank" href="load.html">jquery - Ajax所有知识</a>
    <a target="_blank" href="JSON.html">JSON</a>
    <a target="_blank" href="form.html">表单序列化</a>
</div>

<div class="index">
    <a target="_blank" href="preventdefault.html" title="至此jq所有知识ok">事件的默认行为</a>
    <a target="_blank" title="前端示例" href="tpp.html">试卷打印</a>
    <a target="_blank" href="/nancy/">Servlet示例</a>
    <a target="_blank" href="el.jsp">EL表达式</a>
    <a target="_blank" href="JSTL.jsp">JSTL</a>
    <a target="_blank" href="upload.jsp">文件上传</a>
</div>

<div class="index">
</div>

<div class="index">
</div>

<div class="index">
    <a href="#note">备忘录</a>
    <a href="#wti">笔面试</a>
    <a title="缓冲记录区" href="#knowledge">技术知识</a>
    <a href="#help">技术文档</a>
</div>

<div id="note" class="model">
</div>

<div id="wti" class="model">
    <h1 title="笔试/面试记录">笔面试</h1>
    <h3>
        <label class="houduan">后端</label>&emsp;
        <label class="jvm">JVM</label>&emsp;
        <label class="qianduan">Web前端</label>&emsp;
        <label class="db">数据库</label>&emsp;
        <label class="network">计算机网络</label>&emsp;
        <label class="ds">数据结构</label>&emsp;
        <label class="suanfa">算法</label>&emsp;
        <label class="linux">Linux</label>&emsp;
        <label class="msnr">面试内容</label>
    </h3>
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

<div title="缓冲记录区" id="knowledge" class="model">
    <h1>技术知识</h1>
    <h3>
        <label class="houduan">后端</label>&emsp;
        <label class="jvm">JVM</label>&emsp;
        <label class="qianduan">Web前端</label>&emsp;
        <label class="db">数据库</label>&emsp;
        <label class="network">计算机网络</label>&emsp;
        <label class="linux">Linux</label>&emsp;
        <label class="docccccc">写文档</label> &emsp;
        <label class="ques">问题</label>&emsp;
        <label class="kaifa">开发</label>
    </h3>
    <ul class="houduan">
    </ul>
    <ul class="jvm">
    </ul>
    <ul class="db">
    </ul>
    <ul class="network">
    </ul>
    <ul class="linux">
    </ul>
    <ul class="docccccc">
    </ul>
    <ul class="ques">
    </ul>
</div>

<div id="help" class="model">
    <h1>技术文档</h1>
    <h3>
        <label class="doc">技术文档</label>&emsp;
        <label class="jsjc">技术教程</label>&emsp;
        <label class="use">工具配置/使用教程</label>&emsp;
        <label class="download">下载</label>&emsp;
        <label class="ow">官网</label>&emsp;
        <label class="acm">acm题</label>
    </h3>
    <ul class="doc">
    </ul>
    <ul class="jsjc">
    </ul>
    <ul class="use">
    </ul>
    <ul class="download">
    </ul>
    <ul class="ow">
    </ul>
    <ul class="acm">
    </ul>
</div>

</body>
</html>