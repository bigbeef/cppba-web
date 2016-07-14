package com.cppba.service;

import com.cppba.core.bean.PageEntity;
import com.cppba.dto.BaseDto;
import com.cppba.entity.Role;

/**
 * 开发者
 * nickName:大黄蜂
 * email:245655812@qq.com
 * github:https://github.com/bigbeef
 * velocity模板生成 cppba-codeTemplate
 */
public interface RoleService {
	void save(Role role);

	void delete(Role role);

	void update(Role role);

	Role findById(long id);

	PageEntity<Role> query(BaseDto baseDto);
}
