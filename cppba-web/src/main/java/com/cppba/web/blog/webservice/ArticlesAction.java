package com.cppba.web.blog.webservice;

import com.cppba.core.bean.PageEntity;
import com.cppba.core.util.CommonUtil;
import com.cppba.dto.ArticlesDto;
import com.cppba.entity.ArticleClass;
import com.cppba.entity.Articles;
import com.cppba.service.ArticleClassService;
import com.cppba.service.ArticlesService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 开发者
 * nickName:大黄蜂
 * email:245655812@qq.com
 * github:https://github.com/bigbeef
 */
@Controller("blogWebserviceArticlesAction")
public class ArticlesAction {

    private static Logger logger = LoggerFactory.getLogger(ArticlesAction.class);

    @Resource
    private ArticlesService articlesService;
    @Resource
    private ArticleClassService articleClassService;

    /**
     * 文章查询
     */
    @RequestMapping("/article_query.htm")
    public void article_query(
            HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value="likeName", defaultValue="")String likeName,
            @RequestParam(value="userId", defaultValue="0")long userId,
            @RequestParam(value="page", defaultValue="0")int page,
            @RequestParam(value="pageSize", defaultValue="0")int pageSize){
        Map<String,Object> map = new HashMap<>();
        try {
            Map<String,Object> map1 = new HashMap<>();

            ArticlesDto articlesDto = new ArticlesDto();
            Articles articles = new Articles();
            articles.setUserId(userId);
            articlesDto.setLikeName(likeName);
            articlesDto.setArticles(articles);
            articlesDto.setPage(page);
            articlesDto.setPageSize(pageSize);

            PageEntity<Articles> pe = articlesService.query(articlesDto);
            List<Articles> articleList = pe.getList();
            List< Map<String,Object>> list = new ArrayList<>();
            for(Articles a:articleList){
                Map<String,Object> map2 = new HashMap<>();
                map2.put("article",a);
                ArticleClass articleClass = articleClassService.findById(a.getArticleClassId());
                map2.put("articleClass",articleClass);
                list.add(map2);
            }
            map1.put("articles",list);
            map1.put("count",pe.getCount());
            CommonUtil.responseBuildJson("1","操作成功",map1,response);
        }catch (Exception e){
            CommonUtil.responseBuildJson("2","操作异常",null,response);
            logger.error(e.getMessage(),e);
        }
    }

    /**
     * 文章加载
     */
    @RequestMapping("/article_load.htm")
    public void article_load(
            HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value="articleId", defaultValue="0")long articleId){
        Map<String,Object> map = new HashMap<>();
        try {
            Map<String,Object> map1 = new HashMap<>();

            Articles article = articlesService.findById(articleId);
            if(article == null){
                CommonUtil.responseBuildJson("3","文章不存在",map1,response);
                return;
            }
            map1.put("article",article);
            CommonUtil.responseBuildJson("1","操作成功",map1,response);
        }catch (Exception e){
            CommonUtil.responseBuildJson("2","操作异常",null,response);
            logger.error(e.getMessage(),e);
        }
    }
}
