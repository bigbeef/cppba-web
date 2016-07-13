package com.cppba.service;

import com.cppba.core.bean.PageEntity;
import com.cppba.dto.BaseDto;
import com.cppba.entity.Articles;

/**
 * 开发者
 * nickName:大黄蜂
 * email:245655812@qq.com
 * github:https://github.com/bigbeef
 * velocity模板生成 cppba-codeTemplate
 */
public interface ArticlesService {
	void save(Articles articles);

	void delete(Articles articles);

	void update(Articles articles);

	Articles findById(long id);

	PageEntity<Articles> query(BaseDto baseDto);
}
