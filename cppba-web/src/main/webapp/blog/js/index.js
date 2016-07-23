var userId = 1;
var page = 1;
var pageSize=10;
$(function(){
    //初始化分页插件
    initJqPaginator();
    //初始化文章列表
    list_article();
    $(".post").click(function(){
        var articleId = $(this).attr("articleId");
        window.location.href = "article.jsp?articleId="+articleId;
    })
})

//初始化文章列表
function list_article(){
    $(".main > section").remove();
    $.ajax({
        type: 'POST',
        url: getPath() + '/article_query.htm',
        data: {userId:userId,page:page,pageSize:pageSize},
        dataType: 'json',
        async: false,
        success: function (data) {
            if (data.result == 1) {
                var count = data.data.count;
                var articles = data.data.articles;
                var html = "";
                for(var i=0;i<articles.length;i++){
                    var article = articles[i].article;
                    var addTime = new Date();
                    addTime.setTime(article.addTime);
                    html += '<section class="post" itemscope="" itemprop="blogitem" articleId="'+article.articleId+'"> ' +
                        //'<a href="#" title="'+article.title+'" itemprop="url"> ' +
                        '<h1 itemprop="name">'+article.title+'</h1> ' +
                        '<p itemprop="description"> ' + article.abstracts+'</p> ' +
                        '<time datetime="'+addTime.format("yyyy-MM-dd")+'" itemprop="datePublished">'+
                        addTime.format("yyyy-MM-dd")+'</time> ' +
                        //'</a> ' +
                        '</section>';
                }
                $(".main").prepend(html);
                //这里写列表的总数
                $('.product_length_number').text(count);
                //这里是分页的插件
                $('#pagination').jqPaginator('option', {
                    totalPages:(Math.ceil(count/pageSize)<1?1:Math.ceil(count/pageSize)),
                    currentPage: page
                });
            } else {
                ajaxCommonResultHandle(data);
            }
        }
    })
}

//初始化分页
function initJqPaginator(){
    $.jqPaginator('#pagination', {
        totalPages: 100,
        visiblePages: 10,
        currentPage: 1,
        first:'<li class="prev"><a href="javascript:;">首页</a></li>',
        last:'<li class="prev"><a href="javascript:;">末页</a></li>',
        prev: '<li class="prev"><a href="javascript:;">上一页</a></li>',
        next: '<li class="next"><a href="javascript:;">下一页</a></li>',
        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
        onPageChange: function (num, type) {
            page=num;
            if(type=="change"){
                list_article();
            }
        }
    });
}