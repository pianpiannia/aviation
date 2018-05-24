package com.aviation.route.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.aviation.route.service.RouteService;
import com.aviation.route.vo.Route;
import com.aviation.util.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RouteAction extends ActionSupport implements ModelDriven<Route> {

	private Route route = new Route();
	
	@Override
	public Route getModel() {
		return route;
	}

	// 接受分页page参数
	private Integer page;
	HttpServletRequest request;
	private RouteService routeService;

	public void setRouteService(RouteService routeService) {
		this.routeService = routeService;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	
	
	// 到航班界面并查询所有航班信息
	public String findAll() {
		PageBean<Route> pageBean = routeService.findByPage(page);
		
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}

	//查询详细航线详细
	public String findByRid(){
System.out.println("====================="+route.getRid());
		route = routeService.findByRid(route.getRid());
		return "findByRid";
	}
	/*// 多条件组合查询
	public String findMoreCondition() {
		List<Route> rList = routeService.findMoreCondition(route);
		ActionContext.getContext().getValueStack().set("rList", rList);
		return "findMoreCondition";
	}*/
	
	// 多条件组合查询
	public String findMoreCondition() {
		PageBean<Route> pageBean = routeService.findMoreConditionPage(route,page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findMoreCondition";
	}

	// 到订单界面
	public String toOrderPage(){
		route = routeService.findByRid(route.getRid());
		return "toOrderPage";
	}

}
