package com.cppba.web.blog.page;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller("blogPageArticlesAction")
public class IndexAction {
    private static Logger logger = LoggerFactory.getLogger(IndexAction.class);

    //首页
    @RequestMapping("/index.htm")
    public ModelAndView index(
            HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv = null;
        try {
           mv = new ModelAndView("/blog/pages/index.jsp");
        }catch (Exception e){
            mv = new ModelAndView("/blog/pages/404.jsp");
            logger.error(e.getMessage(),e);
        }
        return mv;
    }
    
    //文章内容页面
    @RequestMapping("/article.htm")
    public ModelAndView article(
            HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv = null;
        try {
            mv = new ModelAndView("/blog/pages/article.jsp");
        }catch (Exception e){
            mv = new ModelAndView("/blog/pages/404.jsp");
            logger.error(e.getMessage(),e);
        }
        return mv;
    }
    
}
