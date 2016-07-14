/**
 * 开发者
 *nickName:大黄蜂
 *email:245655812@qq.com
 *github:https://github.com/bigbeef
 */
var editor,articleId,markdown;
$(function () {
    articleId = GetQueryString("articleId") |0;
    
    
    //加载文章分类列表
    list_articleClass();

    //初始化文章内容
    if(articleId>0){
        load_article();
    }
    //初始化select
    $(".select2").uedSelect({
        width: 167
    });
    //初始化markdown
    editor = editormd("markdown", {
        width  : "90%",
        height : 720,
        path   : '../lib/',
        markdown:markdown
    });
    //提交
    $("#submit").click(function(){
        submit();
    })
})

//初始化文章内容
function load_article(){
    $.ajax({
        type: 'POST',
        url: getPath() + '/blogger/article_load.htm',
        data: {articleId:articleId},
        dataType: 'json',
        async: false,
        success: function (data) {
            if (data.result == 1) {
                var article = data.data.article;
                $("#article_class").val(article.articleClassId);
                $("#title").val(article.title);
                $("#abstracts").val(article.abstracts);
                markdown = article.content;
            } else {
                alert(data.msg);
            }
        }
    })
}

//提交
function submit(){
    var content = editor.getMarkdown();
    var article_class = $("#article_class").val();
    var title = $("#title").val();
    var abstracts = $("#abstracts").val();
    var sure = confirm("确认操作吗?");
    if(sure){
        $.ajax({
            type: 'POST',
            url: getPath() + '/blogger/article_saveOrUpdate.htm',
            data: {articleId:articleId,articleClassId:article_class,content:content,
                title:title,abstracts:abstracts,articleId:articleId},
            dataType: 'json',
            async: false,
            success: function (data) {
                if (data.result == 1) {
                    alert("操作成功！");
                    location.href="article_list.jsp";
                } else {
                    alert(data.msg);
                }
            }
        })
    }
}

//加载文章分类列表
function list_articleClass() {
    $.ajax({
        type: 'POST',
        url: getPath() + '/blogger/articleClass_query.htm',
        data: {},
        dataType: 'json',
        async: false,
        success: function (data) {
            if (data.result == 1) {
                var articleClasss = data.data.articleClasss;
                $("#article_class").html("");
                var html = "";
                for (var i = 0; i < articleClasss.length; i++) {
                    var articleClass = articleClasss[i].articleClass;
                    var selected = "";
                    html += '<option value="' + articleClass.articleClassId + '">' + articleClass.name + '</option>';
                }
                $("#article_class").html(html);
            } else {
                alert(data.msg);
            }
        }
    })
}