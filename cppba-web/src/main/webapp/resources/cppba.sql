/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50710
Source Host           : 127.0.0.1:3306
Source Database       : cppba

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-07-15 16:17:57
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('1', '2016-07-14 14:48:28', '0', '1', '1', 'spring-boot使用教程(一)：让程序跑起来', 'spring-boot是由[Pivotal](http://gopivotal.com/)团队提供的全新框架，其设计目的是用来简化新Spring应用的初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。通过这种方式，Boot致力于在蓬勃发展的快速应用开发领域（rapid application development）成为领导者。', '## 简介\nspring-boot是由[Pivotal](http://gopivotal.com/)团队提供的全新框架，其设计目的是用来简化新Spring应用的初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。通过这种方式，Boot致力于在蓬勃发展的快速应用开发领域（rapid application development）成为领导者。\n\n##文件结构\n\n![https://github.com/bigbeef/cppba-spring-boot](http://upload-images.jianshu.io/upload_images/2432809-0f2d8bbe95a4e5f0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n## 1.maven的pom.xml配置\n````maven\n<project xmlns=\"http://maven.apache.org/POM/4.0.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n         xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd\">\n    <modelVersion>4.0.0</modelVersion>\n\n    <groupId>com.cppbba</groupId>\n    <artifactId>cppba-spring-boot</artifactId>\n    <packaging>war</packaging>\n    <version>1.0.0</version>\n\n    <name>cppba-spring-boot Maven Webapp</name>\n    <url>http://maven.apache.org</url>\n\n    <parent>\n        <groupId>org.springframework.boot</groupId>\n        <artifactId>spring-boot-starter-parent</artifactId>\n        <version>1.3.6.RELEASE</version>\n    </parent>\n\n    <properties>\n        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>\n        <jdk.version>1.7</jdk.version>\n        <spring.version>4.3.0.RELEASE</spring.version>\n        <hibernate.version>4.3.11.Final</hibernate.version>\n    </properties>\n\n    <dependencies>\n        <!--spring-->\n        <dependency>\n            <groupId>org.springframework.boot</groupId>\n            <artifactId>spring-boot-starter-web</artifactId>\n        </dependency>\n        <dependency>\n            <groupId>org.springframework.boot</groupId>\n            <artifactId>spring-boot-starter-test</artifactId>\n        </dependency>\n        <dependency>\n            <groupId>org.springframework.boot</groupId>\n            <artifactId>spring-boot-starter-jdbc</artifactId>\n        </dependency>\n        <dependency>\n            <groupId>org.springframework</groupId>\n            <artifactId>spring-orm</artifactId>\n        </dependency>\n        <!--mysql-->\n        <dependency>\n            <groupId>mysql</groupId>\n            <artifactId>mysql-connector-java</artifactId>\n        </dependency>\n        <!-- hibernate-->\n        <dependency>\n            <groupId>org.hibernate</groupId>\n            <artifactId>hibernate-entitymanager</artifactId>\n            <version>${hibernate.version}</version>\n        </dependency>\n        <!--druid-->\n        <dependency>\n            <groupId>com.alibaba</groupId>\n            <artifactId>druid</artifactId>\n            <version>1.0.20</version>\n        </dependency>\n    </dependencies>\n\n    <build>\n        <finalName>cppba-spring-boot</finalName>\n        <plugins>\n            <plugin>\n                <groupId>org.springframework.boot</groupId>\n                <artifactId>spring-boot-maven-plugin</artifactId>\n            </plugin>\n        </plugins>\n    </build>\n</project>\n````\n## 2.创建Application.java\n````java\npackage com.cppba;\n\nimport org.springframework.boot.SpringApplication;\nimport org.springframework.boot.autoconfigure.SpringBootApplication;\nimport org.springframework.core.env.Environment;\n\nimport java.net.UnknownHostException;\n\n// same as @Configuration @EnableAutoConfiguration @ComponentScan\n@SpringBootApplication\npublic class Application {\n    public static void main(String[] args) throws UnknownHostException {\n        SpringApplication app = new SpringApplication(Application.class);\n        Environment environment = app.run(args).getEnvironment();\n    }\n}\n````\n\n##3.创建DatabaseConfiguration.java\n````java\npackage com.cppba.config;\n\nimport com.alibaba.druid.pool.DruidDataSource;\nimport org.springframework.boot.bind.RelaxedPropertyResolver;\nimport org.springframework.context.ApplicationContextException;\nimport org.springframework.context.EnvironmentAware;\nimport org.springframework.context.annotation.Bean;\nimport org.springframework.context.annotation.Configuration;\nimport org.springframework.core.env.Environment;\nimport org.springframework.orm.hibernate4.HibernateTransactionManager;\nimport org.springframework.orm.hibernate4.LocalSessionFactoryBean;\nimport org.springframework.transaction.annotation.EnableTransactionManagement;\nimport org.springframework.util.StringUtils;\n\nimport javax.sql.DataSource;\nimport java.sql.SQLException;\nimport java.util.Arrays;\nimport java.util.Properties;\n\n@Configuration\n@EnableTransactionManagement\npublic class DatabaseConfiguration implements EnvironmentAware {\n\n    private Environment environment;\n    private RelaxedPropertyResolver datasourcePropertyResolver;\n\n    //从application.yml中读取资源\n    @Override\n    public void setEnvironment(Environment environment) {\n        this.environment = environment;\n        this.datasourcePropertyResolver = new RelaxedPropertyResolver(environment,\n                \"spring.datasource.\");\n    }\n\n    //datasource\n    @Bean(initMethod = \"init\", destroyMethod = \"close\")\n    public DataSource dataSource() throws SQLException {\n        if (StringUtils.isEmpty(datasourcePropertyResolver.getProperty(\"url\"))) {\n            System.out.println(\"Your database connection pool configuration is incorrect!\" +\n                    \" Please check your Spring profile, current profiles are:\"+\n            Arrays.toString(environment.getActiveProfiles()));\n            throw new ApplicationContextException(\n                    \"Database connection pool is not configured correctly\");\n        }\n        DruidDataSource druidDataSource = new DruidDataSource();\n        druidDataSource.setUrl(datasourcePropertyResolver.getProperty(\"url\"));\n        druidDataSource.setUsername(datasourcePropertyResolver\n                .getProperty(\"username\"));\n        druidDataSource.setPassword(datasourcePropertyResolver\n                .getProperty(\"password\"));\n        druidDataSource.setInitialSize(1);\n        druidDataSource.setMinIdle(1);\n        druidDataSource.setMaxActive(20);\n        druidDataSource.setMaxWait(60000);\n        druidDataSource.setTimeBetweenEvictionRunsMillis(60000);\n        druidDataSource.setMinEvictableIdleTimeMillis(300000);\n        druidDataSource.setValidationQuery(\"SELECT　\'x\'\");\n        druidDataSource.setTestWhileIdle(true);\n        druidDataSource.setTestOnBorrow(false);\n        druidDataSource.setTestOnReturn(false);\n        return druidDataSource;\n    }\n\n    //sessionFactory\n    @Bean\n    public LocalSessionFactoryBean sessionFactory() throws SQLException{\n        LocalSessionFactoryBean localSessionFactoryBean = new LocalSessionFactoryBean();\n        localSessionFactoryBean.setDataSource(this.dataSource());\n        Properties properties1 = new Properties();\n        properties1.setProperty(\"hibernate.dialect\",\"org.hibernate.dialect.MySQL5Dialect\");\n        properties1.setProperty(\"hibernate.show_sql\",\"false\");\n        localSessionFactoryBean.setHibernateProperties(properties1);\n        localSessionFactoryBean.setPackagesToScan(\"*\");\n        return localSessionFactoryBean;\n    }\n\n    //txManager事务开启\n    @Bean\n    public HibernateTransactionManager txManager() throws SQLException {\n        HibernateTransactionManager hibernateTransactionManager = new HibernateTransactionManager();\n        hibernateTransactionManager.setSessionFactory(sessionFactory().getObject());\n        return hibernateTransactionManager;\n    }\n}\n````\n\n##4.创建CommonAction.java(这是一个测试类)\n````java\npackage com.cppba.web;\n\nimport org.hibernate.SQLQuery;\nimport org.hibernate.Session;\nimport org.hibernate.SessionFactory;\nimport org.springframework.transaction.annotation.Transactional;\nimport org.springframework.web.bind.annotation.RequestMapping;\nimport org.springframework.web.bind.annotation.RestController;\n\nimport javax.annotation.Resource;\nimport javax.servlet.http.HttpServletResponse;\nimport java.io.IOException;\nimport java.util.List;\n\n@RestController\n@Transactional\npublic class CommonAction {\n\n    @Resource\n    private SessionFactory sessionFactory;\n\n    @RequestMapping(\"test\")\n    public void test(HttpServletResponse response){\n        Session session = sessionFactory.getCurrentSession();\n        SQLQuery sqlQuery = session.createSQLQuery(\"select * from user\");\n        List list = sqlQuery.list();\n        System.out.printf(list.size()+\"\");\n        try {\n            response.setContentType(\"application/json\");\n            response.setHeader(\"Cache-Control\", \"no-cache\");\n            response.setCharacterEncoding(\"UTF-8\");\n            response.getWriter().write(\"{\\\"msg\\\":\\\"调用成功\\\"}\");\n        } catch (IOException e) {\n            e.printStackTrace();\n        }\n    }\n}\n\n````\n\n##5.创建application.yml\n````json\nserver:\n    port: 8080\n    address: localhost\n\nspring:\n    datasource:\n        url: jdbc:mysql://localhost:3306/cppba\n        username: root\n        password: root\n````\n\n##6.启动项目\n我们点击启动按钮\n![https://github.com/bigbeef/cppba-spring-boot](http://upload-images.jianshu.io/upload_images/2432809-675ad308621f4436.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n控制台会打印如下内容：\n\n![https://github.com/bigbeef/cppba-spring-boot](http://upload-images.jianshu.io/upload_images/2432809-af7b60269bb834b2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n![https://github.com/bigbeef/cppba-spring-boot](http://upload-images.jianshu.io/upload_images/2432809-c5dd79b2c9f9f062.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n启动成功\n接下来我们访问http://127.0.0.1:8080/test\n(我的CommonAction中RequestMapping(\"test\"),所以访问路径是test)\n\n\n![https://github.com/bigbeef/cppba-spring-boot](http://upload-images.jianshu.io/upload_images/2432809-18808b64d0752e19.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n到此spring-boot配置成功！\n\n参考资料：https://github.com/bigbeef/cppba-spring-boot');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_class
-- ----------------------------
INSERT INTO `article_class` VALUES ('1', '2016-07-14 14:48:23', '0', '1', 'java', '0');

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
INSERT INTO `user` VALUES ('1', '2016-07-15 16:17:36', '0', 'admin', '21232f297a57a5a743894a0e4a801fc3', '大黄蜂', '大黄蜂');

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
