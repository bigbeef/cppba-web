<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.cppba.entity.User" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=<%=version%>">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js?v=<%=version%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/globals.js?v=<%=version%>"></script>
    <script type="text/javascript">
    $(function(){
        //顶部导航切换
        $(".nav li a").click(function(){
            $(".nav li a.selected").removeClass("selected")
            $(this).addClass("selected");
        })
    })
    </script>
</head>

<body style="background:url(../images/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="main.jsp" target="_parent"><img src="../images/logo.png" title="系统首页" /></a>
    </div>
        
    <ul class="nav">
    <%--<li><a href="default.html" target="rightFrame" class="selected"><img src="../images/icon01.png" title="工作台" /><h2>工作台</h2></a></li>
    <li><a href="imgtable.html" target="rightFrame"><img src="../images/icon02.png" title="模型管理" /><h2>模型管理</h2></a></li>
    <li><a href="imglist.html"  target="rightFrame"><img src="../images/icon03.png" title="模块设计" /><h2>模块设计</h2></a></li>
    <li><a href="tools.html"  target="rightFrame"><img src="../images/icon04.png" title="常用工具" /><h2>常用工具</h2></a></li>
    <li><a href="computer.html" target="rightFrame"><img src="../images/icon05.png" title="文件管理" /><h2>文件管理</h2></a></li>
    <li><a href="tab.html"  target="rightFrame"><img src="../images/icon06.png" title="系统设置" /><h2>系统设置</h2></a></li>--%>
    </ul>
            
    <div class="topright">    
    <ul>
    <li><span><img src="../images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a href="${pageContext.request.contextPath}/login.htm" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span>${user.nickName}</span>
    <%--<i>消息</i>
    <b>5</b>--%>
    </div>    
    
    </div>
</body>
</html>
