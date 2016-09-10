<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.cppba.entity.Articles" %>
<%@ page import="com.cppba.entity.ArticleClass" %>
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
	<title>${user.title}</title>
    <meta name="keywords" content="${user.keyword}"/>
    <meta name="description" content="${user.description}"/>
    <link rel="stylesheet" type="text/css" href="${webPath}/blog/css/bootstrap.min.css?v=<%=version%>">
    <link rel="stylesheet" type="text/css" href="${webPath}/blog/css/style.css?v=<%=version%>" />
    <script type="text/javascript" src="${webPath}/blog/js/jquery-1.8.0.js?v=<%=version%>"></script>
    <script type="text/javascript" src="${webPath}/blog/js/globals.js"></script>
    <script type="text/javascript" src="${webPath}/blog/js/jqPaginator.js" ></script>
    <script type="text/javascript" src="${webPath}/blog/js/js.js"></script>
	<script type="text/javascript" src="${webPath}/blog/js/index.js"></script>
    <script type="application/javascript">
        var page = ${page};
        var pageSize = ${pageSize};
        var count = ${count};
    </script>
</head>
<body>
  <div class="wapper">
	  <%@include file="header.jsp"%>
      <div class="cppba_container">
          <div class="main">
              <%
                  List list = (List) request.getAttribute("articles");
                  for (int i = 0; i < list.size(); i++) {
                      Map map = (Map) list.get(i);
                      Articles articles = (Articles) map.get("article");
              %>
              <section class="post" itemscope="" itemprop="blogitem" articleid="<%=articles.getArticleId()%>">
                  <h1 itemprop="name"><%=articles.getTitle()%></h1>
                  <p itemprop="description"> <%=articles.getAbstracts()%></p>
                  <time datetime="<%=articles.getAddTime()%>" itemprop="datePublished"><%=articles.getAddTime()%></time>
              </section>
              <%}%>
              <div class="page_div">
                  <ul class="pagination" id="pagination"></ul>
              </div>
          </div>
          <div class="asidepart">
              <ul class="mainMenu">
                  <li>
                      <div class="mainMenuTitle" articleClassId="0">全部</div>
                  </li>
                  <%
                      List<ArticleClass> articleClassList = (List) request.getAttribute("articleClasses");
                      for (ArticleClass articleClass : articleClassList) {
                  %>
                      <li>
                          <div class="mainMenuTitle" articleClassId="<%=articleClass.getArticleClassId()%>"><%=articleClass.getName()%></div>
                      </li>
                  <%}%>
                  <%--<li>
                      <div class="mainMenuTitle">Java基础与提高干货系列Java基础与提高干货系列Java基础与提高干货系列</div>
                      <ul class="innerMenu">
                      	 <li><a href="#">分类一Java基础与提高干货系列Java基础与提高干货系列</a></li>
                      	 <li><a href="#">分类一</a></li>
                      	 <li><a href="#">分类一</a></li>
                      	 <li><a href="#">分类一</a></li>
                      </ul>
                  </li>
                  <li>
                      <div class="mainMenuTitle">Java基础与提高干货系列Java基础与提高干货系列Java基础与提高干货系列</div>
                      <ul class="innerMenu">
                      	 <li><a href="#">分类一Java基础与提高干货系列Java基础与提高干货系列</a></li>
                      	 <li><a href="#">分类一</a></li>
                      	 <li><a href="#">分类一</a></li>
                      	 <li><a href="#">分类一</a></li>
                      </ul>
                  </li>
                  <li>
                      <div class="mainMenuTitle">Java基础与提高干货系列Java基础与提高干货系列Java基础与提高干货系列</div>
                      <ul class="innerMenu">
                      	 <li><a href="#">分类一Java基础与提高干货系列Java基础与提高干货系列</a></li>
                      	 <li><a href="#">分类一</a></li>
                      	 <li><a href="#">分类一</a></li>
                      	 <li><a href="#">分类一</a></li>
                      </ul>
                  </li>--%>
              </ul>
              <div class="cppba_linkslist">
                  <p class="asidetitle">友情链接</p>
                  <ul>
                      <li>
                          <a href="http://crossoverjie.top" target="_blank" title="crossoverjie">crossoverjie</a>
                      </li>
                  </ul>
              </div>
          </div>
      </div>
      <div class="footer"></div>
  </div>
  <%@include file="footer.jsp"%>
</body>
</html>