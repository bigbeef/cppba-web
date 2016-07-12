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

    $("#add").click(function(){
        $("#add_div").show();
        $("#articleClassId").val(0);
        $("#name").val("");
        $("#sortId").val("");
    })

    $("#cancel,#cancel_btn").click(function(){
        $("#add_div").hide();
    })

    //提交
    $("#add_submit").click(function(){
        add_submit();
    })
})

function add_submit(){
    var articleClassId = $("#articleClassId").val();;
    var name = $("#name").val();
    var userId = $("#userId").val();
    var sortId = $("#sortId").val();
    var sure = confirm("确认操作吗?");
    if(sure){
        $.ajax({
            type: 'POST',
            url: getPath() + '/articleClass_saveOrUpdate.htm',
            data: {userId: userId,name:name,sortId:sortId,articleClassId:articleClassId},
            dataType: 'json',
            async: false,
            success: function (data) {
                if (data.result == 1) {
                    alert("操作成功！");
                    location.reload();
                } else {
                    alert(data.msg);
                }
            }
        })
    }
}

//加载文章分类列表
function list_articleClass(){
    var userId = $("#userId").val();
    var likeName = $("#likeName").val();
    $.ajax({
        type: 'POST',
        url: getPath() + '/articleClass_query.htm',
        data: {userId: userId,likeName:likeName},
        dataType: 'json',
        async: false,
        success: function (data) {
            if (data.result == 1) {
                var articleClasss = data.data.articleClasss;
                $("#article_class").html("");
                var html = "";
                for(var i=0;i<articleClasss.length;i++){
                    var articleClass = articleClasss[i].articleClass;
                    var time = new Date(articleClass.addTime).format("yyyy-MM-dd HH:mm:ss");
                    html += '<tr>' 
                        +'<td>'+articleClass.articleClassId+'</td>'
                        +'<td>'+articleClass.name+'</td>'
                        +'<td>'+time+'</td>'
                        +'<td>'+articleClass.sortId+'</td>'
                        +'<td><a href="#" onclick="load_articleClass('+articleClass.articleClassId+')"'
                        +'class="tablelink">编辑</a>'
                        + ' <a href="#" onclick="delete_articleClass('+articleClass.articleClassId+')"' +
                        'class="tablelink">删除</a></td>'
                        +'</tr>';
                }
                $("#article_class").html(html);
            } else {
                alert(data.msg);
            }
        }
    })
}

//加载一个文章分类
function load_articleClass(articleClassId){
    $.ajax({
        type: 'POST',
        url: getPath() + '/articleClass_load.htm',
        data: {articleClassId:articleClassId},
        dataType: 'json',
        async: false,
        success: function (data) {
            if (data.result == 1) {
                $("#add_div").show();
                var articleClass = data.data.articleClass;
                $("#articleClassId").val(articleClassId);
                $("#name").val(articleClass.name);
                $("#sortId").val(articleClass.sortId);
            } else {
                alert(data.msg);
            }
        }
    })
}

//删除一个文章分类
function delete_articleClass(articleClassId){
    var sure = confirm("确认删除吗?");
    if(sure) {
        $.ajax({
            type: 'POST',
            url: getPath() + '/articleClass_delete.htm',
            data: {articleClassId:articleClassId},
            dataType: 'json',
            async: false,
            success: function (data) {
                if (data.result == 1) {
                    alert("删除成功！");
                    location.reload();
                }else {
                    alert(data.msg);
                }
            }
        })
    }
}