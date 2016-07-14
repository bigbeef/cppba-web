package com.cppba.service.impl;

import com.cppba.core.bean.PageEntity;
import com.cppba.dao.UserRoleDao;
import com.cppba.dto.BaseDto;
import com.cppba.dto.UserRoleDto;
import com.cppba.entity.UserRole;
import com.cppba.service.UserRoleService;
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
public class UserRoleServiceImpl implements UserRoleService{
	@Resource
	private UserRoleDao userRoleDao;

	@Override
	public void save(UserRole userRole) {
		userRoleDao.save(userRole);
	}

	@Override
	public void delete(UserRole userRole) {
		userRoleDao.delete(userRole);
	}

	@Override
	public void update(UserRole userRole) {
		userRoleDao.update(userRole);
	}

	@Override
	public UserRole findById(int id) {
		return (UserRole) userRoleDao.get(UserRole.class, id);
	}

	@Override
	public PageEntity<UserRole> query(BaseDto baseDto) {
		String hql = " select distinct userRole from UserRole userRole where 1=1 ";
		Map params = new HashMap<String,Object>();

		UserRoleDto userRoleDto = (UserRoleDto)baseDto;
		UserRole userRole = userRoleDto.getUserRole();
		int page = userRoleDto.getPage();
		int pageSize = userRoleDto.getPageSize();

		//userId
		long userId = userRole.getUserId();
		if(userId > 0){
			hql += " and userRole.userId = :userId ";
			params.put("userId",userId);
		}

		List list = userRoleDao.query(hql,params,page,pageSize);
		long count = userRoleDao.count(hql,params);
		PageEntity<UserRole> pe = new PageEntity<UserRole>();
		pe.setCount(count);
		pe.setList(list);
		return pe;
	}
}

