package com.cppba.config;

import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.env.PropertySourcesPropertyResolver;
import org.springframework.core.io.support.ResourcePropertySource;
import org.springframework.web.WebApplicationInitializer;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import java.io.IOException;

/**
 * 开发者
 *  nickName:大黄蜂
 *  email:245655812@qq.com
 *  github:https://github.com/bigbeef
 */
public class ApplicationInitializer implements WebApplicationInitializer {

    public static PropertySourcesPropertyResolver propertySourcesPropertyResolver;

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        //*.properties初始化资源文件
        initPropertySourcesPropertyResolver();
    }

    protected void initPropertySourcesPropertyResolver(){
        MutablePropertySources propertySources = new MutablePropertySources();
        try {
            //此处添加要初始化的资源文件
            propertySources.addLast(new ResourcePropertySource("jdbc","jdbc.properties"));
            //propertySources.addLast(new ResourcePropertySource("log4j","log4j.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        propertySourcesPropertyResolver = new PropertySourcesPropertyResolver(propertySources);
    }
}
