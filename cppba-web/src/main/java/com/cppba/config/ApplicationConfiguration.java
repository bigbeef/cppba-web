package com.cppba.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/**
 * 开发者
 *  nickName:大黄蜂
 *  email:245655812@qq.com
 *  github:https://github.com/bigbeef
 */
@Configuration
public class ApplicationConfiguration {
    //springmvc文件上传
    @Bean
    public CommonsMultipartResolver multipartResolver(){
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
        commonsMultipartResolver.setDefaultEncoding("UTF-8");
        commonsMultipartResolver.setMaxUploadSize(104857600);
        commonsMultipartResolver.setMaxInMemorySize(4096);
        return commonsMultipartResolver;
    }
    
    //定义视图解析器
    @Bean
    public InternalResourceViewResolver viewResolver(){
        InternalResourceViewResolver internalResourceViewResolver = new InternalResourceViewResolver();
        //internalResourceViewResolver.setPrefix("pages/");
        //internalResourceViewResolver.setSuffix(".jsp");
        return internalResourceViewResolver;
    }
}
