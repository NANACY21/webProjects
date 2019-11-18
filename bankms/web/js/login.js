$(function () {
    $('input').focus(function () {
        $(this).addClass('temp');
    }).blur(function () {
        $(this).removeClass('temp');
    });


    //点登录按钮触发
    $('#userLoginSubmit').click(function () {
        $('#userLoginSubmit').val('正在登录呀');
        return true;
    });

});

//此页面禁止回退
window.onload = function () {
    history.pushState(null, null, document.URL);
    window.addEventListener('popstate', function () {
        history.pushState(null, null, document.URL);
    });
};



//点击保存用户名
function check1() {
    /*
    保存用户名、密码复选框全选中或全取消选中：不合理。
    getElementById、getElementsByName适用情况不同。
     */

    var checkbox1=document.getElementById("checkbox1");
    var checkbox2=document.getElementById("checkbox2");
    // for(var i=0;i<remUsername.length;i++) {
    //     remUsername[i].checked=true;
    // }
    if(checkbox1.checked==false){
        checkbox2.checked=false;
    }
}
//点击保存密码
function check2() {
    var checkbox1=document.getElementById("checkbox1");
    var checkbox2=document.getElementById("checkbox2");
    if(checkbox2.checked==true){
        checkbox1.checked=true;
    }
}

//切换为用户登录
function Radio1() {
    var radio1=document.getElementById("radio1");
    var label1=document.getElementById("label1");
    var label2=document.getElementById("label2");
    var a1=document.getElementById("a1");
    if(radio1.checked==true){
        label1.innerText="用户";
        label2.innerHTML="保存用户名";
        a1.innerText="用户注册";
    }
    return true;
}

//切换为管理员登录
function Radio2() {
    var radio2=document.getElementById("radio2");
    var label1=document.getElementById("label1");
    var label2=document.getElementById("label2");
    var a1=document.getElementById("a1");
    if(radio2.checked==true){
        label1.innerText="管理员";
        label2.innerHTML="保存管理员名";
        a1.innerText="管理员注册";
    }
    return true;
}

//组件的value
function getLabel3Value() {
    return document.getElementById("label3").innerHTML;
}

//获取一个.jsp的label元素数
function getLabelNumber() {
    var elements=document.getElementsByTagName("label");
    alert("该页面label组件数："+elements.length);
}

/*
办卡
 */
function handleCard() {
    document.getElementById("loginForm").style.display="none";
    document.getElementById("accountActivationForm").style.display="none";
    document.getElementById("handleCardForm").style.display="block";
    return false;
}

/*
办卡 提交的data格式验证
 */
function handleCardSubmit() {
    var userID = document.getElementById("userID");//UI的身份证号
    var userRealName = document.getElementById("userRealName");//ui的真实姓名
    var f=/^(\d{15}|\d{18})$/;
    if(!f.test(userID.value)){
        alert("身份证号格式错误\n身份证号必须是18位数字");
        return false;
    }
    if(userRealName.value==""){
        alert("请输入你的真实姓名");
        return false;
    }
    return true;
}

/*
取消办卡
 */
function handleCardCancel() {
    document.getElementById("loginForm").style.display="block";
    document.getElementById("handleCardForm").style.display="none";
    document.getElementById("accountActivationForm").style.display="none";
    return false;
}
/*
账户激活
 */
function accountActivation() {
    document.getElementById("loginForm").style.display="none";
    document.getElementById("handleCardForm").style.display="none";
    document.getElementById("accountActivationForm").style.display="block";
    return false;
}

/*
账户激活 提交的data格式验证
 */
function accountActivationSubmit() {
    var cardID = document.getElementById("cardID");
    var userName = document.getElementById("userName");
    var initialPassword = document.getElementById("initialPassword");
    var password_st = document.getElementById("password_st");
    var password_nd = document.getElementById("password_nd");
    if(cardID.value.length<16){
        alert("银行卡号是16位");
        return false;
    }
    if(userName.value=""){
        alert("填写真实姓名");
        return false;
    }
    if(initialPassword.value.length<6){
        alert("初始密码是6位数字");
        return false;
    }
    if(password_st.value.length<6){
        alert("密码是6位数字");
        return false;
    }
    if(password_st.value!=password_nd.value){
        alert("2次密码不一致");
        return false;
    }
    return true;
}

/*
取消账户激活
 */
function accountActivationCancel() {
    document.getElementById("loginForm").style.display="block";
    document.getElementById("accountActivationForm").style.display="none";
    document.getElementById("handleCardForm").style.display="none";
    return false;
}

/*
账户挂失
js三种弹出框
 */
function accountReport() {
    var cardID = prompt("账户挂失", "输入需要挂失的银行卡号(16位数字)");
    if(cardID){
        var f=/^(\d{15}|\d{16})$/;
        if(!f.test(cardID)){
            alert("格式错误！");
        }
        else{
            document.loginForm.action = "AccountReportServlet"+"?cardID="+cardID;
            document.loginForm.submit();
        }
    }
    else{//如果prompt点取消或未输入内容
        if(confirm("放弃办理银行卡?")){
            alert("好的\nnancy");
            return false;
        }
    }
    return false;
}

