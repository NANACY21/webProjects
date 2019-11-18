function regVer(){
    var password1 = document.getElementById("password1");
    var password2 = document.getElementById("password2");
    if (password1.value.length < 8 || password1.value.length > 14) {
        alert("密码必须为8~14个键盘上的字符");
        password1.select();
        password1.focus();
        return false;
    }
    if (password1.value != password2.value) {
        alert("两次输入的密码不相同，请重新输入");
        password1.focus();
        return false;
    }
    return true;
}

$(function () {
    //获取父页面元素
    var value = window.opener.document.getElementById('a1').innerHTML;
    $('#who').html(value);//修改label的值
});