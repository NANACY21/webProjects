//账户登录ok
function accountLogin(arg0) {
    var cardID=arg0.innerHTML;//cardID为16位卡号
    var password=prompt("账户登录","输入银行卡密码(6位数字)");
    if(password){
        var f=/^(\d{15}|\d{6})$/;
        if(!f.test(password)){
            alert("格式错误！");
        }
        else {
            location.href="AccountLoginServlet?cardID="+cardID+"&password="+password;
        }
    }
    return false;
}