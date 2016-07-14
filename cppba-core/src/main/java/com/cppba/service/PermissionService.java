package com.cppba.service;

import com.cppba.core.bean.PageEntity;
import com.cppba.dto.BaseDto;
import com.cppba.entity.Permission;

/**
 * 开发者
 * nickName:大黄蜂
 * email:245655812@qq.com
 * github:https://github.com/bigbeef
 * velocity模板生成 cppba-codeTemplate
 */
public interface PermissionService {
	void save(Permission permission);

	void delete(Permission permission);

	void update(Permission permission);

	Permission findById(int id);

	PageEntity<Permission> query(BaseDto baseDto);
}
