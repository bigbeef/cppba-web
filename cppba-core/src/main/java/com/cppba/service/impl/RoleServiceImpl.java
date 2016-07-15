package com.cppba.service.impl;

import com.cppba.core.bean.PageEntity;
import com.cppba.dao.RoleDao;
import com.cppba.dto.BaseDto;
import com.cppba.dto.RoleDto;
import com.cppba.entity.Role;
import com.cppba.service.RoleService;
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
public class RoleServiceImpl implements RoleService{
	@Resource
	private RoleDao roleDao;

	@Override
	public void save(Role role) {
		roleDao.save(role);
	}

	@Override
	public void delete(Role role) {
		roleDao.delete(role);
	}

	@Override
	public void update(Role role) {
		roleDao.update(role);
	}

	@Override
	public Role findById(long id) {
		return (Role) roleDao.get(Role.class, id);
	}

	@Override
	public PageEntity<Role> query(BaseDto baseDto) {
		String hql = " select distinct role from Role role where 1=1 ";
		Map params = new HashMap<String,Object>();

		RoleDto roleDto = (RoleDto)baseDto;
		Role role = roleDto.getRole();
		int page = roleDto.getPage();
		int pageSize = roleDto.getPageSize();

		//未被删除的
		hql += " and deleteStatus = 0";
		List list = roleDao.query(hql,params,page,pageSize);
		long count = roleDao.count(hql,params);
		PageEntity<Role> pe = new PageEntity<Role>();
		pe.setCount(count);
		pe.setList(list);
		return pe;
	}
}

