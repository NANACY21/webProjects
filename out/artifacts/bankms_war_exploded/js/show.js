
//��Ӻ��ѣ���ת��������Ϣ��
function addFriend(arg0){
    var innerHTML = arg0.innerHTML;
    alert(innerHTML);
    location.href="info.jsp?reason=addNewF";
    return false;
}

//ɾ������
function deleteFriend(){
    let elementsByName = document.getElementsByName("delete");
    var i = 0, flag = 0;
    for(i=0;i<elementsByName.length;i++) {
        if (elementsByName[i].checked) {
            flag = 1;
            break;
        }
    }
    if(flag==0) {
        alert("����ѡ��һ��Ҫɾ���ĺ���");
        return false;
    }
    document.friendListForm.action = "DeleteFriendServlet";
    document.friendListForm.submit();
}

//���ȫѡ/ȡ��ȫѡʱ�����ú���
function chooseAll() {
    var label1=document.getElementById("label1");
    var deletes=document.getElementsByName("delete");
    if(label1.innerText=="ȫѡ"){
        for(var i=0;i<deletes.length;i++){
            if(deletes[i].checked==false){
                deletes[i].checked=true;
            }
        }
        label1.innerText="ȡ��ȫѡ";
    }
    else if(label1.innerText=="ȡ��ȫѡ"){
        for(var i=0;i<deletes.length;i++){
            if(deletes[i].checked){
                deletes[i].checked=false;
            }
        }
        label1.innerText="ȫѡ";
    }
}

//�������ɾ����ѡ��ʱ�����ú���
function check(arg0) {
    var label1=document.getElementById("label1");
    if(!arg0.checked){
        label1.innerText="ȫѡ";
        return;
    }
    var deletes=document.getElementsByName("delete");
    var i=0;
    for(i=0;i<deletes.length;i++){
        if(!deletes[i].checked){
            return;
        }
    }
    if(i==deletes.length){
        label1.innerText="ȡ��ȫѡ";
        return;
    }
}

//�����ϲ�ѯ
function Query() {
    var surname = document.getElementById("surname");
    if(surname.value.length==0){
        alert("����������");
        return false;
    }
    location.href="GetPartFriendServlet?surname="+surname.value;
    return false;
}