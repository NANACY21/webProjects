function regVer(){
    var password1 = document.getElementById("password1");
    var password2 = document.getElementById("password2");
    if (password1.value.length < 8 || password1.value.length > 14) {
        alert("�������Ϊ8~14�������ϵ��ַ�");
        password1.select();
        password1.focus();
        return false;
    }
    if (password1.value != password2.value) {
        alert("������������벻��ͬ������������");
        password1.focus();
        return false;
    }
    return true;
}

$(function () {
    //��ȡ��ҳ��Ԫ��
    var value = window.opener.document.getElementById('a1').innerHTML;
    $('#who').html(value);//�޸�label��ֵ
});