package com.cppba.service.impl;

import com.cppba.core.bean.PageEntity;
import com.cppba.dao.UserDao;
import com.cppba.dto.BaseDto;
import com.cppba.dto.UserDto;
import com.cppba.entity.User;
import com.cppba.service.UserService;
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
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;
	
	//@CachePut(value="userCache",key="#user.getUserId()")
	public void save(User user) {
		userDao.save(user);
	}

	//@CacheEvict(value="userCache",allEntries=true)
	public void delete(User user) {
		userDao.delete(user);
	}

	//@CachePut(value="userCache",key="#user.getUserId()")
	public void update(User user) {
		userDao.update(user);
	}
	
	public User findById(long id) {
		return (User) userDao.get(User.class, id);
	}

    @Override
    public User findByUserName(String userName) {
        Map<String,Object> params = new HashMap<String, Object>();
        String hql = " select distinct user from User user where 1=1 ";
        hql += " and user.userName = :userName ";
        params.put("userName",userName);
        List list = userDao.query(hql,params,0,0);
        if(list.size() > 0){
            return (User) list.get(0);
        }
        return null;
    }

    public PageEntity<User> query(BaseDto baseDto) {
        Map<String,Object> params = new HashMap<String, Object>();
        String hql = " select distinct user from User user where 1=1 ";
        UserDto userDto = (UserDto) baseDto;
        User user = userDto.getUser();
        int page = userDto.getPage();
        int pageSize = userDto.getPageSize();

        //userName
        if(StringUtils.isNotBlank(user.getUserName())){
            hql += " and user.userName = :userName ";
            params.put("userName",user.getUserName());
        }
        //password
        if(StringUtils.isNotBlank(user.getPassword())){
            hql += " and user.password = :password ";
            params.put("password",user.getPassword());
        }
        //未被删除的
        hql += " and deleteStatus = 0";
        List list = userDao.query(hql,params,page,pageSize);
        long count = userDao.count(hql,params);
        PageEntity<User> pe = new PageEntity<User>();
        pe.setCount(count);
        pe.setList(list);
        return pe;
    }


}
