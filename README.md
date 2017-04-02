#个人博客

  项目地址:https://github.com/bigbeef/cppba-web
  
  SpringMVC  + Hibernate + Shiro 全程注解实现的个人博客发布和展示系统，
javaEE的开发者可以当做学习项目，欢迎大家提出意见，邮箱:245655812@qq.com

注:

  1.数据库在cppba-web/src/main/webapp/resources/cppba.sql;
  
  2.后台登录地址为(以本地tomcat为例):http://127.0.0.1:8080/cppba-web/login.htm;

## 打包
```$xslt
//开发环境打包
mvn clean package -DskipTests -Denv=dev

//正式环境打包
mvn clean package -DskipTests -Denv=online

```
 	
[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/bigbeef/cppba-web)
