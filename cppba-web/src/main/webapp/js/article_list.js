/**
 * 开发者
 *nickName:大黄蜂
 *email:245655812@qq.com
 *github:https://github.com/bigbeef
 */

$(function(){
    //加载文章分类列表
    list_articleClass();
    //搜索
    $("#search").click(function () {
        list_articleClass();
    });

})

//加载文章分类列表
function list_articleClass(){
    var likeName = $("#likeName").val();
    $.ajax({
        type: 'POST',
        url: getPath() + '/blogger/article_query.htm',
        data: {likeName:likeName},
        dataType: 'json',
        async: false,
        success: function (data) {
            if (data.result == 1) {
                var articles = data.data.articles;
                $("#article").html("");
                var html = "";
                for(var i=0;i<articles.length;i++){
                    var article = articles[i].article;
                    var articleClass = articles[i].articleClass;
                    var time = new Date(article.addTime).format("yyyy-MM-dd HH:mm:ss");
                    html += '<tr>'
                        +'<td>'+articleClass.name+'</td>'
                        +'<td>'+article.title+'</td>'
                       /* +'<td>'+article.abstracts+'</td>'*/
                        +'<td>'+time+'</td>'
                        +'<td><a href="#" onclick="load_articleClass('+article.articleId+')"'
                        +'class="tablelink">编辑</a>'
                        + ' <a href="#" onclick="delete_articleClass('+article.articleId+')"' +
                        'class="tablelink">删除</a></td>'
                        +'</tr>';
                }
                $("#article").html(html);
            } else {
                alert(data.msg);
            }
        }
    })
}

function load_articleClass(articleId){
    location.href="article_add.jsp?articleId="+articleId;
}