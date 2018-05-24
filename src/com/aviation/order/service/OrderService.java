package com.aviation.order.service;

import java.util.List;

import com.aviation.order.dao.OrderDao;
import com.aviation.order.vo.Order;
import com.aviation.util.PageBean;

public class OrderService {
	
	private OrderDao orderDao;

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public void save(Order order) {
		orderDao.save(order);
	}

	public PageBean<Order> findPageByCid(Integer cid, Integer page) {
		PageBean<Order> pageBean = new PageBean<Order>();
		// 设置当前页数:
		pageBean.setPage(page);
		// 设置每页显示记录数:
		// 显示5个
		int limit = 5;
		pageBean.setLimit(limit);
		// 设置总记录数:
		int totalCount = 0;
		totalCount = orderDao.findByCountCid(cid);
		pageBean.setTotalCount(totalCount);
		// 设置总页数
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 设置每页显示数据集合:
		int begin = (page - 1)*limit;
		List<Order> list = orderDao.findByPageCid(cid,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	public PageBean<Order> findAll(Integer page) {
		PageBean<Order> pageBean = new PageBean<Order>();
		
		pageBean.setPage(page);
		
		int limit = 10;
		pageBean.setLimit(limit);
		
		int totalCount = orderDao.findCount();
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		int begin = (page - 1) * limit;
		List<Order> list = orderDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	public Order findByOid(Integer oid) {
		return orderDao.findByOid(oid);
	}

	public void update(Order order) {
		orderDao.update(order);
	}

	public void delete(Order order) {
		orderDao.delete(order);
	}

	
}
