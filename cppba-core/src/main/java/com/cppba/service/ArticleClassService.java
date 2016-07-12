package com.cppba.service;

import com.cppba.core.bean.PageEntity;
import com.cppba.dto.ArticleClassDto;
import com.cppba.dto.BaseDto;
import com.cppba.entity.ArticleClass;

/**
 * 开发者
 * nickName:大黄蜂
 * email:245655812@qq.com
 * github:https://github.com/bigbeef
 */
public interface ArticleClassService {
	void save(ArticleClass articleClass);
	
	void delete(ArticleClass articleClass);
	
	void update(ArticleClass articleClass);

	ArticleClass findById(long id);

	PageEntity<ArticleClass> query(BaseDto baseDto);
}
