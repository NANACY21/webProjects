<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<html>
<head>
    <title>js����/BOM/����</title>
</head>
<body>
<script type="text/javascript">
    alert("js.jsp��ʼ����");

    function tetttt() {
        document.write("+");
        setTimeout(tetttt, 1000);
    }

    tetttt();

    //��������
    var array = [5, 6, 7, 8];
    //��ȡ���� index0-1
    var numbers = array.slice(0,2);
    for (var i in numbers){
        alert(numbers[i]);
    }

    //�������
    var i = new Object();
    //��������Ϊ����
    alert(typeof (i));

    var i = 1;
    var j = true;
    //���� ���
    alert(i == j + "  " + i === j);

    function test(i) {
        alert("����ʱ����Ĳ���������ʵ�θ�����" + arguments.length);
        //������
        alert("�βθ�����" + test.length);
    }

    test();
</script>

<h5>js����</h5>
<ul>
    <li>�����������ͣ���������</li>
    <li>����������</li>
    <li>js�հ���js��������</li>
</ul>

<h6>��������ʾ��</h6>
<script>
    //��������ʾ�� js����Ҫ�Լ��ͷ��ڴ�
    var student = new Object;
    student.name = "����";
    student.age = "21";//�����������

    // ��ֵ�� keyһ����" "�����������������Ľ��Ƕ��
    // {} -- һ������ [] -- һ������
    var obj1 = {"name": "lichi", "age": 12};
    alert(obj1.name + "--" + obj1.age);

    //���������� ��jsonֻ�������ݣ�����������
    var o2 = {
        run: function (i) {
            alert("cd" + i);
        }
    };
    o2.run(34);

    //ɾ�����������
    delete student.age;


    var box = "//�й�";
    //����
    alert(encodeURI(box));
    alert(encodeURIComponent(box));
    alert(decodeURIComponent(encodeURIComponent(box)));
    // ����
    // alert(decodeURI(encodeURI(box)));

    //��js����Ľ���
    eval('var box = 100');
    // ��string����������js����
    alert(box);
</script>

<h6>������ʽʾ����������ʽ������֤UI������</h6>
<script>
    /*������ʽ����*/


    /*���������Ϊ����*/

    //����������ʽ��ʽ1 i ���Դ�Сд
    var reg = new RegExp('box','i');
    var string = 'this is a box!';
    alert("�ַ���\"string\"�Ƿ�ƥ�䣺" + reg.test(string));

    //����������ʽ��ʽ2 ����һ��ģʽ���ַ����Ƿ����һ�����Դ�Сд��box
    reg = /box/i;
    alert("�ַ���\"string\"�Ƿ�ƥ�䣺" + reg.test(string));
    //���ص�һ��ƥ���ֵ
    alert(reg.exec(string));


    alert("��ʼ");
    var pattern = /(g)oogle!/;
    string = 'this is a google';
    pattern.test(string);

    alert(RegExp.input);
    // �ַ��������
    alert(RegExp.leftContext);
    alert(RegExp.rightContext);
    alert(RegExp.lastMatch);
    alert(RegExp.lastParen);
    alert(RegExp.multiline);


    alert("String�����������ʽ");
    /*���ַ�������Ϊ����*/
    //ȫ������
    pattern = /box/ig;
    string = 'this is a Box!this is a box too';
    //ƥ�䵽2��box
    alert(string.match(pattern));
    // ����.match(�ַ��� )
    // console.log()

    //���鳤��
    alert(string.match(pattern).length);

    //���ض������飩
    var regExpMatchArray = string.match(pattern);

    //����ƥ�䵽��λ�ã��ַ�����������
    alert(string.search(pattern));
    string.replace(pattern, 'Tom');
    alert(string);

    alert("��ϰ");

    //���壺a-z����ĸ���������Ĳ����俪ͷ
    var reg = /^[a-z]{3}/ig;
    //���壺a-z����ĸ���������Ĳ����俪ͷ���м�0-����ַ�����һ�����ֽ�β
    reg = /^[a-z]{3}.+\d$/ig;
    var string = "azx1";
    alert(reg.test(string)+"66666");
    // .*  ����ν
    // .+  0-����ַ�
</script>
</body>
</html>
