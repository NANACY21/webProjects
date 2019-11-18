// 切换日期
function changeselect() {
    var xzrq = document.getElementById("xzrq");
    var index = xzrq.selectedIndex;

    //显示这一天的
    var text = xzrq.options[index].text;

    //获取所有ol标签中id以yy-开头的元素
    var yys = $('ol[id^="yy-"]');
    for (var i = 0; i < yys.length; i++) {
        yys[i].style.display = 'none';
    }
    document.getElementById("yy-" + text).style.display = 'block';
}

// 打开div
function open() {
    var yls_div = document.getElementById('yls-div');
    var yls_a = document.getElementById('yls-a');
    if (yls_a.innerText==='友零售') {
        yls_div.style.display = 'none';

    } else {
        yls_div.style.display = 'block'
    }
}

$(function () {
    //点击友零售
    $('#wl').click(function () {
        var yls_a = document.getElementById('wl').innerHTML;
        if (yls_a == "工作日志") {
            $('#work-log').css('display', 'block');
            $('#wl').html('隐藏工作日志');
        } else {
            $('#wl').html('工作日志');
            $('#work-log').css('display', 'none');
        }
    });


    //点击友零售
    $('#yls-a').click(function () {
        var yls_a = document.getElementById('yls-a').innerHTML;
        if (yls_a == "友零售") {
            $('#yls-div').css('display', 'block');
            $('#yls-a').html('隐藏友零售');
        } else {
            $('#yls-a').html('友零售');
            $('#yls-div').css('display', 'none');
        }
    });

    //点击链接
    $('#install').click(function () {
        var install = document.getElementById('install').innerHTML;
        if (install == "链接") {
            $('#lj').css('display', 'block');
            $('#install').html('隐藏链接');
        } else {
            $('#install').html('链接');
            $('#lj').css('display', 'none');

        }

    });
});