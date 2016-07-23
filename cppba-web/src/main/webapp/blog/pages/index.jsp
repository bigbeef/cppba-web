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
	<title>博客</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/blog/css/bootstrap.min.css?v=<%=version%>">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/blog/css/style.css?v=<%=version%>" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/blog/js/jquery-1.8.0.js?v=<%=version%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/blog/js/globals.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/blog/js/jqPaginator.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/blog/js/js.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/blog/js/index.js"></script>
</head>
<body>
  <div class="wapper">
	  <%@include file="header.jsp"%>
      <div class="cppba_container">
          <div class="main">
				<section class="post" itemscope="" itemprop="blogitem">
				    <a href="#" title="如何制作微课系列——（第一天）微课选题怎么玩？" itemprop="url">
				    <h1 itemprop="name">如何制作微课系列——（第一天）微课选题怎么玩？</h1>
				        <p itemprop="description">首页今天第一次接触微课，还是蛮新鲜的，非常感谢公司举办的这个活动，自己也有幸参与进来。今天是第一天，王发松老师给我们带来的精彩课程——《微课选题怎么玩》。下面是个人整理的课后笔记，希望对您有用。
				        自己也有幸参与进来。今天是第一天，王发松老师给我们带来的精彩课程——《微课选题怎么玩》。下面是个人整理的课后笔记，希望对您有用。
				        自己也有幸参与进来。今天是第一天，王发松老师给我们带来的精彩课程——《微课选题怎么玩》。下面是个人整理的课后笔记，希望对您有用。
							正文一个好的微课选题要怎么包装，老师介绍需要以下3个步骤

							常见误区
							选题方法
							让课
						</p>
				    <time datetime="2016-05-24T08:20:48.000Z" itemprop="datePublished">2016-05-24</time>
				  </a>
				</section>
				<section class="post" itemscope="" itemprop="blogitem">
				    <a href="#" title="如何制作微课系列——（第一天）微课选题怎么玩？" itemprop="url">
				    <h1 itemprop="name">如何制作微课系列——（第一天）微课选题怎么玩？</h1>
				        <p itemprop="description">首页今天第一次接触微课，还是蛮新鲜的，非常感谢公司举办的这个活动，自己也有幸参与进来。今天是第一天，王发松老师给我们带来的精彩课程——《微课选题怎么玩》。下面是个人整理的课后笔记，希望对您有用。
							正文一个好的微课选题要怎么包装，老师介绍需要以下3个步骤

							常见误区
							选题方法
							让课
						</p>
				    <time datetime="2016-05-24T08:20:48.000Z" itemprop="datePublished">2016-05-24</time>
				  </a>
				</section>
				<section class="post" itemscope="" itemprop="blogitem">
				    <a href="#" title="如何制作微课系列——（第一天）微课选题怎么玩？" itemprop="url">
				    <h1 itemprop="name">如何制作微课系列——（第一天）微课选题怎么玩？</h1>
				        <p itemprop="description">首页今天第一次接触微课，还是蛮新鲜的，非常感谢公司举办的这个活动，自己也有幸参与进来。今天是第一天，王发松老师给我们带来的精彩课程——《微课选题怎么玩》。下面是个人整理的课后笔记，希望对您有用。
							正文一个好的微课选题要怎么包装，老师介绍需要以下3个步骤

							常见误区
							选题方法
							让课
						</p>
				    <time datetime="2016-05-24T08:20:48.000Z" itemprop="datePublished">2016-05-24</time>
				  </a>
				</section>

				<%--<div class="SwiperBtnBox">
					<div class="prev">Prev</div>
					<div class="Next">Next</div>
					<ul class="SwiperUl">
					     <li>1</li>
					     <li>2</li>
					     <li>3</li>
					</ul>
				</div>--%>
              <div class="page_div">
                  <ul class="pagination" id="pagination"></ul>
              </div>
          </div>
          <div class="asidepart">
              <ul class="mainMenu">
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
              </ul>
          </div>
      </div>
      <div class="footer"></div>
  </div>
</body>
</html>