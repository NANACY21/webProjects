$(function () {
    //´ËÒ³Ãæ½ûÖ¹»ØÍË
    history.pushState(null,null,document.URL);
    window.addEventListener('popstate',function () {
        history.pushState(null,null,document.URL);
    });
})