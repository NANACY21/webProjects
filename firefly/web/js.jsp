<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
    <title>js基础/BOM/正则</title>
</head>
<body>
<script type="text/javascript">
    alert("js.jsp开始运行");

    function tetttt() {
        document.write("+");
        setTimeout(tetttt, 1000);
    }

    tetttt();

    //定义数组
    var array = [5, 6, 7, 8];
    //截取数组 index0-1
    var numbers = array.slice(0,2);
    for (var i in numbers){
        alert(numbers[i]);
    }

    //定义对象
    var i = new Object();
    //变量类型为对象
    alert(typeof (i));

    var i = 1;
    var j = true;
    //等于 恒等
    alert(i == j + "  " + i === j);

    function test(i) {
        alert("调用时传入的参数个数即实参个数：" + arguments.length);
        //函数名
        alert("形参个数：" + test.length);
    }

    test();
</script>

<h5>js基础</h5>
<ul>
    <li>复合数据类型：返回引用</li>
    <li>函数作用域</li>
    <li>js闭包，js作用域链</li>
</ul>

<h6>创建对象示例</h6>
<script>
    //创建对象示例 js不需要自己释放内存
    var student = new Object;
    student.name = "李篪";
    student.age = "21";//创建对象完毕

    // 键值对 key一定是" "括起来，对象和数组的结合嵌套
    // {} -- 一个对象 [] -- 一个数组
    var obj1 = {"name": "lichi", "age": 12};
    alert(obj1.name + "--" + obj1.age);

    //包含方法的 而json只包含数据，不包含方法
    var o2 = {
        run: function (i) {
            alert("cd" + i);
        }
    };
    o2.run(34);

    //删除对象的属性
    delete student.age;


    var box = "//中国";
    //编码
    alert(encodeURI(box));
    alert(encodeURIComponent(box));
    alert(decodeURIComponent(encodeURIComponent(box)));
    // 解码
    // alert(decodeURI(encodeURI(box)));

    //对js代码的解析
    eval('var box = 100');
    // 用string传，解析成js代码
    alert(box);
</script>

<h6>正则表达式示例，正则表达式用于验证UI的输入</h6>
<script>
    /*正则表达式讲解*/


    /*以正则对象为主体*/

    //创建正则表达式方式1 i 忽略大小写
    var reg = new RegExp('box','i');
    var string = 'this is a box!';
    alert("字符串\"string\"是否匹配：" + reg.test(string));

    //创建正则表达式方式2 定义一个模式：字符串是否包含一个忽略大小写的box
    reg = /box/i;
    alert("字符串\"string\"是否匹配：" + reg.test(string));
    //返回第一个匹配的值
    alert(reg.exec(string));


    alert("开始");
    var pattern = /(g)oogle!/;
    string = 'this is a google';
    pattern.test(string);

    alert(RegExp.input);
    // 字符串的左边
    alert(RegExp.leftContext);
    alert(RegExp.rightContext);
    alert(RegExp.lastMatch);
    alert(RegExp.lastParen);
    alert(RegExp.multiline);


    alert("String对象的正则表达式");
    /*以字符串对象为主体*/
    //全局搜索
    pattern = /box/ig;
    string = 'this is a Box!this is a box too';
    //匹配到2个box
    alert(string.match(pattern));
    // 正则.match(字符串 )
    // console.log()

    //数组长度
    alert(string.match(pattern).length);

    //返回对象（数组）
    var regExpMatchArray = string.match(pattern);

    //返回匹配到的位置（字符串的索引）
    alert(string.search(pattern));
    string.replace(pattern, 'Tom');
    alert(string);

    alert("练习");

    //含义：a-z中字母三个连续的并以其开头
    var reg = /^[a-z]{3}/ig;
    //含义：a-z中字母三个连续的并以其开头，中间0-多个字符，以一个数字结尾
    reg = /^[a-z]{3}.+\d$/ig;
    var string = "azx1";
    alert(reg.test(string)+"66666");
    // .*  无所谓
    // .+  0-多个字符
</script>
</body>
</html>
