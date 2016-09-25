var articleId = getQueryString("articleId")|0;
var title;
$(function (){
    //初始化文章
    load_article();
    //初始化多说评论
    initComment();
})

function load_article(){
    $.ajax({
        type: 'POST',
        url: getPath() + '//article_load.htm',
        data: {articleId:articleId},
        dataType: 'json',
        async: false,
        success: function (data) {
            if (data.result == 1) {
                var article = data.data.article;
                title = article.title;
                $(".articleTitle").html(article.title);
                $(".articleContent").html(article.html);
            } else {
                ajaxCommonResultHandle(data);
            }
        }
    })
}

function initComment(){
    var html = "<div class='ds-thread' data-thread-key='"+articleId+"' " +
        "data-title='"+title+"' data-url='"+window.location.href +"'></div> " +
        "<script type='text/javascript'> " +
        "var duoshuoQuery = {short_name:'cppba'}; " +
        "(function() { " +
        " var ds = document.createElement('script'); " +
        " ds.type = 'text/javascript';ds.async = true; " +
        "ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js'; " +
        " ds.charset = 'UTF-8'; " +
        "(document.getElementsByTagName('head')[0] " +
        "|| document.getElementsByTagName('body')[0]).appendChild(ds); " +
        "})(); " +
        "</script>";
    $("#comment").html(html);
}