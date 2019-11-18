$(function () {
    $('input').focus(function () {
        $(this).addClass('temp');
    }).blur(function () {
        $(this).removeClass('temp');
    });


    //���¼��ť����
    $('#userLoginSubmit').click(function () {
        $('#userLoginSubmit').val('���ڵ�¼ѽ');
        return true;
    });

});

//��ҳ���ֹ����
window.onload = function () {
    history.pushState(null, null, document.URL);
    window.addEventListener('popstate', function () {
        history.pushState(null, null, document.URL);
    });
};



//��������û���
function check1() {
    /*
    �����û��������븴ѡ��ȫѡ�л�ȫȡ��ѡ�У�������
    getElementById��getElementsByName���������ͬ��
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
//�����������
function check2() {
    var checkbox1=document.getElementById("checkbox1");
    var checkbox2=document.getElementById("checkbox2");
    if(checkbox2.checked==true){
        checkbox1.checked=true;
    }
}

//�л�Ϊ�û���¼
function Radio1() {
    var radio1=document.getElementById("radio1");
    var label1=document.getElementById("label1");
    var label2=document.getElementById("label2");
    var a1=document.getElementById("a1");
    if(radio1.checked==true){
        label1.innerText="�û�";
        label2.innerHTML="�����û���";
        a1.innerText="�û�ע��";
    }
    return true;
}

//�л�Ϊ����Ա��¼
function Radio2() {
    var radio2=document.getElementById("radio2");
    var label1=document.getElementById("label1");
    var label2=document.getElementById("label2");
    var a1=document.getElementById("a1");
    if(radio2.checked==true){
        label1.innerText="����Ա";
        label2.innerHTML="�������Ա��";
        a1.innerText="����Աע��";
    }
    return true;
}

//�����value
function getLabel3Value() {
    return document.getElementById("label3").innerHTML;
}

//��ȡһ��.jsp��labelԪ����
function getLabelNumber() {
    var elements=document.getElementsByTagName("label");
    alert("��ҳ��label�������"+elements.length);
}

/*
�쿨
 */
function handleCard() {
    document.getElementById("loginForm").style.display="none";
    document.getElementById("accountActivationForm").style.display="none";
    document.getElementById("handleCardForm").style.display="block";
    return false;
}

/*
�쿨 �ύ��data��ʽ��֤
 */
function handleCardSubmit() {
    var userID = document.getElementById("userID");//UI�����֤��
    var userRealName = document.getElementById("userRealName");//ui����ʵ����
    var f=/^(\d{15}|\d{18})$/;
    if(!f.test(userID.value)){
        alert("���֤�Ÿ�ʽ����\n���֤�ű�����18λ����");
        return false;
    }
    if(userRealName.value==""){
        alert("�����������ʵ����");
        return false;
    }
    return true;
}

/*
ȡ���쿨
 */
function handleCardCancel() {
    document.getElementById("loginForm").style.display="block";
    document.getElementById("handleCardForm").style.display="none";
    document.getElementById("accountActivationForm").style.display="none";
    return false;
}
/*
�˻�����
 */
function accountActivation() {
    document.getElementById("loginForm").style.display="none";
    document.getElementById("handleCardForm").style.display="none";
    document.getElementById("accountActivationForm").style.display="block";
    return false;
}

/*
�˻����� �ύ��data��ʽ��֤
 */
function accountActivationSubmit() {
    var cardID = document.getElementById("cardID");
    var userName = document.getElementById("userName");
    var initialPassword = document.getElementById("initialPassword");
    var password_st = document.getElementById("password_st");
    var password_nd = document.getElementById("password_nd");
    if(cardID.value.length<16){
        alert("���п�����16λ");
        return false;
    }
    if(userName.value=""){
        alert("��д��ʵ����");
        return false;
    }
    if(initialPassword.value.length<6){
        alert("��ʼ������6λ����");
        return false;
    }
    if(password_st.value.length<6){
        alert("������6λ����");
        return false;
    }
    if(password_st.value!=password_nd.value){
        alert("2�����벻һ��");
        return false;
    }
    return true;
}

/*
ȡ���˻�����
 */
function accountActivationCancel() {
    document.getElementById("loginForm").style.display="block";
    document.getElementById("accountActivationForm").style.display="none";
    document.getElementById("handleCardForm").style.display="none";
    return false;
}

/*
�˻���ʧ
js���ֵ�����
 */
function accountReport() {
    var cardID = prompt("�˻���ʧ", "������Ҫ��ʧ�����п���(16λ����)");
    if(cardID){
        var f=/^(\d{15}|\d{16})$/;
        if(!f.test(cardID)){
            alert("��ʽ����");
        }
        else{
            document.loginForm.action = "AccountReportServlet"+"?cardID="+cardID;
            document.loginForm.submit();
        }
    }
    else{//���prompt��ȡ����δ��������
        if(confirm("�����������п�?")){
            alert("�õ�\nnancy");
            return false;
        }
    }
    return false;
}

