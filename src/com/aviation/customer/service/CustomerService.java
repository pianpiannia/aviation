package com.aviation.customer.service;

import com.aviation.customer.vo.Customer;

import java.util.List;

import com.aviation.customer.dao.CustomerDao;

public class CustomerService {
	//注入CustomerDao
	private CustomerDao customerDao;

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	
	
	//按用户名查询用户的方法
	public Customer findByCustomername(String cname){
		return customerDao.findByCustomername(cname);
	}

/*	//业务层完成用户注册的方法
	public void save(Customer Customer) {
		Customer.setState(1);//0代表用户未激活。 1代表用户已经激活
		//产生uuid作为激活码存入数据库
		String code = UUIDUtils.getUUID()+UUIDUtils.getUUID();
		Customer.setCode(code);
		CustomerDao.save(Customer);
	}*/

	//用户登录的方法
	public Customer login(Customer customer) {
		return customerDao.login(customer);
	}
	//后台查询所有用户
	public List<Customer> findAll() {
		return customerDao.findAll();
	}



	public Customer findByCid(Integer cid) {
		// TODO Auto-generated method stub
		return customerDao.findByCid(cid);
	}



	public void update(Customer customer) {
		customerDao.update(customer);
	}



	public void save(Customer customer) {
		customerDao.save(customer);
	}



	public void delete(Customer customer) {
		customerDao.delete(customer);
	}

}
