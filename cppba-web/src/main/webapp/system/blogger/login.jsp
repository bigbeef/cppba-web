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
    <script type="text/javascript" src="${pageContext.request.contextPath}/system/js/cloud.js?v=<%=version%>"></script>
    <script language="javascript">
        $(function(){
            //css动画
            $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
            $(window).resize(function(){
                $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
            })
            //更换验证码
            $("#imgAuthCode").click(function(){
                $(this).attr("src",getPath()+"/auth_image.htm?v="+Math.random());
            })
        });
    </script>
</head>
<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">

<div id="mainBody">
    <div id="cloud1" class="cloud"></div>
    <div id="cloud2" class="cloud"></div>
</div>

<div class="logintop">
    <span>欢迎登录后台管理界面平台</span>
    <ul>
        <li><a href="#">回首页</a></li>
        <li><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
    </ul>
</div>
<div class="loginbody">
    <span class="systemlogo" style="display:block;"></span>
    <div class="loginbox">
        <form action="login_system.htm" method="post" id="form">
            <ul>
                <li><input name="userName" type="text" class="loginuser" placeholder="账号"/></li>
                <li><input name="password" type="password" class="loginpwd" placeholder="密码"/></li>
                <li>
                    <label style="font-size: 16px;padding-left: 0px;">
                        <input name="authCode" class="logincode" placeholder="验证码"/>
                        <img id="imgAuthCode" src="${pageContext.request.contextPath}/auth_image.htm" style="width: 80px;height: 40px;margin-bottom: -15px;"/>
                    </label>
                    <input name="" type="button" class="loginbtn" value="登录"  onclick="javascript:$('#form').submit()"  />
                    <br/><label style="color: red;font-size: 16px;">${error}</label>
                    <%--<label><input name="" type="checkbox" value="" checked="checked" />记住密码</label>
                    <label><a href="#">忘记密码？</a></label></li>--%>
                </li>
            </ul>
        </form>
    </div>
</div>
<div class="loginbm">版权所有  2016  cppba.com 仅供学习交流，勿用于任何商业用途</div>
</body>
</html>
