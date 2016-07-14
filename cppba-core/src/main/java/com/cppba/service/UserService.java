package com.cppba.service;

import com.cppba.core.bean.PageEntity;
import com.cppba.dto.BaseDto;
import com.cppba.entity.User;

/**
 * 开发者
 * nickName:大黄蜂
 * email:245655812@qq.com
 * github:https://github.com/bigbeef
 */
public interface UserService {
	void save(User user);
	
	void delete(User user);
	
	void update(User user);
	
	User findById(long id);

	User findByUserName(String userName);

	PageEntity<User> query(BaseDto baseDto);
}
