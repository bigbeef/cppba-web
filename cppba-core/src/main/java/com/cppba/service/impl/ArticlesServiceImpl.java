package com.cppba.service.impl;

import com.cppba.core.bean.PageEntity;
import com.cppba.dao.ArticlesDao;
import com.cppba.dto.ArticlesDto;
import com.cppba.dto.BaseDto;
import com.cppba.entity.Articles;
import com.cppba.service.ArticlesService;
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
 * velocity模板生成 cppba-codeTemplate
 */
@Service
@Transactional
public class ArticlesServiceImpl implements ArticlesService{
	@Resource
	private ArticlesDao articlesDao;

	@Override
	public void save(Articles articles) {
		articlesDao.save(articles);
	}

	@Override
	public void delete(Articles articles) {
		articlesDao.delete(articles);
	}

	@Override
	public void update(Articles articles) {
		articlesDao.update(articles);
	}

	@Override
	public Articles findById(long id) {
		return (Articles) articlesDao.get(Articles.class, id);
	}

	@Override
	public PageEntity<Articles> query(BaseDto baseDto) {
		String hql = " select distinct articles from Articles articles where 1=1 ";
		Map params = new HashMap<String,Object>();

		ArticlesDto articlesDto = (ArticlesDto)baseDto;
		Articles articles = articlesDto.getArticles();
		int page = articlesDto.getPage();
		int pageSize = articlesDto.getPageSize();

		//likeName
		String likeName = articlesDto.getLikeName();
		if(StringUtils.isNoneBlank(likeName)){
			hql += " and articles.title like :likeName ";
			params.put("likeName","%"+likeName+"%");
		}
		//userId
		if(articles.getUserId()!=null && ObjectUtils.notEqual(articles.getUserId(),0L)){
			hql += " and articles.userId = :userId ";
			params.put("userId",articles.getUserId());
		}

		//未被删除的
		hql += " and deleteStatus = 0 ";
		hql += " order by articles.addTime desc ";
		List list = articlesDao.query(hql,params,page,pageSize);
		long count = articlesDao.count(hql,params);
		PageEntity<Articles> pe = new PageEntity<Articles>();
		pe.setCount(count);
		pe.setList(list);
		return pe;
	}
}

