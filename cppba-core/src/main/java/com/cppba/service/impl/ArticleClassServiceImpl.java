package com.cppba.service.impl;

import com.cppba.core.bean.PageEntity;
import com.cppba.dao.ArticleClassDao;
import com.cppba.dto.ArticleClassDto;
import com.cppba.dto.BaseDto;
import com.cppba.entity.ArticleClass;
import com.cppba.service.ArticleClassService;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 开发者
 * nickName:大黄蜂
 * email:245655812@qq.com
 * github:https://github.com/bigbeef
 */
@Service
@Transactional
public class ArticleClassServiceImpl implements ArticleClassService {

	@Resource
	private ArticleClassDao articleClassDao;
	
	public void save(ArticleClass articleClass) {
		articleClassDao.save(articleClass);
	}

	public void delete(ArticleClass articleClass) {
		articleClassDao.delete(articleClass);
	}

	public void update(ArticleClass articleClass) {
		articleClassDao.update(articleClass);
	}
	
	public ArticleClass findById(long id) {
		return (ArticleClass) articleClassDao.get(ArticleClass.class, id);
	}

    public PageEntity<ArticleClass> query(BaseDto baseDto) {
        Map<String,Object> params = new HashMap<String, Object>();
        String hql = " select distinct articleClass from ArticleClass articleClass where 1=1 ";
        ArticleClassDto articleClassDto = (ArticleClassDto) baseDto;
        ArticleClass articleClass = articleClassDto.getArticleClass();
        int page = articleClassDto.getPage();
        int pageSize = articleClassDto.getPageSize();

        //name
        if(StringUtils.isNotBlank(articleClass.getName())){
            hql += " and articleClass.name = :name ";
            params.put("name",articleClass.getName());
        }
        //likeName
        if(StringUtils.isNotBlank(articleClassDto.getLikeName())){
            hql += " and articleClass.name like :likeName ";
            params.put("likeName","%"+articleClassDto.getLikeName()+"%");
        }
        //userId
        if(articleClass.getUserId()!=null && ObjectUtils.notEqual(articleClass.getUserId(),0L)){
            hql += " and articleClass.userId = :userId ";
            params.put("userId",articleClass.getUserId());
        }

        //未被删除的
        hql += " and deleteStatus = 0 ";
        hql += " order by articleClass.addTime desc";
        List list = articleClassDao.query(hql,params,page,pageSize);
        long count = articleClassDao.count(hql,params);
        PageEntity<ArticleClass> pe = new PageEntity<ArticleClass>();
        pe.setCount(count);
        pe.setList(list);
        return pe;
    }


}
