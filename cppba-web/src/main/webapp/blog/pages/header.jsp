<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/blog/js/header.js"></script>
<div class="header">
    <div class="headCenter">
        <div class="headPortrait">
            <a href="#">
                <%--<img src="${pageContext.request.contextPath}/blog/images/bg2.gif"/>--%>
                <img src="${pageContext.request.contextPath}/blog/images/headImg.png"/>
            </a>
        </div>
        <div class="BloggerName">
            <h1 class="Name">大黄蜂</h1>
            <h1 class="sendWord">爱编程爱生活</h1>
        </div>

        <nav class="animated">
            <ul>

                <li><a href="${pageContext.request.contextPath}/index.htm">首页</a></li>

                <li><a href="#">归档</a></li>

                <li><a href="#">分类</a></li>

                <li><a href="#">时光机</a></li>

                <li><a href="${pageContext.request.contextPath}/system/blogger/main.jsp">登陆</a></li>
                <li>
                    <!-- autocomplete="off" 关闭自动填充 -->
                    <form class="search">
                        <label>Search</label>
                        <input type="text" id="search" class="st-default-search-input" maxlength="20"
                               placeholder="Search">
                    </form>

                </li>
            </ul>
        </nav>
    </div>
</div>