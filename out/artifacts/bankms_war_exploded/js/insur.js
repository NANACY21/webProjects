//���ڶ��� this code
$(function () {
    //��ȡҪ��λԪ�ؾ�������������ľ���
    var navH = $('.index').offset().top;
    //�������¼�
    $(window).scroll(function () {
        //��ȡ�������Ļ�������
        var scroH = $(this).scrollTop();
        //�������Ļ���������ڵ��ڶ�λԪ�ؾ�������������ľ��룬�͹̶�����֮�Ͳ��̶�
        if (scroH >= navH) {
            $('.index').css({"position": "fixed", "top": 0});
        } else if (scroH < navH) {
            $('.index').css({"position": "static"});
        }
    });
});