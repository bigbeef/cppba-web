package com.cppba.service;

import com.cppba.core.bean.PageEntity;
import com.cppba.dto.BaseDto;
import com.cppba.entity.UserRole;

/**
 * 开发者
 * nickName:大黄蜂
 * email:245655812@qq.com
 * github:https://github.com/bigbeef
 * velocity模板生成 cppba-codeTemplate
 */
public interface UserRoleService {
	void save(UserRole userRole);

	void delete(UserRole userRole);

	void update(UserRole userRole);

	UserRole findById(int id);

	PageEntity<UserRole> query(BaseDto baseDto);
}
