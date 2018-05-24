package com.aviation.order.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.aviation.order.vo.Order;
import com.aviation.util.PageHibernateCallback;
public class OrderDao extends HibernateDaoSupport{

	public void save(Order order) {
		this.getHibernateTemplate().save(order);
	}

	public Integer findByCountCid(Integer cid) {
		String hql = "select count(*) from Order o where o.customer.cid=?";
		List<Long> list = this.getHibernateTemplate().find(hql, cid);
		if(list != null && list.size()>0){
			return list.get(0).intValue();
		}
		return null;
	}

	public List<Order> findByPageCid(Integer cid, int begin, int limit) {
		String hql = "from Order o where o.customer.cid = ? order by o.ordertime desc";
		List<Order> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Order>(hql, new Object[]{cid}, begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return list;
	}

	public int findCount() {
		String hql = "select count(*) from Order";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Order> findByPage(int begin, int limit) {
		String hql = "from Order order by ordertime desc";
		List<Order> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Order>(hql, null, begin, limit));
		return list;
	}

	public Order findByOid(Integer oid) {
		return this.getHibernateTemplate().get(Order.class, oid);
	}

	public void update(Order order) {
		this.getHibernateTemplate().update(order);
	}

	public void delete(Order order) {
		this.getHibernateTemplate().delete(order);
	}

}
