function addInput() {
    //'use strict';//�ϸ�ģʽ
    let courseNumber = document.getElementById("courseNumber").value;
    if (!(/(^[1-9]\d*$)/.test(courseNumber))) {//����������
        alert('��������');
        //return false;
    } else {
        let CourseNumber = Number(courseNumber);
        // var CourseNumber=parseInt(courseNumber);
        let scores = document.getElementById("scores");
        scores.innerHTML = "";//���div��Ԫ��
        let node = null;
        // "use strict";//�ϸ�ģʽ
        // console.log("�����ϸ�ģʽ��");

        //��������
        var id = new Array(1, 2, 3, 4, 5, 6, 7, 8);
        var values = new Array("0.25", "1.0", "1.5", "2.0", "2.5", "3.0", "4.0", "5.0", "6.0");

        for (let i = 0; i < CourseNumber; i++) {
            let num = i + 1;
            //node=document.createTextNode("�γ�"+num+"����:");//����ı����ͽڵ�
            //scores.appendChild(node);
            node = document.createElement("input");//���input�������
            node.type = "text";
            node.name = "score";//ͬ�������ı���
            node.style = "width: 200px;height: 30px";
            node.autocomplete = "off";//�����ı����Զ�����֮ǰ���������
            node.placeholder = "�γ�" + num + "����";
            node.className = "text";//class
            scores.appendChild(node);
            for (let j = 0; j < 4; j++) {
                scores.innerHTML += "&nbsp";
            }
            node = document.createTextNode("ѧ��:");//����ı����ͽڵ�
            scores.appendChild(node);
            node = document.createElement("select");//ѭ���������б�
            node.type = "select";
            node.id = num + "";
            node.name = "credit";//ͬ��ѧ�������б�
            node.style = "width: 100px;height: 30px";
            // node.length=1;//ÿ��ֻ��ѡһ��
            for (let j = 0; j < values.length; j++) {
                var option = document.createElement("option");
                //option.setAttribute("value",id[j]);
                option.appendChild(document.createTextNode(values[j]));
                node.appendChild(option);
                option = null;
            }
            // node.options[1].selected=true;
            /*Ĭ��ѡ��������onclick�¼���js���̣߳�ȫִ�������߳��ϵ�����i==CourseNumber
            ʱ��ִ��onclick�¼�(�������(�¼�����)�е�����))
             */
            // node.className="form-control";
            scores.appendChild(node);
            node = document.createElement("br");
            scores.appendChild(node);
        }
        for (let i = 0; i < CourseNumber; i++) {
            let num = i + 1;
            let node = document.getElementById(num);
            node.options[1].selected = true;
        }
        node = document.createElement("br");
        scores.appendChild(node);
        node = document.createElement("input");
        node.type = "submit";
        node.name = "query";
        node.value = "��ѯ����";
        node.style = "width: 100px;height: 30px";
        node.className = "button";
        scores.appendChild(node);
        node = null;//�ͷŶ������
    }
}