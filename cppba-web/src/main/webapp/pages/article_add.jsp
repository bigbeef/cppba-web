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

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css?v=<%=version%>">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/select.css?v=<%=version%>"  />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/editormd.css?v=<%=version%>" />
    <style type="text/css">
        #markdown select{opacity:1;filter:alpha(opacity=1);}
        #markdown li{margin-bottom: 0px;}
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js?v=<%=version%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/globals.js?v=<%=version%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/select-ui.min.js?v=<%=version%>"></script>
    <script src="${pageContext.request.contextPath}/js/editormd.min.js?v=<%=version%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/article_add.js?v=<%=version%>"></script>

</head>

<body>
<input id="userId" type="hidden" value="${user.userId}"/>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">基本设置</a></li>
        <li><a href="#">文章列表</a></li>
        <li><a href="#">文章新增</a></li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>文章新增</span></div>

    <ul class="forminfo">
        <li><label>文章类别</label>
            <div class="usercity">
                <select class="select2" id="article_class">
                   <%-- <option>UI设计师</option>
                    <option>交互设计师</option>
                    <option>前端设计师</option>
                    <option>网页设计师</option>
                    <option>Flash动画</option>
                    <option>视觉设计师</option>
                    <option>插画设计师</option>
                    <option>美工</option>
                    <option>其他</option>--%>
                </select>
            </div>
        </li>
        <li><label>文章标题</label><input id="title" name="" type="text" class="dfinput"/><i>标题不能超过30个字符</i></li>
        <li><label>文章简介</label>
            <textarea id="abstracts" name="" cols="" rows="" class="textinput"></textarea><i>用于首页展示</i>
        </li>
        <li><label>文章内容</label><%--<textarea name="" cols="" rows="" class="textinput"></textarea>--%>
            <div style="height: 750px;">
                <div style="margin-left: -86px;">
                    <div id="markdown"></div>
                </div>
            </div>
        </li>
        <li><label>&nbsp;</label><input id="submit" name="" type="button" class="btn" value="确认保存"/></li>
    </ul>
</div>
</body>
</html>
