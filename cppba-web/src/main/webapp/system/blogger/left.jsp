<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="global.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head href="<%=basePath%>" data='${pageContext.request.contextPath}'>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/system/css/style.css?v=<%=version%>">
    <script type="text/javascript" src="${pageContext.request.contextPath}/system/js/jquery-1.11.1.min.js?v=<%=version%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/system/js/globals.js?v=<%=version%>"></script>
    <script type="text/javascript">
    $(function(){
        //导航切换
        $(".menuson li").click(function(){
            $(".menuson li.active").removeClass("active")
            $(this).addClass("active");
        });

        $('.title').click(function(){
            var $ul = $(this).next('ul');
            $('dd').find('ul').slideUp();
            if($ul.is(':visible')){
                $(this).next('ul').slideUp();
            }else{
                $(this).next('ul').slideDown();
            }
        });
    })
    </script>
</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>管理后台</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="../images/leftico01.png" /></span>基本设置
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="user_edit.jsp" target="rightFrame">个人资料</a><i></i></li>
        <li><cite></cite><a href="article_class_list.jsp" target="rightFrame">文章类别</a><i></i></li>
            <li><cite></cite><a href="article_list.jsp" target="rightFrame">文章列表</a><i></i></li>
        </ul>    
    </dd>

    <%--<dd><div class="title"><span><img src="../images/leftico04.png" /></span>日期管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="#">自定义</a><i></i></li>
        <li><cite></cite><a href="#">常用资料</a><i></i></li>
        <li><cite></cite><a href="#">信息列表</a><i></i></li>
        <li><cite></cite><a href="#">其他</a><i></i></li>
    </ul>
    
    </dd>   --%>
    
    </dl>
</body>
</html>
