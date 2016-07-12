package com.cppba.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 * 开发者
 * nickName:大黄蜂
 * email:245655812@qq.com
 * github:https://github.com/bigbeef
 */
public class BaseDao{

	@Resource
	private SessionFactory sessionFactory;


	public void save(Object entity) {
		sessionFactory.getCurrentSession().save(entity);
	}

	public void update(Object entity) {
		sessionFactory.getCurrentSession().update(entity);
	}

	public void delete(Object entity) {
		sessionFactory.getCurrentSession().delete(entity);
	}

	public int executeUpdate(String hql){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		return query.executeUpdate();
	}
	
	public Object get(Class clazz, long id) {
		Object obj = null; // 实体对象
		try {
			obj = sessionFactory.getCurrentSession().get(clazz, id);
		} catch (Exception e) {
			e.printStackTrace();
			obj = null;
		}
		return obj;
	}

	public List query(final String hql, final Map params, final int page,
			final int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		List<Object> list = null;
		Query query = session.createQuery(hql);
		if (params != null && params.size() > 0) {
			for (Object key : params.keySet()) {
				query.setParameter(key.toString(), params.get(key));
			}
		}
		if(page>0 && pageSize>0){
			query.setFirstResult((page - 1) * pageSize);
			query.setMaxResults(pageSize);
		}
		list = (List<Object>) query.list();
		return list;
	}

	public Long count(final String hql, final Map params) {
		final String countHQL = prepareCountHql(hql);
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(countHQL);
		if (params != null && params.size() > 0) {
			for (Object key : params.keySet()) {
				query.setParameter(key.toString(), params.get(key));
			}
		}
		Long count = new Long(query.iterate().next().toString());
		return count;
	}

	/**
	 * 获取HQL的count(*)
	 */
	protected String prepareCountHql(final String HQL) {
		String fromHql = HQL;
		fromHql = "from" + StringUtils.substringAfter(fromHql, "from");
		fromHql = StringUtils.substringBefore(fromHql, "order by");
		int whereIndex = fromHql.indexOf("where");
		int leftIndex = fromHql.indexOf("left join");
		if (leftIndex >= 0) {
			if (whereIndex >= 0) {
				String temp = StringUtils.substringBefore(fromHql, "left");
				fromHql = temp + " where "
						+ StringUtils.substringAfter(fromHql, "where");
			} else {
				fromHql = StringUtils.substringBefore(fromHql, "left");
			}
		}
		String countHql = "select count(*) " + fromHql;
		return countHql;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
