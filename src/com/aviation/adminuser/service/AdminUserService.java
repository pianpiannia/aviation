package com.aviation.adminuser.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.aviation.adminuser.dao.AdminUserDao;
import com.aviation.adminuser.vo.AdminUser;



@Transactional
public class AdminUserService{
	private AdminUserDao adminUserDao;

	public void setAdminUserDao(AdminUserDao adminUserDao) {
		this.adminUserDao = adminUserDao;
	}

	public AdminUser login(AdminUser adminUser) {
		// TODO Auto-generated method stub
		return adminUserDao.login(adminUser);
	}

	public List<AdminUser> findAll() {
		return adminUserDao.findAll();
	}

	public AdminUser findByUid(Integer userid) {
		return adminUserDao.findByUid(userid);
	}

	public void update(AdminUser adminUser) {
		adminUserDao.update(adminUser);
	}

	public void save(AdminUser adminUser) {
		adminUserDao.save(adminUser);
	}

	public void delete(AdminUser adminUser) {
		adminUserDao.delete(adminUser);
	}
}
