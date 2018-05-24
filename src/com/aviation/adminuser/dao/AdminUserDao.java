package com.aviation.adminuser.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.aviation.adminuser.vo.AdminUser;


public class AdminUserDao  extends HibernateDaoSupport{

	//µÇÂ¼µÄ·½·¨
	public AdminUser login(AdminUser adminUser) {
		String hql = "from AdminUser where username=? and password=?";
		List<AdminUser> list = this.getHibernateTemplate().find(hql, adminUser.getUsername(),adminUser.getPassword());
		if(list != null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	public List<AdminUser> findAll() {
		String hql = "from AdminUser";
		List<AdminUser> list = this.getHibernateTemplate().find(hql);
		return list;
	}

	public AdminUser findByUid(Integer userid) {
		return this.getHibernateTemplate().get(AdminUser.class, userid);
	}

	public void update(AdminUser adminUser) {
		this.getHibernateTemplate().update(adminUser);
	}

	public void save(AdminUser adminUser) {
		this.getHibernateTemplate().save(adminUser);
	}

	public void delete(AdminUser adminUser) {
		this.getHibernateTemplate().delete(adminUser);
	}

}
