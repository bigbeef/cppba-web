package com.cppba.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.Properties;

import static com.cppba.config.ApplicationInitializer.propertySourcesPropertyResolver;

@Configuration
@EnableTransactionManagement
public class ApplicationConfiguration {
    //datasource
    @Bean(initMethod = "init", destroyMethod = "close")
    public DataSource dataSource() throws SQLException {
        DruidDataSource druidDataSource = new DruidDataSource();
        druidDataSource.setUrl(propertySourcesPropertyResolver.getProperty("jdbc.url"));
        druidDataSource.setUsername(propertySourcesPropertyResolver
                .getProperty("jdbc.user"));
        druidDataSource.setPassword(propertySourcesPropertyResolver
                .getProperty("jdbc.password"));
        druidDataSource.setInitialSize(1);
        druidDataSource.setMinIdle(1);
        druidDataSource.setMaxActive(20);
        druidDataSource.setMaxWait(60000);
        druidDataSource.setTimeBetweenEvictionRunsMillis(60000);
        druidDataSource.setMinEvictableIdleTimeMillis(300000);
        druidDataSource.setValidationQuery("SELECT　'x'");
        druidDataSource.setTestWhileIdle(true);
        druidDataSource.setTestOnBorrow(false);
        druidDataSource.setTestOnReturn(false);
        return druidDataSource;
    }

    //sessionFactory
    @Bean
    public LocalSessionFactoryBean sessionFactory() throws SQLException {
        LocalSessionFactoryBean localSessionFactoryBean = new LocalSessionFactoryBean();
        localSessionFactoryBean.setDataSource(this.dataSource());
        Properties properties1 = new Properties();
        properties1.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
        properties1.setProperty("hibernate.show_sql", "false");
        localSessionFactoryBean.setHibernateProperties(properties1);
        localSessionFactoryBean.setPackagesToScan("*");
        return localSessionFactoryBean;
    }

    //txManager事务开启
    @Bean
    public HibernateTransactionManager txManager() throws SQLException {
        HibernateTransactionManager hibernateTransactionManager = new HibernateTransactionManager();
        hibernateTransactionManager.setSessionFactory(sessionFactory().getObject());
        return hibernateTransactionManager;
    }

    //springmvc文件上传
    @Bean
    public CommonsMultipartResolver multipartResolver(){
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
        commonsMultipartResolver.setDefaultEncoding("UTF-8");
        commonsMultipartResolver.setMaxUploadSize(104857600);
        commonsMultipartResolver.setMaxInMemorySize(4096);
        return commonsMultipartResolver;
    }
}
