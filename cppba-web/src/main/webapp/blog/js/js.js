$(function(){
	$(".mainMenuTitle").bind("click",function(){
		//alert($(this).parent().height());
		//var length = $(this).next().find("li").length * 40 + 50;
		//alert(length);
		if($(this).parent().height() == 50){
			$(this).parent().animate({height:$(this).next().find("li").length * 40 + 50 + "px"});
		} else{
			$(this).parent().animate({height:"50px"});
		}
		//alert(lenght);
		/*if($(this).parent().height() == 50){
			$(this).parent().css({"height":"auto"});
		} else{
			$(this).parent().css({"height":"50px"});
		}*/
	});
})