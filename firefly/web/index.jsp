<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
<%--    提醒事项框架 firefly\web\index.jsp 样式在firefly模块中--%>
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
    </ul>
    <ul class="jvm">
    </ul>
    <ul class="qianduan">
    </ul>
    <ul class="db">
    </ul>
    <ul class="network">
    </ul>
    <ul class="ds">
    </ul>
    <ul class="suanfa">
    </ul>
    <ul class="linux">
    </ul>
    <ul class="msnr">
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