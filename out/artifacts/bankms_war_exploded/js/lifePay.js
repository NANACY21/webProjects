//生活缴费 还有结汇和购汇

//移动缴费
function paymentmobile() {
    var phoneNumber = document.getElementById("phoneNumber");
    if(phoneNumber.value==""){
        alert("充值号码不能为空");
        return false;
    }
    if(phoneNumber.value.length!=11){
        alert("充值号码必须等于11位");
        return false;
    }
    return true;
}
function paymentwater() {
    var item=document.getElementsByName("item");
    var addressnumber=document.getElementById("addressnumber");
    var money = document.getElementsByName("money");
    if(addressnumber.value==""){
        alert("用户号不能为空");
        return false;
    }
    if(addressnumber.value.length!=6){
        alert("请输入正确用户号");
        return false;
    }
    for(var i=0; i<money.length; i++){
        if(money[i].checked){
            alert("确认缴费");
            alert("缴费金额为"+money[i].value);
            location.href="PaymentServlet?money="+money[i].value;
            alert("缴费成功");
        }
    }
    return true;
}
//缴纳学费
function tuition() {
    /*链接数据库中的school表给出弹窗需要交多少钱
    然后点击确定
    即可付费需要链接paymentservlet。*/
}