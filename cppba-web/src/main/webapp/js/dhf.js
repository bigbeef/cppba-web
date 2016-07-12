
//添加了dhf_move_div的窗口可移动
//div_tip_top表示点击区域
$(function(){
    $(".dhf_move_div").each(function(){
        new div_top_move($(this));
    })
})

//移动div
var div_top_move =function(id){
    this.div_mousedown = 0;
    this.click_x = 0;
    this.click_y = 0;
    this.div_old_x = 0;
    this.div_old_y = 0;
    id.find(".div_tip_top").mousedown(function(e){
        this.click_x = e.pageX;
        this.click_y = e.pageY;
        this.div_old_x = id.offset().left;
        this.div_old_y = id.offset().top;
        this.div_mousedown = 1;
    })
    id.find(".div_tip_top").mouseup(function(){
        this.div_mousedown = 0;
    })
    id.find(".div_tip_top").mousemove(function(e){
        var x = e.pageX;
        var y = e.pageY;
        if(this.div_mousedown == 1){
            var left = x - this.click_x;
            var top = y - this.click_y;
            id.css("left",this.div_old_x+left);
            id.css("top",this.div_old_y+top);
        }
    })
}