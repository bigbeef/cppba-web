/**
 * 开发者
 *nickName:大黄蜂
 *email:245655812@qq.com
 *github:https://github.com/bigbeef
 */
var editor,articleId;
$(function () {
    articleId = GetQueryString("articleId") |0;
    //初始化markdown
    editor = editormd("markdown", {
        width  : "90%",
        height : 720,
        path   : '../lib/'
    });
    //加载文章分类列表
    list_articleClass();
    //提交
    $("#submit").click(function(){
        submit();
    })
    //初始化select
    $(".select2").uedSelect({
        width: 167
    });
})

function submit(){
    var content = editor.getMarkdown();
    var article_class = $("#article_class").val();
    var title = $("#title").val();
    var abstracts = $("#abstracts").val();
    alert(abstracts);
}

//加载文章分类列表
function list_articleClass() {
    $.ajax({
        type: 'POST',
        url: getPath() + '/articleClass_query.htm',
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