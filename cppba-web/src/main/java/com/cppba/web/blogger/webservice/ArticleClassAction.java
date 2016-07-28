package com.cppba.web.blogger.webservice;

import com.cppba.core.bean.PageEntity;
import com.cppba.core.util.CommonUtil;
import com.cppba.dto.ArticleClassDto;
import com.cppba.entity.ArticleClass;
import com.cppba.entity.User;
import com.cppba.service.ArticleClassService;
import org.apache.shiro.authz.annotation.RequiresRoles;
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
@Controller("bloggerWebserviceArticleClassAction")
public class ArticleClassAction {

    private static Logger logger = LoggerFactory.getLogger(ArticleClassAction.class);

    @Resource
    private ArticleClassService articleClassService;

    /**
     * 文章类别查询
     */
    @RequiresRoles("blogger")
    @RequestMapping("/blogger/articleClass_query.htm")
    public void articleClass_query(
            HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value="likeName", defaultValue="")String likeName,
            @RequestParam(value="page", defaultValue="0")int page,
            @RequestParam(value="pageSize", defaultValue="0")int pageSize){
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            User sessionUser = CommonUtil.getUserFromSession(request);
            long userId = sessionUser.getUserId();
            Map<String,Object> map1 = new HashMap<String,Object>();
            ArticleClassDto articleClassDto = new ArticleClassDto();
            ArticleClass articleClass = new ArticleClass();
            articleClass.setUserId(userId);
            articleClassDto.setArticleClass(articleClass);
            articleClassDto.setLikeName(likeName);
            articleClassDto.setPage(page);
            articleClassDto.setPageSize(pageSize);
            PageEntity<ArticleClass> pe = articleClassService.query(articleClassDto);
            List<ArticleClass> articleClassList = pe.getList();
            List< Map<String,Object>> list = new ArrayList<Map<String,Object>>();
            for(ArticleClass ac:articleClassList){
                Map<String,Object> map2 = new HashMap<String,Object>();
                map2.put("articleClass",ac);
                list.add(map2);
            }
            map1.put("articleClasss",list);
            map1.put("count",pe.getCount());
            CommonUtil.responseBuildJson("1","操作成功",map1,response);
        }catch (Exception e){
            CommonUtil.responseBuildJson("2","操作异常",null,response);
            logger.error(e.getMessage(),e);
        }
    }

    /**
     * 文章类别保存或修改
     */
    @RequiresRoles("blogger")
    @RequestMapping("/blogger/articleClass_saveOrUpdate.htm")
    public void articleClass_saveOrUpdate(
            HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value="articleClassId", defaultValue="0")long articleClassId,
            @RequestParam(value="name", defaultValue="")String name,
            @RequestParam(value="sortId", defaultValue="0")int sortId){
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            User sessionUser = CommonUtil.getUserFromSession(request);
            long userId = sessionUser.getUserId();
            Map<String,Object> map1 = new HashMap<String,Object>();
            ArticleClass articleClass = articleClassService.findById(articleClassId);
            boolean isNew = false;
            if(articleClass == null){
                isNew = true;
                articleClass = new ArticleClass();
            }
            articleClass.setName(name);
            articleClass.setSortId(sortId);
            articleClass.setUserId(userId);
            if(isNew){
                articleClassService.save(articleClass);
            }else{
                articleClassService.update(articleClass);
            }
            CommonUtil.responseBuildJson("1","操作成功",map1,response);
        }catch (Exception e){
            CommonUtil.responseBuildJson("2","操作异常",null,response);
            logger.error(e.getMessage(),e);
        }
    }

    /**
     * 文章类别加载
     */
    @RequiresRoles("blogger")
    @RequestMapping("/blogger/articleClass_load.htm")
    public void articleClass_load(
            HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value="articleClassId", defaultValue="0")long articleClassId){
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            Map<String,Object> map1 = new HashMap<String,Object>();

            ArticleClass articleClass = articleClassService.findById(articleClassId);
            if(articleClass==null){
                CommonUtil.responseBuildJson("3","类别不存在",map1,response);
                return;
            }
            map1.put("articleClass",articleClass);
            CommonUtil.responseBuildJson("1","操作成功",map1,response);
        }catch (Exception e){
            CommonUtil.responseBuildJson("2","操作异常",null,response);
            logger.error(e.getMessage(),e);
        }
    }

    /**
     * 文章类别删除
     */
    @RequiresRoles("blogger")
    @RequestMapping("/blogger/articleClass_delete.htm")
    public void articleClass_delete(
            HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value="articleClassId", defaultValue="0")long articleClassId){
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            Map<String,Object> map1 = new HashMap<String,Object>();

            ArticleClass articleClass = articleClassService.findById(articleClassId);
            if(articleClass==null){
                CommonUtil.responseBuildJson("3","类别不存在",map1,response);
                return;
            }
            articleClass.setDeleteStatus(1);
            articleClassService.update(articleClass);
            CommonUtil.responseBuildJson("1","操作成功",map1,response);
        }catch (Exception e){
            CommonUtil.responseBuildJson("2","操作异常",null,response);
            logger.error(e.getMessage(),e);
        }
    }
}
