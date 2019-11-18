<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
    <title>css示例</title>
    <link rel="stylesheet" href="css/css.css">
    <style>
        .parent{
            /*绝对定位是相对父元素的，不占位*/
            /*position: absolute;*/
            width: 100px;
            height: 100px;
            background-color: #4C84FF;
            border: 1px solid darkblue;
            /*z-index: 2;*/
        }
        .son1{
            /*position: absolute;*/
            width: 50px;
            height: 50px;
            background-color: #55db78;
            /*z-index: 1;*/
        }
        .son2{
            /*position: absolute;*/
            width: 50px;
            height: 50px;
            background-color: #fff542;
            /*z-index: 1;*/
        }

        .f1{
            width: 100px;
            height: 50px;
            background-color: red;
        }
        .f2{
            width: 150px;
            height: 75px;
            background-color: orange;
            float: left;

        }
        .f3{
            width: 200px;
            height: 100px;
            background-color: yellow;
            /*float: left;*/
        }

        .big{
            width: 700px;
            height: 900px;
            background-color: red;
        }
        .small1{
            width: 200px;
            height: 200px;
            background-color: green;
            float: left;
        }
        .small2{
            width: 200px;
            height: 200px;
            background-color: blue;
            float: left;
        }
        .small3{
            width: 200px;
            height: 200px;
            background-color: yellow;
            float: left;
        }
        .small4{
            width: 200px;
            height: 200px;
            background-color: yellowgreen;
            float: left;
        }
    </style>
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
    <div id="note">
        <h3 title="所有备忘录，都在这里" align="center">备忘录</h3>
        <div class="module">
            <h4 align="center">日用品</h4>
            <ul>
                <li>洗发露</li>
                <li>洗面奶</li>
                <li>洗脸盆</li>
                <li>洗脚盆</li>
                <li>一提水</li>
                <li>牙刷</li>
                <li>牙膏</li>
                <li>牙杯</li>
                <li>香皂</li>
                <li>拖鞋</li>
                <li>浴兜</li>
                <li>暖水壶</li>
                <li>澡巾</li>
                <li>毛巾</li>
                <li>湿巾</li>
                <li>沐浴露</li>
                <li>手纸</li>
                <li>香皂盒</li>
                <li>粘钩（厕所、普通）</li>
                <li>插排</li>
                <li>洗衣液</li>
                <li>壁纸刀</li>
                <li>刮胡刀</li>
            </ul>
        </div>
        <div class="module">
            <h4 align="center">证件</h4>
            <ul>
                <li>高考准考证</li>
                <li>身份证</li>
                <li>黑大医保卡</li>
                <li>医保卡</li>
                <li>黑大中行卡</li>
                <li>交行卡</li>
                <li>建行卡</li>
                <li>驾驶证</li>
                <li>护照</li>
                <li>兵役登记证</li>
                <li>黑大一卡通</li>
                <li>公交卡</li>
                <li>钥匙</li>
                <li>眼镜</li>
                <li>U盘</li>
            </ul>
        </div>
        <div class="module">
            <h4 align="center">其它</h4>
            <ul>
                <li>一寸照片16</li>
                <li>二寸照片4</li>
                <li>护照、港澳通行证专用二寸照片5</li>
                <li>手机5</li>
                <li>手机卡5</li>
                <li>所有存储：外存设备3+百度网盘</li>
            </ul>
        </div>
        <div class="module">
            <h4 align="center">说明</h4>
            <table>
                <thead>
                    <tr>
                        <th>名称</th>
                        <th>备注</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Axure</td>
                        <td>电脑软件，画界面的</td>
                    </tr>
                    <tr>
                        <td>PowerDesigner</td>
                        <td>电脑软件，建模工具</td>
                    </tr>
                    <tr>
                        <td>Adobe Dreamweaver</td>
                        <td>电脑软件，画界面的</td>
                    </tr>
                    <tr>
                        <td>postman</td>
                        <td>一个电脑软件</td>
                    </tr>
                    <tr>
                        <td>Visual Studio 2017</td>
                        <td>一个电脑软件</td>
                    </tr>
                    <tr>
                        <td>音乐</td>
                        <td>苹果手机自带APP</td>
                    </tr>
                    <tr>
                        <td>apple视频</td>
                        <td>苹果手机自带APP</td>
                    </tr>
                    <tr>
                        <td>文件</td>
                        <td>苹果手机自带APP</td>
                    </tr>
                    <tr>
                        <td>快捷指令</td>
                        <td>苹果手机自带APP</td>
                    </tr>
                    <tr>
                        <td>网易有道词典</td>
                        <td>苹果手机APP</td>
                    </tr>
                    <tr>
                        <td>学习通</td>
                        <td>苹果手机APP</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="module">
            <h4 title="还有一些说明" align="center">秘密（登录）</h4>
            <table>
                <thead>
                <tr>
                    <th>目标</th>
                    <th>ID</th>
                    <th>密码</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>GitHub</td>
                    <td>NANACY21</td>
                    <td>Innocence2019</td>
                </tr>
                <tr>
                    <td>计蒜客</td>
                    <td>夜雨江湖</td>
                    <td>Innocence2019</td>
                </tr>
                <tr>
                    <td>JetBrains账户</td>
                    <td>lichilichi</td>
                    <td>LICHIlichi201619</td>
                </tr>
                <tr>
                    <td>博客园</td>
                    <td>yyjh</td>
                    <td>LICHIlichi201619&</td>
                </tr>
                <tr>
                    <td>英语四六级报名网登录</td>
                    <td></td>
                    <td>zxcvbnm1!</td>
                </tr>
                <tr>
                    <td>中国银行APP</td>
                    <td></td>
                    <td>lccllihih201357</td>
                </tr>
                <tr>
                    <td>交通银行APP</td>
                    <td></td>
                    <td>lccllihih201357</td>
                </tr>
                <tr>
                    <td>东软培训百度网盘交作业</td>
                    <td>18003669206</td>
                    <td>neusoft,123</td>
                </tr>
                <tr>
                    <td>东软小睿APP</td>
                    <td>liU26_ttc</td>
                    <td>980222</td>
                </tr>
                <tr>
                    <td>安装VMware秘钥</td>
                    <td></td>
                    <td>
                        FF31K-AHZD1-H8ETZ-8WWEZ-WUUVA<p/>
                        CV7T2-6WY5Q-48EWP-ZXY7X-QGUWD
                    </td>
                </tr>
                <tr>
                    <td>VMware中centos6.5开机</td>
                    <td>centos</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>centos6.5中的mysql</td>
                    <td>root</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>牛客网官网1、牛客网官网2、processon</td>
                    <td></td>
                    <td>微信注册</td>
                </tr>
                <tr>
                    <td>黑龙江大学邮箱</td>
                    <td colspan="2">20166109@s.hlju.edu.cn</td>
                </tr>
                </tbody>
            </table>
            <div>
                <p>
                    使用JetBrains账号激活idea。<br>
                    https://account.jetbrains.com/licenses
                </p>
                <p>
                    http://www.hotjob.cn/wt/yonyou/web/index?brandCode=yonyou<br/>
                    邮箱<br/>
                    7478E36B
                </p>
                <p>
                    四六级考试报名<br/>
                    http://cet-bm.neea.edu.cn/
                </p>
                <p>
                    校园信息门户<br/>
                    http://authserver.hlju.edu.cn/authserver/login?service=http%3A%2F%2Fmy.hlju.edu.cn%2Findex.portal
                </p>
                <p>
                    黑大邮箱<br/>
                    http://mail.s.hlju.edu.cn/
                </p>
            </div>
        </div>
    </div>
</body>
</html>
