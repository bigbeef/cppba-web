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
    <title>大黄蜂博客</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/blog/css/editormd.css?v=<%=version%>" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/blog/css/planeui.min.css?v=<%=version%>" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/blog/css/style.css?v=<%=version%>" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/blog/js/jquery-1.8.0.js?v=<%=version%>"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/blog/js/globals.js?v=<%=version%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/blog/js/js.js?v=<%=version%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/blog/js/article.js?v=<%=version%>"></script>
</head>
<body>
<div id="markdown" style="display: none;"></div>
  <div class="wapper">
      <%@include file="header.jsp"%>
      <div class="cppba_container">
          <div class="main">
				<div class="articleTitle"><%--如何制作微课系列——（第一天）微课选题怎么玩？--%></div>
				<div class="articleContent">
					<%--为什么要用反射机制？直接创建对象不就可以了吗，这就涉及到了动态与静态的概念
					静态编译：在编译时确定类型，绑定对象,即通过。
					动态编译：运行时确定类型，绑定对象。动态编译最大限度发挥了java的灵活性，体现了多态的应用，有以降低类之间的藕合性。
					优点
					可以实现动态创建对象和编译，体现出很大的灵活性，特别是在J2EE的开发中它的灵活性就表现的十分明显。比如，一个大型的软件，不可能一次就把把它设计的很完美，当这个程序编译后，发布了，当发现需要更新某些功能时，我们不可能要用户把以前的卸载，再重新安装新的版本，假如这样的话，这个软件肯定是没有多少人用的。采用静态的话，需要把整个程序重新编译一次才可以实现功能的更新，而采用反射机制的话，它就可以不用卸载，只需要在运行时才动态的创建和编译，就可以实现该功能。
					缺点
					对性能有影响。使用反射基本上是一种解释操作，我们可以告诉JVM，我们希望做什么并且它满足我们的要求。这类操作总是慢于只直接执行相同的操作。
					为什么要用反射机制？直接创建对象不就可以了吗，这就涉及到了动态与静态的概念
					静态编译：在编译时确定类型，绑定对象,即通过。
					动态编译：运行时确定类型，绑定对象。动态编译最大限度发挥了java的灵活性，体现了多态的应用，有以降低类之间的藕合性。
					优点
					可以实现动态创建对象和编译，体现出很大的灵活性，特别是在J2EE的开发中它的灵活性就表现的十分明显。比如，一个大型的软件，不可能一次就把把它设计的很完美，当这个程序编译后，发布了，当发现需要更新某些功能时，我们不可能要用户把以前的卸载，再重新安装新的版本，假如这样的话，这个软件肯定是没有多少人用的。采用静态的话，需要把整个程序重新编译一次才可以实现功能的更新，而采用反射机制的话，它就可以不用卸载，只需要在运行时才动态的创建和编译，就可以实现该功能。
					缺点
					对性能有影响。使用反射基本上是一种解释操作，我们可以告诉JVM，我们希望做什么并且它满足我们的要求。这类操作总是慢于只直接执行相同的操作。
					为什么要用反射机制？直接创建对象不就可以了吗，这就涉及到了动态与静态的概念
					静态编译：在编译时确定类型，绑定对象,即通过。
					动态编译：运行时确定类型，绑定对象。动态编译最大限度发挥了java的灵活性，体现了多态的应用，有以降低类之间的藕合性。
					优点
					可以实现动态创建对象和编译，体现出很大的灵活性，特别是在J2EE的开发中它的灵活性就表现的十分明显。比如，一个大型的软件，不可能一次就把把它设计的很完美，当这个程序编译后，发布了，当发现需要更新某些功能时，我们不可能要用户把以前的卸载，再重新安装新的版本，假如这样的话，这个软件肯定是没有多少人用的。采用静态的话，需要把整个程序重新编译一次才可以实现功能的更新，而采用反射机制的话，它就可以不用卸载，只需要在运行时才动态的创建和编译，就可以实现该功能。
					缺点
					对性能有影响。使用反射基本上是一种解释操作，我们可以告诉JVM，我们希望做什么并且它满足我们的要求。这类操作总是慢于只直接执行相同的操作。
					为什么要用反射机制？直接创建对象不就可以了吗，这就涉及到了动态与静态的概念
					静态编译：在编译时确定类型，绑定对象,即通过。
					动态编译：运行时确定类型，绑定对象。动态编译最大限度发挥了java的灵活性，体现了多态的应用，有以降低类之间的藕合性。
					优点
					可以实现动态创建对象和编译，体现出很大的灵活性，特别是在J2EE的开发中它的灵活性就表现的十分明显。比如，一个大型的软件，不可能一次就把把它设计的很完美，当这个程序编译后，发布了，当发现需要更新某些功能时，我们不可能要用户把以前的卸载，再重新安装新的版本，假如这样的话，这个软件肯定是没有多少人用的。采用静态的话，需要把整个程序重新编译一次才可以实现功能的更新，而采用反射机制的话，它就可以不用卸载，只需要在运行时才动态的创建和编译，就可以实现该功能。
					缺点
					对性能有影响。使用反射基本上是一种解释操作，我们可以告诉JVM，我们希望做什么并且它满足我们的要求。这类操作总是慢于只直接执行相同的操作。--%>
				</div>

              <div id="comment" style="background-color: white;padding: 1em 4%;">

              </div>

				<div class="articleHandle">
					<div class="articleShare">
					    <div class="SharePic">
						    <img src="${pageContext.request.contextPath}/blog/images/fx.png"/>
						    <div class="Tweet"></div>
						    <div class="WeChat"></div>
						    <div class="Renren"></div>
						</div>
						<img src="${pageContext.request.contextPath}/blog/images/wz.png"/>
						<a class="CurrentArticle" href="#">Java基础与提高干货系列</a>
					</div>
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
<%@include file="footer.jsp"%>
</body>
</html>