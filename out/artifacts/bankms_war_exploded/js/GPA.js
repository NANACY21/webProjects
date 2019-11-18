function addInput() {
    //'use strict';//严格模式
    let courseNumber = document.getElementById("courseNumber").value;
    if (!(/(^[1-9]\d*$)/.test(courseNumber))) {//若非正整数
        alert('输入有误');
        //return false;
    } else {
        let CourseNumber = Number(courseNumber);
        // var CourseNumber=parseInt(courseNumber);
        let scores = document.getElementById("scores");
        scores.innerHTML = "";//清空div内元素
        let node = null;
        // "use strict";//严格模式
        // console.log("这是严格模式。");

        //创建数组
        var id = new Array(1, 2, 3, 4, 5, 6, 7, 8);
        var values = new Array("0.25", "1.0", "1.5", "2.0", "2.5", "3.0", "4.0", "5.0", "6.0");

        for (let i = 0; i < CourseNumber; i++) {
            let num = i + 1;
            //node=document.createTextNode("课程"+num+"分数:");//添加文本类型节点
            //scores.appendChild(node);
            node = document.createElement("input");//添加input类型组件
            node.type = "text";
            node.name = "score";//同名分数文本框
            node.style = "width: 200px;height: 30px";
            node.autocomplete = "off";//消除文本框自动记忆之前输入的数据
            node.placeholder = "课程" + num + "分数";
            node.className = "text";//class
            scores.appendChild(node);
            for (let j = 0; j < 4; j++) {
                scores.innerHTML += "&nbsp";
            }
            node = document.createTextNode("学分:");//添加文本类型节点
            scores.appendChild(node);
            node = document.createElement("select");//循环加下拉列表
            node.type = "select";
            node.id = num + "";
            node.name = "credit";//同名学分下拉列表
            node.style = "width: 100px;height: 30px";
            // node.length=1;//每次只能选一个
            for (let j = 0; j < values.length; j++) {
                var option = document.createElement("option");
                //option.setAttribute("value",id[j]);
                option.appendChild(document.createTextNode(values[j]));
                node.appendChild(option);
                option = null;
            }
            // node.options[1].selected=true;
            /*默认选中项类似onclick事件，js单线程，全执行完主线程上的任务即i==CourseNumber
            时再执行onclick事件(任务队列(事件队列)中的任务))
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
        node.value = "查询绩点";
        node.style = "width: 100px;height: 30px";
        node.className = "button";
        scores.appendChild(node);
        node = null;//释放多余对象
    }
}