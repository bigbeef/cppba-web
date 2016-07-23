$(function(){
    //初始化博主
    user_load();
})

//初始化博主
function user_load(){
    $.ajax({
        type: 'POST',
        url: getPath() + '/user_load.htm',
        data: {userId:userId},
        dataType: 'json',
        async: false,
        success: function (data) {
            if (data.result == 1) {
                var user = data.data.user;
                $(".Name").text(user.nickName);
                //$("[name=nickName]").val(user.nickName);
                //$("[name=remark]").val(user.remark);
            } else {
                ajaxCommonResultHandle(data);
            }
        }
    })
}