<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
    <title>提醒事项</title>
    <script src="js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="css/friendList.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>

<div class="index">
    <a target="_blank" href="html.jsp">html示例</a>
    <a target="_blank" title="备忘录" href="css.jsp">css示例</a>
    <a target="_blank" href="js.jsp">js基础/BOM/正则</a>
    <a target="_blank" href="DOM.html">js的DOM对象</a>
    <a target="_blank" href="jquery.html">jQuery基础</a>
    <a target="_blank" href="selector.html">jquery选择器示例</a>
    <a target="_blank" href="action.html">jquery事件示例</a>
    <a target="_blank" href="Ajax.html">jquery - Ajax示例</a>
    <a target="_blank" href="JSON.html">JSON</a>
</div>

<div class="index">
    <a target="_blank" href="form.html">表单序列化</a>
    <a target="_blank" href="preventdefault.html" title="至此jq所有知识ok">事件的默认行为</a>
    <a target="_blank" title="VUE框架" href="vue.html">VUE</a>
    <a target="_blank" title="前端示例" href="tpp.html">试卷打印</a>
    <a target="_blank" href="/nancy/">servlet示例</a>
    <a target="_blank" href="el.jsp">EL表达式</a>
    <a target="_blank" href="JSTL.jsp">JSTL</a>
    <a target="_blank" href="Filter.jsp">过滤器Filter</a>
    <a target="_blank" href="JSTL.jsp">监听器listener</a>
</div>

<div class="index">
    <a target="_blank" href="upload.jsp">文件上传</a>
    <a target="_blank" href="upload.jsp">数据库连接池</a>
    <a target="_blank" href="upload.jsp">tomcat-数据库连接池</a>
</div>

<div class="index">
    <a target="_blank" title="IDEA使用时遇到的问题" href="idea.html">IDEA</a>
    <a target="_blank" title="Android Studio使用时遇到的问题" href="as.html">Android Studio</a>
    <a target="_blank" title="Linux入门" href="linux.html">Linux</a>
</div>

<div class="index">
    <a href="#note">备忘录</a>
    <a href="#wti">笔面试</a>
    <a title="缓冲记录区" href="#knowledge">技术知识</a>
    <a href="#help">技术文档</a>
    <a target="_blank" title="用友" href="yonyou.html">工作日志</a>
</div>

<div id="note" class="model">
    <h1>备忘录</h1>
    <ol>
        <li>8.17hadoop没看</li>
        <li>数据结构</li>
        <li>毕业论文项目</li>
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
        <li><a target="_blank" href="https://blog.csdn.net/vbirdbest/article/details/80296136">Javadoc使用详解</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/zmx729618/article/details/54093075">Java对象/引用/实例</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/lianjiangwei/article/details/50848531">J2EE基本组件</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/haiyunlx/article/details/83221652">J2EE核心API与组件</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/weixin_42950079/article/details/83544064">as打印日志语句</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/wn084/article/details/80729230">JNDI</a> </li>
        <li><a target="_blank" href="https://www.cnblogs.com/shizhijie/p/8422662.html">session生命周期</a> </li>
        <li><a target="_blank" href="https://www.jianshu.com/p/de85fad05dcb">RMI</a> </li>
        <li><a target="_blank" href="https://baike.baidu.com/item/%E8%BF%9C%E7%A8%8B%E8%BF%87%E7%A8%8B%E8%B0%83%E7%94%A8%E5%8D%8F%E8%AE%AE/6893245?fromtitle=RPC&fromid=609861&fr=aladdin">rpc</a> </li>
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

    <ul class="kaifa">





    </ul>

</div>

<div id="help" class="model">
    <h1>技术文档</h1>
    <h3><label class="doc">技术文档</label>&emsp;<label class="jsjc">技术教程</label>&emsp;<label class="use">工具配置/使用教程</label>&emsp;<label class="download">下载</label>&emsp;<label class="ow">官网</label>&emsp;<label class="acm">acm题</label></h3>
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
    <ul class="use">
        <li><a target="_blank" href="https://www.cnblogs.com/wuyun-blog/p/5679073.html">DRUID连接池实用配置</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/fxbin123/article/details/80428216">postman使用详解</a> </li>
        <li><a target="_blank" href="https://blog.csdn.net/qq_39660344/article/details/83381715">SpringBoot/Cloud搭建项目</a> </li>
    </ul>
    <ul class="download">
        <li><a target="_blank" href="https://blog.csdn.net/sinat_34677820/article/details/78328708">Android国内源码下载</a> </li>
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