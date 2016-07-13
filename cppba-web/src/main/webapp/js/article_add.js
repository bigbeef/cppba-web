/**
 * 开发者
 *nickName:大黄蜂
 *email:245655812@qq.com
 *github:https://github.com/bigbeef
 */
$(function(){
    //加载文章分类列表
    list_articleClass();  
})

//加载文章分类列表
function list_articleClass(){
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
                for(var i=0;i<articleClasss.length;i++){
                    var articleClass = articleClasss[i].articleClass;
                    html += '<option value="'+articleClass.articleClassId+'">'+articleClass.name+'</option>';
                }
                $("#article_class").html(html);
            } else {
                alert(data.msg);
            }
        }
    })
}