<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
    <title>cssʾ��</title>
    <link rel="stylesheet" href="css/css.css">
    <style>
        .parent{
            /*���Զ�λ����Ը�Ԫ�صģ���ռλ*/
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
    <p>�����и�</p>
    <p>hhbbjcd<br/>cdcd</p>
    <p>
        <a href="">������</a>
    </p>
    <div class="parent">
        <div class="son1">

        </div>
        <div class="son2">

        </div>
    </div>

    <h3>����ʾ��1</h3>
    <p>
        ����Ԫ�ز�ռλ<br>
        Ԫ��a������b��������b�ᶥ������<br>
        Ԫ��a������bҲ������a��b�Ტ��<br>
    </p>
    <div class="f1">

    </div>
    <div class="f2"></div>
    <div class="f3"></div>
    <h3>����ʾ��2</h3>
    <h4>�����󸡶������ᳬ������div�ķ�Χ </h4>
    <p>�����󸡶������ᳬ����div�ķ�Χ���ỻ�У�Ҳ����˵����Զ�����Ҳ������</p>
    <div class="big">
        <div class="small1"></div>
        <div class="small2"></div>
        <div class="small3"></div>
        <div class="small4"></div>
    </div>
    <div id="note">
        <h3 title="���б���¼����������" align="center">����¼</h3>
        <div class="module">
            <h4 align="center">����Ʒ</h4>
            <ul>
                <li>ϴ��¶</li>
                <li>ϴ����</li>
                <li>ϴ����</li>
                <li>ϴ����</li>
                <li>һ��ˮ</li>
                <li>��ˢ</li>
                <li>����</li>
                <li>����</li>
                <li>����</li>
                <li>��Ь</li>
                <li>ԡ��</li>
                <li>ůˮ��</li>
                <li>���</li>
                <li>ë��</li>
                <li>ʪ��</li>
                <li>��ԡ¶</li>
                <li>��ֽ</li>
                <li>�����</li>
                <li>ճ������������ͨ��</li>
                <li>����</li>
                <li>ϴ��Һ</li>
                <li>��ֽ��</li>
                <li>�κ���</li>
            </ul>
        </div>
        <div class="module">
            <h4 align="center">֤��</h4>
            <ul>
                <li>�߿�׼��֤</li>
                <li>���֤</li>
                <li>�ڴ�ҽ����</li>
                <li>ҽ����</li>
                <li>�ڴ����п�</li>
                <li>���п�</li>
                <li>���п�</li>
                <li>��ʻ֤</li>
                <li>����</li>
                <li>���۵Ǽ�֤</li>
                <li>�ڴ�һ��ͨ</li>
                <li>������</li>
                <li>Կ��</li>
                <li>�۾�</li>
                <li>U��</li>
            </ul>
        </div>
        <div class="module">
            <h4 align="center">����</h4>
            <ul>
                <li>һ����Ƭ16</li>
                <li>������Ƭ4</li>
                <li>���ա��۰�ͨ��֤ר�ö�����Ƭ5</li>
                <li>�ֻ�5</li>
                <li>�ֻ���5</li>
                <li>���д洢������豸3+�ٶ�����</li>
            </ul>
        </div>
        <div class="module">
            <h4 align="center">˵��</h4>
            <table>
                <thead>
                    <tr>
                        <th>����</th>
                        <th>��ע</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Axure</td>
                        <td>����������������</td>
                    </tr>
                    <tr>
                        <td>PowerDesigner</td>
                        <td>�����������ģ����</td>
                    </tr>
                    <tr>
                        <td>Adobe Dreamweaver</td>
                        <td>����������������</td>
                    </tr>
                    <tr>
                        <td>postman</td>
                        <td>һ���������</td>
                    </tr>
                    <tr>
                        <td>Visual Studio 2017</td>
                        <td>һ���������</td>
                    </tr>
                    <tr>
                        <td>����</td>
                        <td>ƻ���ֻ��Դ�APP</td>
                    </tr>
                    <tr>
                        <td>apple��Ƶ</td>
                        <td>ƻ���ֻ��Դ�APP</td>
                    </tr>
                    <tr>
                        <td>�ļ�</td>
                        <td>ƻ���ֻ��Դ�APP</td>
                    </tr>
                    <tr>
                        <td>���ָ��</td>
                        <td>ƻ���ֻ��Դ�APP</td>
                    </tr>
                    <tr>
                        <td>�����е��ʵ�</td>
                        <td>ƻ���ֻ�APP</td>
                    </tr>
                    <tr>
                        <td>ѧϰͨ</td>
                        <td>ƻ���ֻ�APP</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="module">
            <h4 title="����һЩ˵��" align="center">���ܣ���¼��</h4>
            <table>
                <thead>
                <tr>
                    <th>Ŀ��</th>
                    <th>ID</th>
                    <th>����</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>GitHub</td>
                    <td>NANACY21</td>
                    <td>Innocence2019</td>
                </tr>
                <tr>
                    <td>�����</td>
                    <td>ҹ�꽭��</td>
                    <td>Innocence2019</td>
                </tr>
                <tr>
                    <td>JetBrains�˻�</td>
                    <td>lichilichi</td>
                    <td>LICHIlichi201619</td>
                </tr>
                <tr>
                    <td>����԰</td>
                    <td>yyjh</td>
                    <td>LICHIlichi201619&</td>
                </tr>
                <tr>
                    <td>Ӣ����������������¼</td>
                    <td></td>
                    <td>zxcvbnm1!</td>
                </tr>
                <tr>
                    <td>�й�����APP</td>
                    <td></td>
                    <td>lccllihih201357</td>
                </tr>
                <tr>
                    <td>��ͨ����APP</td>
                    <td></td>
                    <td>lccllihih201357</td>
                </tr>
                <tr>
                    <td>������ѵ�ٶ����̽���ҵ</td>
                    <td>18003669206</td>
                    <td>neusoft,123</td>
                </tr>
                <tr>
                    <td>����С�APP</td>
                    <td>liU26_ttc</td>
                    <td>980222</td>
                </tr>
                <tr>
                    <td>��װVMware��Կ</td>
                    <td></td>
                    <td>
                        FF31K-AHZD1-H8ETZ-8WWEZ-WUUVA<p/>
                        CV7T2-6WY5Q-48EWP-ZXY7X-QGUWD
                    </td>
                </tr>
                <tr>
                    <td>VMware��centos6.5����</td>
                    <td>centos</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>centos6.5�е�mysql</td>
                    <td>root</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>ţ��������1��ţ��������2��processon</td>
                    <td></td>
                    <td>΢��ע��</td>
                </tr>
                <tr>
                    <td>��������ѧ����</td>
                    <td colspan="2">20166109@s.hlju.edu.cn</td>
                </tr>
                </tbody>
            </table>
            <div>
                <p>
                    ʹ��JetBrains�˺ż���idea��<br>
                    https://account.jetbrains.com/licenses
                </p>
                <p>
                    http://www.hotjob.cn/wt/yonyou/web/index?brandCode=yonyou<br/>
                    ����<br/>
                    7478E36B
                </p>
                <p>
                    ���������Ա���<br/>
                    http://cet-bm.neea.edu.cn/
                </p>
                <p>
                    У԰��Ϣ�Ż�<br/>
                    http://authserver.hlju.edu.cn/authserver/login?service=http%3A%2F%2Fmy.hlju.edu.cn%2Findex.portal
                </p>
                <p>
                    �ڴ�����<br/>
                    http://mail.s.hlju.edu.cn/
                </p>
            </div>
        </div>
    </div>
</body>
</html>
