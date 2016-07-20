<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@include file="global.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head href="<%=basePath%>" data='${pageContext.request.contextPath}'>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/system/css/style.css?v=<%=version%>">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/system/js/jquery-1.11.1.min.js?v=<%=version%>"></script>
    <script language="javascript">
        $(function () {
            $('.error403').css({'position': 'absolute', 'left': ($(window).width() - 490) / 2});
            $(window).resize(function () {
                $('.error403').css({'position': 'absolute', 'left': ($(window).width() - 490) / 2});
            })
        });
    </script>

</head>


<body style="background:#edf6fa;">

<%--<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">403错误提示</a></li>
    </ul>
</div>--%>

<div class="error403">

    <h2>非常遗憾，您无权访问该页面！</h2>
    <p>看到这个提示，就自认倒霉吧!</p>
    <%--<div class="reindex"><a href="main.html" target="_parent">返回首页</a></div>--%>

</div>
</body>
</html>
