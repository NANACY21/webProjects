//�˻���¼ok
function accountLogin(arg0) {
    var cardID=arg0.innerHTML;//cardIDΪ16λ����
    var password=prompt("�˻���¼","�������п�����(6λ����)");
    if(password){
        var f=/^(\d{15}|\d{6})$/;
        if(!f.test(password)){
            alert("��ʽ����");
        }
        else {
            location.href="AccountLoginServlet?cardID="+cardID+"&password="+password;
        }
    }
    return false;
}