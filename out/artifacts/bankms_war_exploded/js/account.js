//�˻����
function saveMoney() {
    var money = document.getElementById("money");
    if (money.value == "") {
        money.focus();
        return false;
    } else {
        var f = /^\d+\.?\d{0,2}$/;
        if (!f.test(money.value)) {//ֻ������>0��Ǯ��
            alert("��ʽ����");
            return false;
        }
    }
    return true;
}

//�޸��˻�����
function changePassword() {
    var oldPw = document.getElementById("oldPw");
    var newPw = document.getElementById("newPw");
    var f = /^(\d{15}|\d{6})$/;//������6λ����
    if (!f.test(oldPw) || !f.test(newPw)) {
        alert("��ʽ����");
    } else {
        location.href = "AccountUpdatePwServlet?oldPw=" + oldPw.value + "&newPw=" + newPw.value;
    }
}

//ת��
function transferAccount() {
    var f = /^(\d{15}|\d{16})$/;//Ŀ���˻�������16λ����
    var destinationID = document.getElementById("destinationID");
    var cardID1 = document.getElementById("cardID1");
    var money2 = document.getElementById("money2");
    if(cardID1.value==destinationID.value){
        alert("��Ч����");
        return false;
    }
    if(!f.test(destinationID.value)){
        alert("Ŀ���˺Ÿ�ʽ����");
        return false;
    }
    var ff = /^\d+\.?\d{0,2}$/;
    if (!ff.test(money2.value)) {//ֻ������>0��Ǯ�� ȫΪ����

        alert("����ʽ����");
        return false;
    }
    return true;
}