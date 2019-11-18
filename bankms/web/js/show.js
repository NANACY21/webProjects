
//添加好友，跳转到好友信息表单
function addFriend(arg0){
    var innerHTML = arg0.innerHTML;
    alert(innerHTML);
    location.href="info.jsp?reason=addNewF";
    return false;
}

//删除好友
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
        alert("请先选中一个要删除的好友");
        return false;
    }
    document.friendListForm.action = "DeleteFriendServlet";
    document.friendListForm.submit();
}

//点击全选/取消全选时触发该函数
function chooseAll() {
    var label1=document.getElementById("label1");
    var deletes=document.getElementsByName("delete");
    if(label1.innerText=="全选"){
        for(var i=0;i<deletes.length;i++){
            if(deletes[i].checked==false){
                deletes[i].checked=true;
            }
        }
        label1.innerText="取消全选";
    }
    else if(label1.innerText=="取消全选"){
        for(var i=0;i<deletes.length;i++){
            if(deletes[i].checked){
                deletes[i].checked=false;
            }
        }
        label1.innerText="全选";
    }
}

//点击任意删除复选框时触发该函数
function check(arg0) {
    var label1=document.getElementById("label1");
    if(!arg0.checked){
        label1.innerText="全选";
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
        label1.innerText="取消全选";
        return;
    }
}

//按姓氏查询
function Query() {
    var surname = document.getElementById("surname");
    if(surname.value.length==0){
        alert("请输入姓氏");
        return false;
    }
    location.href="GetPartFriendServlet?surname="+surname.value;
    return false;
}