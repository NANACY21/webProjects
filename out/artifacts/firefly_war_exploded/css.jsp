<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
    <title>css示例</title>
    <link rel="stylesheet" href="css/css.css">
</head>
<body>
    <p>关于行高</p>
    <p>hhbbjcd<br/>cdcd</p>
    <p>
        <a href="">超链接</a>
    </p>
    <div class="parent">
        <div class="son1">

        </div>
        <div class="son2">

        </div>
    </div>

    <h3>浮动示例1</h3>
    <p>
        浮动元素不占位<br>
        元素a浮动，b不浮动，b会顶上来；<br>
        元素a浮动，b也浮动，a、b会并排<br>
    </p>
    <div class="f1">

    </div>
    <div class="f2"></div>
    <div class="f3"></div>
    <h3>浮动示例2</h3>
    <h4>都往左浮动，不会超出父级div的范围 </h4>
    <p>都向左浮动，不会超出父div的范围，会换行（也就是说，永远不会右侧溢出）</p>
    <div class="big">
        <div class="small1"></div>
        <div class="small2"></div>
        <div class="small3"></div>
        <div class="small4"></div>
    </div>
</body>
</html>
