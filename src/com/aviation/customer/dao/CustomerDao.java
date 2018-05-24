package com.aviation.customer.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.aviation.customer.vo.Customer;


/**
 * 用户模块持久层代码
 * @author jun
 *
 */
public class CustomerDao extends HibernateDaoSupport{
	
	//根据名字查询是否有该用户
	public Customer findByCustomername(String cname){
		String hql = "from Customer where cname=?";
		List<Customer> list = this.getHibernateTemplate().find(hql,cname);
		if(list !=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	//注册用户存入数据库代码实现
	public void save(Customer Customer) {
		this.getHibernateTemplate().save(Customer);
	}

	//用户登录的方法
	public Customer login(Customer Customer) {
		String hql = "from Customer where cname=? and cpassword =?";
		List<Customer> list = this.getHibernateTemplate().find(hql,Customer.getCname(),Customer.getCpassword());
		if(list !=null && list.size()>0){
			return list.get(0);
		}
		return null;}

	public List<Customer> findAll() {
		String hql = "from Customer";
		List<Customer> list = this.getHibernateTemplate().find(hql);
		return list;
	}

	public Customer findByCid(Integer cid) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(Customer.class, cid);
	}

	public void update(Customer customer) {
		this.getHibernateTemplate().update(customer);
	}

	public void delete(Customer customer) {
		this.getHibernateTemplate().delete(customer);
	}
}
