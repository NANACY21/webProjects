<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
    <title>bankms - jsʾ��</title>
</head>
<body>
<script type="text/javascript">


    alert("js.jsp��ʼ����");
    function tetttt() {
        document.write("+");
        setTimeout(tetttt, 1000);
    }

    tetttt();
    var array = [5,6,7,8];
    var numbers = array.slice(0,2);//index0-1
    for (var i in numbers){
        alert(numbers[i]);
    }

    var i = new Object;
    alert(typeof (i));
    var i = 1;
    var j = true;
    alert(i === j);

    function test(i) {
        alert("����ʱ����Ĳ���������ʵ�θ�����" + arguments.length);
        alert("�βθ�����" + test.length);//������
    }

    test();


</script>
<h5>js����</h5>
�����������ͣ��������ã�<br/>
����������<br/>
js�հ���js��������<br/>
<h6>��������</h6>
<script>
    var student = new Object;
    student.name = "����";
    student.age = "21";//�����������

    // ��ֵ�� keyһ����" "�����������Ľ��Ƕ��
    var obj1 = {"name": "lichi", "age": 12};
    // {} -- һ������
    // [] -- һ������
    alert(obj1.name + "--" + obj1.age);

    //
    var o2={
        run:function (i) {
            alert("cd"+i);
        }
    }
    o2.run(34);

    // jsonֻ�������ݣ�����������

    delete student.age;//ɾ�����������

    //js����Ҫ�Լ��ͷ��ڴ�


    var box = "//�й�";
    alert(encodeURI(box));//����
    alert(encodeURIComponent(box));
    alert(decodeURIComponent(encodeURIComponent(box)));
    // alert(decodeURI(encodeURI(box)));//����

    eval('var box = 100');//��js����Ľ���
    // ��string����������js����
    alert(box);
</script>
<h6>������ʽ</h6>
<h7>������ʽ������֤UI������</h7>
<script>
    /*������ʽ����

    */

    /*���������Ϊ����*/

    //����������ʽ��ʽ1
    var reg = new RegExp('box','i');//i ���Դ�Сд
    var string = 'this is a box!';
    alert("�ַ���\"string\"�Ƿ�ƥ�䣺" + reg.test(string));

    //����������ʽ��ʽ2
    reg=/box/i;//����һ��ģʽ���ַ����Ƿ����һ�����Դ�Сд��box
    alert("�ַ���\"string\"�Ƿ�ƥ�䣺" + reg.test(string));

    alert(reg.exec(string));//���ص�һ��ƥ���ֵ


    alert("��ʼ");
    var pattern = /(g)oogle!/;
    string = 'this is a google';
    pattern.test(string);

    alert(RegExp.input);
    alert(RegExp.leftContext);//���ַ�������ߣ�/////
    alert(RegExp.rightContext);
    alert(RegExp.lastMatch);
    alert(RegExp.lastParen);
    alert(RegExp.multiline);

    alert("String�����������ʽ");

    /*���ַ�������Ϊ����*/
    pattern = /box/ig;//ȫ������
    string = 'this is a Box!this is a box too';
    alert(string.match(pattern));//ƥ�䵽2��box
    // ����.match(�ַ��� )
    // console.log()
    alert(string.match(pattern).length);//���鳤��
    var regExpMatchArray = string.match(pattern);//���ض������飩

    alert(string.search(pattern));//����ƥ�䵽��λ�ã��ַ�����������/////
    string.replace(pattern, 'Tom');
    alert(string);

    alert("��ϰ");
    var reg = /^[a-z]{3}/ig;//���壺a-z����ĸ���������Ĳ����俪ͷ
    reg = /^[a-z]{3}.+\d$/ig;//���壺a-z����ĸ���������Ĳ����俪ͷ���м�0-����ַ�����һ�����ֽ�β
    var string = "azx1";
    alert(reg.test(string)+"66666");
    // .*  ����ν
    // .+  0-����ַ�

</script>










��һ����������kill her�����ˣ���meg���϶���nancy
</body>
</html>
