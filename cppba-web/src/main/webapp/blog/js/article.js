var articleId = GetQueryString("articleId")|0;
$(function (){
    load_article();
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
                $(".articleTitle").html(article.title);
                //$(".articleContent").html();
            } else {
                ajaxCommonResultHandle(data);
            }
        }
    })
}