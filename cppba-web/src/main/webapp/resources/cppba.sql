/*
Navicat MySQL Data Transfer

Source Server         : www.cppba.com
Source Server Version : 50713
Source Host           : www.cppba.com:3306
Source Database       : cppba

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-07-21 21:49:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article_class
-- ----------------------------
DROP TABLE IF EXISTS `article_class`;
CREATE TABLE `article_class` (
  `article_class_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_status` int(11) DEFAULT '0',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `name` varchar(16) DEFAULT NULL COMMENT '分类名',
  `sort_id` int(11) DEFAULT '0' COMMENT '编号',
  PRIMARY KEY (`article_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_class
-- ----------------------------
INSERT INTO `article_class` VALUES ('1', '2016-07-14 14:48:23', '0', '1', 'spring', '0');
INSERT INTO `article_class` VALUES ('5', '2016-07-14 16:14:16', '0', '1', 'centos', '1');
INSERT INTO `article_class` VALUES ('7', '2016-07-21 20:56:51', '0', '1', 'java善假于物', '3');

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `article_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_status` int(11) DEFAULT '0',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `article_class_id` bigint(20) DEFAULT NULL COMMENT '文章分类编号',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `abstracts` text COMMENT '简介(显示在列表中)',
  `content` text COMMENT '内容',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('1', '2016-07-14 14:48:28', '0', '1', '1', 'spring-boot使用教程(一)：让程序跑起来', 'spring-boot是由[Pivotal](http://gopivotal.com/)团队提供的全新框架，其设计目的是用来简化新Spring应用的初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。通过这种方式，Boot致力于在蓬勃发展的快速应用开发领域（rapid application development）成为领导者。', '## 简介\nspring-boot是由[Pivotal](http://gopivotal.com/)团队提供的全新框架，其设计目的是用来简化新Spring应用的初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。通过这种方式，Boot致力于在蓬勃发展的快速应用开发领域（rapid application development）成为领导者。\n\n##文件结构\n\n![https://github.com/bigbeef/cppba-spring-boot](http://image.cppba.com/Image/article/672c18ed-cb3c-477f-8cb0-d4ef387a7082.png)\n\n## 1.maven的pom.xml配置\n````maven\n<project xmlns=\"http://maven.apache.org/POM/4.0.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n         xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd\">\n    <modelVersion>4.0.0</modelVersion>\n\n    <groupId>com.cppbba</groupId>\n    <artifactId>cppba-spring-boot</artifactId>\n    <packaging>war</packaging>\n    <version>1.0.0</version>\n\n    <name>cppba-spring-boot Maven Webapp</name>\n    <url>http://maven.apache.org</url>\n\n    <parent>\n        <groupId>org.springframework.boot</groupId>\n        <artifactId>spring-boot-starter-parent</artifactId>\n        <version>1.3.6.RELEASE</version>\n    </parent>\n\n    <properties>\n        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>\n        <jdk.version>1.7</jdk.version>\n        <spring.version>4.3.0.RELEASE</spring.version>\n        <hibernate.version>4.3.11.Final</hibernate.version>\n    </properties>\n\n    <dependencies>\n        <!--spring-->\n        <dependency>\n            <groupId>org.springframework.boot</groupId>\n            <artifactId>spring-boot-starter-web</artifactId>\n        </dependency>\n        <dependency>\n            <groupId>org.springframework.boot</groupId>\n            <artifactId>spring-boot-starter-test</artifactId>\n        </dependency>\n        <dependency>\n            <groupId>org.springframework.boot</groupId>\n            <artifactId>spring-boot-starter-jdbc</artifactId>\n        </dependency>\n        <dependency>\n            <groupId>org.springframework</groupId>\n            <artifactId>spring-orm</artifactId>\n        </dependency>\n        <!--mysql-->\n        <dependency>\n            <groupId>mysql</groupId>\n            <artifactId>mysql-connector-java</artifactId>\n        </dependency>\n        <!-- hibernate-->\n        <dependency>\n            <groupId>org.hibernate</groupId>\n            <artifactId>hibernate-entitymanager</artifactId>\n            <version>${hibernate.version}</version>\n        </dependency>\n        <!--druid-->\n        <dependency>\n            <groupId>com.alibaba</groupId>\n            <artifactId>druid</artifactId>\n            <version>1.0.20</version>\n        </dependency>\n    </dependencies>\n\n    <build>\n        <finalName>cppba-spring-boot</finalName>\n        <plugins>\n            <plugin>\n                <groupId>org.springframework.boot</groupId>\n                <artifactId>spring-boot-maven-plugin</artifactId>\n            </plugin>\n        </plugins>\n    </build>\n</project>\n````\n## 2.创建Application.java\n````java\npackage com.cppba;\n\nimport org.springframework.boot.SpringApplication;\nimport org.springframework.boot.autoconfigure.SpringBootApplication;\nimport org.springframework.core.env.Environment;\n\nimport java.net.UnknownHostException;\n\n// same as @Configuration @EnableAutoConfiguration @ComponentScan\n@SpringBootApplication\npublic class Application {\n    public static void main(String[] args) throws UnknownHostException {\n        SpringApplication app = new SpringApplication(Application.class);\n        Environment environment = app.run(args).getEnvironment();\n    }\n}\n````\n\n##3.创建DatabaseConfiguration.java\n````java\npackage com.cppba.config;\n\nimport com.alibaba.druid.pool.DruidDataSource;\nimport org.springframework.boot.bind.RelaxedPropertyResolver;\nimport org.springframework.context.ApplicationContextException;\nimport org.springframework.context.EnvironmentAware;\nimport org.springframework.context.annotation.Bean;\nimport org.springframework.context.annotation.Configuration;\nimport org.springframework.core.env.Environment;\nimport org.springframework.orm.hibernate4.HibernateTransactionManager;\nimport org.springframework.orm.hibernate4.LocalSessionFactoryBean;\nimport org.springframework.transaction.annotation.EnableTransactionManagement;\nimport org.springframework.util.StringUtils;\n\nimport javax.sql.DataSource;\nimport java.sql.SQLException;\nimport java.util.Arrays;\nimport java.util.Properties;\n\n@Configuration\n@EnableTransactionManagement\npublic class DatabaseConfiguration implements EnvironmentAware {\n\n    private Environment environment;\n    private RelaxedPropertyResolver datasourcePropertyResolver;\n\n    //从application.yml中读取资源\n    @Override\n    public void setEnvironment(Environment environment) {\n        this.environment = environment;\n        this.datasourcePropertyResolver = new RelaxedPropertyResolver(environment,\n                \"spring.datasource.\");\n    }\n\n    //datasource\n    @Bean(initMethod = \"init\", destroyMethod = \"close\")\n    public DataSource dataSource() throws SQLException {\n        if (StringUtils.isEmpty(datasourcePropertyResolver.getProperty(\"url\"))) {\n            System.out.println(\"Your database connection pool configuration is incorrect!\" +\n                    \" Please check your Spring profile, current profiles are:\"+\n            Arrays.toString(environment.getActiveProfiles()));\n            throw new ApplicationContextException(\n                    \"Database connection pool is not configured correctly\");\n        }\n        DruidDataSource druidDataSource = new DruidDataSource();\n        druidDataSource.setUrl(datasourcePropertyResolver.getProperty(\"url\"));\n        druidDataSource.setUsername(datasourcePropertyResolver\n                .getProperty(\"username\"));\n        druidDataSource.setPassword(datasourcePropertyResolver\n                .getProperty(\"password\"));\n        druidDataSource.setInitialSize(1);\n        druidDataSource.setMinIdle(1);\n        druidDataSource.setMaxActive(20);\n        druidDataSource.setMaxWait(60000);\n        druidDataSource.setTimeBetweenEvictionRunsMillis(60000);\n        druidDataSource.setMinEvictableIdleTimeMillis(300000);\n        druidDataSource.setValidationQuery(\"SELECT　\'x\'\");\n        druidDataSource.setTestWhileIdle(true);\n        druidDataSource.setTestOnBorrow(false);\n        druidDataSource.setTestOnReturn(false);\n        return druidDataSource;\n    }\n\n    //sessionFactory\n    @Bean\n    public LocalSessionFactoryBean sessionFactory() throws SQLException{\n        LocalSessionFactoryBean localSessionFactoryBean = new LocalSessionFactoryBean();\n        localSessionFactoryBean.setDataSource(this.dataSource());\n        Properties properties1 = new Properties();\n        properties1.setProperty(\"hibernate.dialect\",\"org.hibernate.dialect.MySQL5Dialect\");\n        properties1.setProperty(\"hibernate.show_sql\",\"false\");\n        localSessionFactoryBean.setHibernateProperties(properties1);\n        localSessionFactoryBean.setPackagesToScan(\"*\");\n        return localSessionFactoryBean;\n    }\n\n    //txManager事务开启\n    @Bean\n    public HibernateTransactionManager txManager() throws SQLException {\n        HibernateTransactionManager hibernateTransactionManager = new HibernateTransactionManager();\n        hibernateTransactionManager.setSessionFactory(sessionFactory().getObject());\n        return hibernateTransactionManager;\n    }\n}\n````\n\n##4.创建CommonAction.java(这是一个测试类)\n````java\npackage com.cppba.web;\n\nimport org.hibernate.SQLQuery;\nimport org.hibernate.Session;\nimport org.hibernate.SessionFactory;\nimport org.springframework.transaction.annotation.Transactional;\nimport org.springframework.web.bind.annotation.RequestMapping;\nimport org.springframework.web.bind.annotation.RestController;\n\nimport javax.annotation.Resource;\nimport javax.servlet.http.HttpServletResponse;\nimport java.io.IOException;\nimport java.util.List;\n\n@RestController\n@Transactional\npublic class CommonAction {\n\n    @Resource\n    private SessionFactory sessionFactory;\n\n    @RequestMapping(\"test\")\n    public void test(HttpServletResponse response){\n        Session session = sessionFactory.getCurrentSession();\n        SQLQuery sqlQuery = session.createSQLQuery(\"select * from user\");\n        List list = sqlQuery.list();\n        System.out.printf(list.size()+\"\");\n        try {\n            response.setContentType(\"application/json\");\n            response.setHeader(\"Cache-Control\", \"no-cache\");\n            response.setCharacterEncoding(\"UTF-8\");\n            response.getWriter().write(\"{\\\"msg\\\":\\\"调用成功\\\"}\");\n        } catch (IOException e) {\n            e.printStackTrace();\n        }\n    }\n}\n\n````\n\n##5.创建application.yml\n````json\nserver:\n    port: 8080\n    address: localhost\n\nspring:\n    datasource:\n        url: jdbc:mysql://localhost:3306/cppba\n        username: root\n        password: root\n````\n\n##6.启动项目\n我们点击启动按钮\n![https://github.com/bigbeef/cppba-spring-boot](http://image.cppba.com/Image/article/60bfbf98-bc9b-4621-a5e2-41e7a6772658.png)\n\n控制台会打印如下内容：\n\n![https://github.com/bigbeef/cppba-spring-boot](http://image.cppba.com/Image/article/baa0e47e-9ff6-43ea-839f-5f59de22b6cd.png)\n\n![https://github.com/bigbeef/cppba-spring-boot](http://image.cppba.com/Image/article/734ab22a-cc2b-4a5e-acaa-e6e79792f5ca.png)\n\n启动成功\n接下来我们访问http://127.0.0.1:8080/test\n(我的CommonAction中RequestMapping(\"test\"),所以访问路径是test)\n\n![https://github.com/bigbeef/cppba-spring-boot](http://image.cppba.com/Image/article/77eb1320-647c-4086-ab00-ea68bfed7eb0.png)\n\n到此spring-boot配置成功！\n\n参考资料：https://github.com/bigbeef/cppba-spring-boot');
INSERT INTO `articles` VALUES ('2', '2016-07-14 16:58:11', '0', '1', '5', 'centos下java存储mysql中文乱码', 'centos下java存储mysql中文乱码，在windows下没问题', '## 发现问题\n运行以下sql，我们发现字符集中character_set_server编码为lantin1：\n```mysql\nmysql> show variables like \'character%\';\n+--------------------------+----------------------------+\n| Variable_name            | Value                      |\n+--------------------------+----------------------------+\n| character_set_client     | utf8                       |\n| character_set_connection | utf8                       |\n| character_set_database   | utf8                       |\n| character_set_filesystem | binary                     |\n| character_set_results    | utf8                       |\n| character_set_server     | latin1                     |\n| character_set_system     | utf8                       |\n| character_sets_dir       | /usr/share/mysql/charsets/ |\n+--------------------------+----------------------------+\n```\n## 修改配置文件\n\n在centos命令行输入：\n\n```shell\n>vim /etc/my.cnf\n```\n\n追加如下内容：\n````shell\n[client]\ndefault-character-set=utf8\n\n[mysql]\ndefault-character-set=utf8\n\n[mysqld]\ncharacter-set-server=utf8\n````\n\n然后在在mysql控制台查看：\n```mysql\nmysql> show variables like \'character%\';\n+--------------------------+----------------------------+\n| Variable_name            | Value                      |\n+--------------------------+----------------------------+\n| character_set_client     | utf8                       |\n| character_set_connection | utf8                       |\n| character_set_database   | utf8                       |\n| character_set_filesystem | binary                     |\n| character_set_results    | utf8                       |\n| character_set_server     | utf8                       |\n| character_set_system     | utf8                       |\n| character_sets_dir       | /usr/share/mysql/charsets/ |\n+--------------------------+----------------------------+\n```');
INSERT INTO `articles` VALUES ('3', '2016-07-21 21:29:51', '0', '1', '5', 'centos端口开启', '我们刚开始用centos可能会有这种情况，明明服务器配置好了，为什么外网就是访问不了，这个时候你要考虑是不是你的端口没有打开centos端口开启', '```java\ncentos6：\n\n1.打开80端口：\n/sbin/iptables -I INPUT -p tcp --dport 80 -j ACCEPT\n2.保存设置：\n/etc/rc.d/init.d/iptables save\n3.重启防火墙：\nservice iptables restart\n4.查看防火墙状态：\n/etc/init.d/iptables status\n\ncentos7办法：\n1.// 查看 firewalld\nsystemctl status firewalld.service\n2.// 关闭 firewalld\nsystemctl stop firewalld.service\n3.// 禁止开机启动 firewalld\nsystemctl disable firewalld.service\n4.// 安装 iptables\nyum install iptables-services\n5.// 配置 iptables\nvi /etc/sysconfig/iptables\n-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT\n6.// 重启防火墙\nservice iptables restart\n\n```\n参考资料：https://github.com/bigbeef');
INSERT INTO `articles` VALUES ('4', '2016-07-21 21:39:39', '0', '1', '1', 'spring-boot使用教程(二)：增加自定义filter', '传统的javaEE增加Filter是在web.xml中配置，然而spring-boot中很明显不能这样实现，那怎么办呢？看完下面的教程，答案自然知道了。', '##前言\n传统的javaEE增加Filter是在web.xml中配置，如以下代码：\n````xml\n<filter>\n     <filter-name>TestFilter</filter-name>\n        <filter-class>com.cppba.filter.TestFilter</filter-class>\n</filter>\n<filter-mapping>\n    <filter-name>TestFilter</filter-name>\n    <url-pattern>/*</url-pattern>\n    <init-param>\n       <param-name>paramName</param-name>\n       <param-value>paramValue</param-value>\n    </init-param>\n</filter-mapping>\n````\n然而spring-boot中很明显不能这样实现，那怎么办呢？看完下面的教程，答案自然知道了。\n\n## 1.创建自定义Filter\n````java\npackage com.cppba.filter;\n\nimport javax.servlet.*;\nimport java.io.IOException;\n\npublic class TestFilter implements Filter {\n    @Override\n    public void init(FilterConfig filterConfig) throws ServletException {\n\n    }\n\n    @Override\n    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)\n            throws IOException, ServletException {\n        System.out.println(\"TestFilter\");\n    }\n\n    @Override\n    public void destroy() {\n\n    }\n}\n````\n\n## 2.在ApplicationConfiguration.java中增加一个@bean\n````java\n @Bean\n    public FilterRegistrationBean testFilterRegistration() {\n\n        FilterRegistrationBean registration = new FilterRegistrationBean();\n        registration.setFilter(new TestFilter());\n        registration.addUrlPatterns(\"/*\");\n        registration.addInitParameter(\"paramName\", \"paramValue\");\n        registration.setName(\"testFilter\");\n        registration.setOrder(1);\n        return registration;\n    }\n````\n## 3.启动项目\n你会看到控制台打印如下代码：\n![https://github.com/bigbeef/cppba-spring-boot](http://image.cppba.com/Image/article/a0452a60-1161-4f63-8501-10fd3556fbd4.png)\n\n##4.访问项目\n最后我们访问以下http://127.0.0.1:8080/test\n如果你看到控制台打印出:TestFilter\n![https://github.com/bigbeef/cppba-spring-boot](http://image.cppba.com/Image/article/bf0a4bae-16fa-48d6-aa50-46b686cbffa2.png \"https://github.com/bigbeef/cppba-spring-boot\")\n\n恭喜你，配置成功！\n\n参考资料：https://github.com/bigbeef/cppba-spring-boot');
INSERT INTO `articles` VALUES ('5', '2016-07-21 21:45:28', '0', '1', '1', 'spring-session使用教程(一)：redis共享session', '说白了就是解决session共享问题，spring-session将web的session存到一个指定的位置，集群的所有web服务器在操作session的时候就去这个位置找', '**1.Spring session简介：**\n说白了就是解决session共享问题，spring-session将web的session存到一个指定的位置，集群的所有web服务器在操作session的时候就去这个位置找。（我比较喜欢用最土的语言解释，不官方但是容易理解）\n\n注意：本文只教你怎么使用spring-session-redis，不会深入探讨为什么这么实现，因为暂时我也没弄清他的源源码，但是照下面的做法你一定能跑起来。\n\n**2.maven在pom.xml中配置**\n````java\n<!--spring-session-->\n<dependency>\n    <groupId>org.springframework.session</groupId>\n    <artifactId>spring-session-data-redis</artifactId>\n    <version>1.2.1.RELEASE</version>\n</dependency>\n````\n\n**3.创建RedisHttpSessionConfig**\n````java\npackage com.cppba.config;\nimport org.springframework.context.annotation.Bean;\n\nimport org.springframework.data.redis.connection.jedis.JedisConnectionFactory;\nimport org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;\n\n@EnableRedisHttpSession\npublic class RedisHttpSessionConfig {\n\n    @Bean\n    public JedisConnectionFactory connectionFactory() {\n        JedisConnectionFactory connection = new JedisConnectionFactory();\n        connection.setHostName(\"127.0.0.1\");\n        connection.setPort(6379);\n        return connection;\n    }\n}\n````\n****\n**4.创建SpringSessionInitializer**\n````java\npackage com.cppba.config;\n\nimport org.springframework.session.web.context.AbstractHttpSessionApplicationInitializer;\n\npublic class SpringSessionInitializer extends AbstractHttpSessionApplicationInitializer {\n}\n````\n\n接下来，把项目跑起来，在浏览器上访问一下，我们再在redis的控制台输入keys *，如果你能看到像下图的结果，恭喜你，配置成功！\n\n![https://github.com/bigbeef](http://image.cppba.com/Image/article/cc986884-2e9f-40a0-9567-599e224230aa.png)\n\n参考项目：https://github.com/bigbeef/cppba-web');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_status` int(11) DEFAULT '0',
  `role_id` bigint(20) DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL,
  `url` varchar(64) DEFAULT NULL COMMENT '资源名',
  `description` varchar(32) DEFAULT NULL COMMENT '权限说明',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '2016-07-15 09:55:37', '0', '1', null, 'blogger:create', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_status` int(11) DEFAULT '0',
  `name` varchar(16) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(16) DEFAULT NULL COMMENT '角色说明',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '2016-07-15 13:55:27', '0', 'blogger', '博主');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_status` int(11) DEFAULT '0',
  `user_name` varchar(16) DEFAULT NULL COMMENT '账号',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(16) DEFAULT NULL COMMENT '昵称',
  `remark` text COMMENT '个人简介',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2016-07-18 22:36:46', '0', 'admin', '21232f297a57a5a743894a0e4a801fc3', '大黄蜂', '大黄蜂');
INSERT INTO `user` VALUES ('2', '2016-07-18 22:37:09', '0', 'test', '098f6bcd4621d373cade4e832627b4f6', 'test', 'test');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_status` int(11) DEFAULT '0',
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '2016-07-15 09:55:21', '0', '1', '1');
