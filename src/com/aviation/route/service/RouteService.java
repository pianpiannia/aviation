package com.aviation.route.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.aviation.order.vo.Order;
import com.aviation.route.dao.RouteDao;
import com.aviation.route.vo.Route;
import com.aviation.util.PageBean;

@Transactional
public class RouteService {
	
	private RouteDao routeDao;

	public void setRouteDao(RouteDao routeDao) {
		this.routeDao = routeDao;
	}

	public List<Route> findAll() {
		return routeDao.findAll();
	}

	public Route findByRid(Integer rid) {
		return routeDao.findByRid(rid);
	}

	public void update(Route route) {
		routeDao.update(route);
	}

	public void delete(Route route) {
		routeDao.delete(route);
	}

	public void save(Route route) {
		routeDao.save(route);
	}
	//分页查询的方法
	public PageBean<Route> findByPage(Integer page) {
		PageBean<Route> pageBean = new PageBean<Route>();
		//设置当前页数
		pageBean.setPage(page);
		//设置每页显示的记录数
		int limit = 10;
		pageBean.setLimit(limit);
		//设置总记录数
		int totalCount = 0;
		totalCount = routeDao.findCount();
		pageBean.setTotalCount(totalCount);
		//设置总页数
		int totalPage = 0;
		//Math.ceil(totalCount/limit);
		if(totalCount % limit ==0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit+1;
		}
		pageBean.setTotalPage(totalPage);
		//每页显示数据的集合
		//从哪开始
		int begin = (page-1)*limit;
		List<Route> list = routeDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}


	public List<Route> findMoreCondition(Route route) {
		return routeDao.findMoreCondition(route);
	}

	public PageBean<Route> findMoreConditionPage(Route route, Integer page) {
		PageBean<Route> pageBean = new PageBean<Route>();
		// 设置当前页数:
		page = 1;
		pageBean.setPage(page);
		// 设置每页显示记录数:
		// 显示5个
		int limit = 5;
		pageBean.setLimit(limit);
		// 设置总记录数:
		int totalCount = 0;
		totalCount = routeDao.findTotal(route);
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
		List<Route> list = routeDao.findMoreConditionPage(route, begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
}
