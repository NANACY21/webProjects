//����ɷ� ���н��͹���

//�ƶ��ɷ�
function paymentmobile() {
    var phoneNumber = document.getElementById("phoneNumber");
    if(phoneNumber.value==""){
        alert("��ֵ���벻��Ϊ��");
        return false;
    }
    if(phoneNumber.value.length!=11){
        alert("��ֵ����������11λ");
        return false;
    }
    return true;
}
function paymentwater() {
    var item=document.getElementsByName("item");
    var addressnumber=document.getElementById("addressnumber");
    var money = document.getElementsByName("money");
    if(addressnumber.value==""){
        alert("�û��Ų���Ϊ��");
        return false;
    }
    if(addressnumber.value.length!=6){
        alert("��������ȷ�û���");
        return false;
    }
    for(var i=0; i<money.length; i++){
        if(money[i].checked){
            alert("ȷ�Ͻɷ�");
            alert("�ɷѽ��Ϊ"+money[i].value);
            location.href="PaymentServlet?money="+money[i].value;
            alert("�ɷѳɹ�");
        }
    }
    return true;
}
//����ѧ��
function tuition() {
    /*�������ݿ��е�school�����������Ҫ������Ǯ
    Ȼ����ȷ��
    ���ɸ�����Ҫ����paymentservlet��*/
}