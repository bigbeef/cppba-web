<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head href="<%=basePath%>" data='${pageContext.request.contextPath}'>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/select.css"  />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/Globals.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/select-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/article_add.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/epic_editor/js/epiceditor.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(e) {
            $(".select2").uedSelect({
                width : 167
            });
            //教程地址   http://epiceditor.com/
            var opts = {
                container: 'epiceditor',
                textarea: null,
                basePath: 'epiceditor',
                clientSideStorage: true,
                localStorageName: 'epiceditor',
                useNativeFullscreen: true,
                parser: marked,
                file: {
                    name: 'epiceditor',
                    defaultContent: '',
                    autoSave: 100
                },
                theme: {
                    base: getPath()+'/epic_editor/themes/base/epiceditor.css',
                    preview:  getPath()+'/epic_editor/themes/preview/preview-dark.css',
                    editor:  getPath()+'/epic_editor/themes/editor/epic-dark.css'
                },
                button: {
                    preview: true,
                    fullscreen: true,
                    bar: "auto"
                },
                focusOnLoad: false,
                shortcut: {
                    modifier: 18,
                    fullscreen: 70,
                    preview: 80
                },
                string: {
                    togglePreview: 'Toggle Preview Mode',
                    toggleEdit: 'Toggle Edit Mode',
                    toggleFullscreen: 'Enter Fullscreen'
                },
                autogrow: {
                    minHeight:500, 
                    maxHeight:800
                }
            }
            var editor = new EpicEditor(opts).load();
        });
    </script>
</head>

<body>

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
        <li><label>文章标题</label><input name="" type="text" class="dfinput"/><i>标题不能超过30个字符</i></li>
        <li><label>文章简介</label>
            <textarea name="" cols="" rows="" class="textinput"></textarea><i>用于首页展示</i>
        </li>
        <li><label>文章内容</label><%--<textarea name="" cols="" rows="" class="textinput"></textarea>--%>
            <div style="height: 800px;">
                <div id="epiceditor"></div>
            </div>
        </li>
        <li><label>&nbsp;</label><input name="" type="button" class="btn" value="确认保存"/></li>
    </ul>
</div>
</body>
</html>
