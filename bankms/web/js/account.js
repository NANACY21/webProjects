//账户存款
function saveMoney() {
    var money = document.getElementById("money");
    if (money.value == "") {
        money.focus();
        return false;
    } else {
        var f = /^\d+\.?\d{0,2}$/;
        if (!f.test(money.value)) {//只能输入>0的钱数
            alert("格式错误！");
            return false;
        }
    }
    return true;
}

//修改账户密码
function changePassword() {
    var oldPw = document.getElementById("oldPw");
    var newPw = document.getElementById("newPw");
    var f = /^(\d{15}|\d{6})$/;//必须是6位数字
    if (!f.test(oldPw) || !f.test(newPw)) {
        alert("格式错误！");
    } else {
        location.href = "AccountUpdatePwServlet?oldPw=" + oldPw.value + "&newPw=" + newPw.value;
    }
}

//转账
function transferAccount() {
    var f = /^(\d{15}|\d{16})$/;//目标账户必须是16位数字
    var destinationID = document.getElementById("destinationID");
    var cardID1 = document.getElementById("cardID1");
    var money2 = document.getElementById("money2");
    if(cardID1.value==destinationID.value){
        alert("无效操作");
        return false;
    }
    if(!f.test(destinationID.value)){
        alert("目标账号格式错误！");
        return false;
    }
    var ff = /^\d+\.?\d{0,2}$/;
    if (!ff.test(money2.value)) {//只能输入>0的钱数 全为数字

        alert("金额格式错误！");
        return false;
    }
    return true;
}