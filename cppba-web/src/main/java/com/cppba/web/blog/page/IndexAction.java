package com.cppba.web.blog.page;

import com.cppba.core.bean.JModelAndView;
import com.cppba.core.bean.PageEntity;
import com.cppba.core.constant.Globals;
import com.cppba.dto.ArticleClassDto;
import com.cppba.dto.ArticlesDto;
import com.cppba.entity.ArticleClass;
import com.cppba.entity.Articles;
import com.cppba.service.ArticleClassService;
import com.cppba.service.ArticlesService;
import com.cppba.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller("blogPageArticlesAction")
public class IndexAction {
    private static Logger logger = LoggerFactory.getLogger(IndexAction.class);

    @Resource
    private UserService userService;
    @Resource
    private ArticlesService articlesService;
    @Resource
    private ArticleClassService articleClassService;

    //首页
    @RequestMapping("/index.htm")
    public ModelAndView index(
            HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value="page", defaultValue="1")int page,
            @RequestParam(value="pageSize", defaultValue="10")int pageSize,
            @RequestParam(value="articleClassId", defaultValue="0")long articleClassId) {
        ModelAndView mv = null;
        try {
            mv = new JModelAndView("/blog/pages/index.jsp",userService.findById(Globals.userId),request);
            mv.addObject("page",page);
            mv.addObject("pageSize",pageSize);

            ArticlesDto articlesDto = new ArticlesDto();
            Articles articles = new Articles();
            articles.setArticleClassId(articleClassId);
            articlesDto.setArticles(articles);
            articlesDto.setPage(page);
            articlesDto.setPageSize(pageSize);
            PageEntity<Articles> pe = articlesService.query(articlesDto);
            List<Articles> articleList = pe.getList();
            List<Map<String,Object>> list = new ArrayList<>();
            for(Articles a:articleList){
                Map<String,Object> map2 = new HashMap<>();
                map2.put("article",a);
                ArticleClass articleClass = articleClassService.findById(a.getArticleClassId());
                map2.put("articleClass",articleClass);
                list.add(map2);
            }
            mv.addObject("articles",list);
            mv.addObject("count",pe.getCount());

            ArticleClassDto articleClassDto = new ArticleClassDto();
            ArticleClass articleClass = new ArticleClass();
            articleClassDto.setArticleClass(articleClass);
            PageEntity<ArticleClass> peArticleClass = articleClassService.query(articleClassDto);
            List<ArticleClass> articleClassList = peArticleClass.getList();
            mv.addObject("articleClasses",articleClassList);

        } catch (Exception e) {
            mv = new JModelAndView("/blog/pages/404.jsp");
            logger.error(e.getMessage(), e);
        }
        return mv;
    }

    //文章内容页面
    @RequestMapping("/article.htm")
    public ModelAndView article(
            HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = null;
        try {
            mv = new JModelAndView("/blog/pages/article.jsp",userService.findById(Globals.userId),request);
            ArticleClassDto articleClassDto = new ArticleClassDto();
            ArticleClass articleClass = new ArticleClass();
            articleClassDto.setArticleClass(articleClass);
            PageEntity<ArticleClass> peArticleClass = articleClassService.query(articleClassDto);
            List<ArticleClass> articleClassList = peArticleClass.getList();
            mv.addObject("articleClasses",articleClassList);
        } catch (Exception e) {
            mv = new JModelAndView("/blog/pages/404.jsp");
            logger.error(e.getMessage(), e);
        }
        return mv;
    }

}
