//���ֻ�Ч��
window.onload = function () {
    var h3 = document.getElementById("h3");
    var temp = h3.innerHTML;
    h3.innerHTML = "";//��ʱ,temp��Ϊ""
    var i = 0;
    var timer = null;
    timer = setInterval(function () {
        h3.innerHTML = temp.substring(0, i);
        i++;
        if (h3.innerHTML == temp) {
            clearInterval(timer);
        }
    }, 50);
};