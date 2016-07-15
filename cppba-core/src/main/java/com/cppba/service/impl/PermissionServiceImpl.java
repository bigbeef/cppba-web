package com.cppba.service.impl;

import com.cppba.core.bean.PageEntity;
import com.cppba.dao.PermissionDao;
import com.cppba.dto.BaseDto;
import com.cppba.dto.PermissionDto;
import com.cppba.entity.Permission;
import com.cppba.service.PermissionService;
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
public class PermissionServiceImpl implements PermissionService{
	@Resource
	private PermissionDao permissionDao;

	@Override
	public void save(Permission permission) {
		permissionDao.save(permission);
	}

	@Override
	public void delete(Permission permission) {
		permissionDao.delete(permission);
	}

	@Override
	public void update(Permission permission) {
		permissionDao.update(permission);
	}

	@Override
	public Permission findById(int id) {
		return (Permission) permissionDao.get(Permission.class, id);
	}

	@Override
	public PageEntity<Permission> query(BaseDto baseDto) {
		String hql = " select distinct permission from Permission permission where 1=1 ";
		Map params = new HashMap<String,Object>();

		PermissionDto permissionDto = (PermissionDto)baseDto;
		Permission permission = permissionDto.getPermission();
		int page = permissionDto.getPage();
		int pageSize = permissionDto.getPageSize();

		
		//roleId
		long roleId = permission.getRoleId();
		if(roleId > 0){
			hql += " and permission.roleId = :roleId ";
			params.put("roleId",roleId);
		}

        //未被删除的
        hql += " and deleteStatus = 0";
		List list = permissionDao.query(hql,params,page,pageSize);
		long count = permissionDao.count(hql,params);
		PageEntity<Permission> pe = new PageEntity<Permission>();
		pe.setCount(count);
		pe.setList(list);
		return pe;
	}
}

