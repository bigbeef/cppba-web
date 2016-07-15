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
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/style.css?v=<%=version%>">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/select.css?v=<%=version%>" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js?v=<%=version%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/globals.js?v=<%=version%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/article_class_list.js?v=<%=version%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/dhf.js?v=<%=version%>"></script>
</head>

<body>
<input id="userId" type="hidden" value="${user.userId}"/>
    <div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">基本设置</a></li>
        <li><a href="#">文章类别</a></li>
    </ul>
    </div>

    <div class="formbody">

        <div class="formtitle"><span>文章类别</span></div>

        <div id="usual1" class="usual">
            <ul class="seachform">
                <li><label>类别查询</label><input id="likeName" name="" type="text" class="scinput" /></li>
                <li><label>&nbsp;</label><input id="search" type="button" class="scbtn" value="查询"/></li>
                <li><label>&nbsp;</label><input id="add" type="button" class="scbtn" value="新增"/></li>
            </ul>

            <table class="tablelist">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>标题</th>
                    <th>发布时间</th>
                    <th>序号</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="article_class">
                    <%--<tr>
                        <td>1</td>
                        <td>技术</td>
                        <td>2016-07-01 23:11:24</td>
                        <td>1</td>
                        <td><a href="#" onclick="load_articleClass(1)" class="tablelink">编辑</a>
                            <a href="#" onclick="delete_articleClass(1)" class="tablelink">删除</a>
                        </td>
                    </tr>--%>
                </tbody>
            </table>
        </div>
    </div>
    <div class="tip dhf_move_div" id="add_div">
        <div class="tiptop div_tip_top" id="div_top"><span>新增类别</span><a id="cancel_btn"></a></div>
        <div class="tipinfo">
            <input type="hidden" id="articleClassId"/>
            <li style="margin-bottom:13px;">
                <label style="width:86px;float:left;line-height:34px;">类别名称</label>
                <input id="name" type="text" class="scinput" />
            </li>
            <li style="margin-bottom:13px;">
                <label style="width:86px;float:left;line-height:34px;">序号</label>
                <input id="sortId" type="text" class="scinput" />
            </li>
        </div>

        <div class="tipbtn">
            <input id="add_submit" type="button"  class="sure" value="确定" />&nbsp;
            <input id="cancel" type="button"  class="cancel" value="取消" />
        </div>

    </div>
</body>
</html>
