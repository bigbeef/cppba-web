<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=<%=version%>">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js?v=<%=version%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/globals.js?v=<%=version%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.idTabs.min.js?v=<%=version%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/select-ui.min.js?v=<%=version%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor.js?v=<%=version%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user_edit.js?v=<%=version%>"></script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">基本设置</a></li>
    <li><a href="#">个人资料</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    
    <u class="forminfo">
        <input type="hidden" name="userId" value="${user.userId}"/>
    <li><label>昵称</label><input name="nickName" type="text" class="dfinput" /><i>昵称不能超过16个字符</i></li>
    <li><label>个人简介</label><textarea id="content7" name="remark" style="width:700px;height:250px;visibility:hidden;"></textarea></li>
    <li><label>&nbsp;</label><input  type="button" class="btn" value="确认保存" id="submit"/></li>
    </ul>
    
    
    </div>
</body>
</html>
