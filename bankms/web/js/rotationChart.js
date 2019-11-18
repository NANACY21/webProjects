var number = document.getElementById('number');
var allLi = number.getElementsByTagName('li');
var image = document.getElementById('image');
var allimage = image.getElementsByTagName('img');
var prev = document.getElementById('prev');
var next = document.getElementById('next');
var container = document.getElementById('container');
var nowIndex = 0;
var timer = null;
for(var i=0; i<allLi.length; i++){
    allLi[i].index = i;
    allLi[i].onmouseover = function(){
        nowIndex = this.index;
        changeImg();
        clearInterval(timer);
    };
    allLi[i].onmouseout=function () {
        play();
    }
}
prev.onmouseover = function(){
    prev.className='arrow';

}
prev.onmouseout = function(){
    prev.className='';
}
next.onmouseover=function(){
    next.className='arrow'
}
next.onmouseout=function(){
    next.className=''
}
prev.onclick = next.onclick = function(){
    if(this === prev){//prev
        nowIndex--;
        if(nowIndex == -1){
            nowIndex = allimage.length - 1;
        }

    }else{ // next
        nowIndex++;
        if(nowIndex == allimage.length){
            nowIndex = 0;
        }
    }
    changeImg();
};

image.onmouseover = function(){
    clearInterval(timer);
};

image.onmouseout = function(){
    play();
};

prev.onselectstart = next.onselectstart = function(){
    return false;
};

play();
function changeImg(){
    for(var i=0; i<allLi.length; i++){
        allLi[i].className = '';
        allimage[i].className = '';
    }
    allLi[nowIndex].className = 'selected';
    allimage[nowIndex].className = 'selected';
}

function play(){
    timer = setInterval(function(){
        next.onclick();
    }, 3000);//自动轮播的速度
}