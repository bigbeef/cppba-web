/**
 * 开发者
 *nickName:大黄蜂
 *email:245655812@qq.com
 *github:https://github.com/bigbeef
 */

var editor;
$(function(){
    initTextArea();
    user_load();
    $("#submit").click(function(){
        submit();
    })
})

function user_load(){
    var userId = $("[name=userId]").val();
    $.ajax({
        type: 'POST',
        url: getPath() + '/user_load.htm',
        data: {userId: userId},
        dataType: 'json',
        async: false,
        success: function (data) {
            if (data.result == 1) {
                var user = data.data.user;
                $("[name=nickName]").val(user.nickName);
                $("[name=remark]").val(user.remark);
            } else {
                alert(data.msg);
            }
        }
    })
}

//提交
function submit(){
    var userId = $("[name=userId]").val();
    var nickName = $("[name=nickName]").val();
    var remark = KE.util.getData("content7");
    var sure = confirm("确认修改吗?");
    if(sure){
        $.ajax({
            type: 'POST',
            url: getPath() + '/user_setting.htm',
            data: {userId: userId, nickName: nickName,remark:remark},
            dataType: 'json',
            async: false,
            success: function (data) {
                if (data.result == 1) {
                    alert("修改成功!");
                } else {
                    alert(data.msg);
                }
            }
        })
    }
}

function initTextArea(){
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
}