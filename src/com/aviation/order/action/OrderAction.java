package com.aviation.order.action;


import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.aviation.customer.vo.Customer;
import com.aviation.order.service.OrderService;
import com.aviation.order.vo.Order;
import com.aviation.route.service.RouteService;
import com.aviation.route.vo.Route;
import com.aviation.util.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class OrderAction extends ActionSupport implements ModelDriven<Order> {

	private Order order = new Order();

	@Override
	public Order getModel() {
		return order;
	}

	private OrderService orderService;
	
	private RouteService routeService;

	

	private Integer page;
	
	public void setPage(Integer page) {
		this.page = page;
	}

	public void setRouteService(RouteService routeService) {
		this.routeService = routeService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	// 到订单界面
	public String toMyOrder() {
		Customer customer = (Customer) ServletActionContext.getRequest().getSession().getAttribute("existCustomer");
		PageBean<Order> pageBean =  orderService.findPageByCid(customer.getCid(),page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "toMyOrder";
	}
	//直接付款
	/*public String payOrder(){
		
		Customer customer = new Customer();
		customer = (Customer) ServletActionContext.getRequest().getSession().getAttribute("existCustomer");
		if(customer == null){
			this.addActionError("还未登陆，请先登陆");
			return "login";
		}
		if(customer.getSign().equals("1")){
			this.addActionError("您个人信用不足，无法预定");
			return "toOrderPage";
		}
	System.out.println("========="+order.getRoute());
		order.setCustomer(customer);
		order.setState(2);
		//order.setAircraft(routeService.findByRid(order.getRid()).getAircraft());
		order.setOrdertime(new Date());
		orderService.save(order);
		this.addActionMessage("支付成功");
		return "saveOrder";
	}*/
	//保存订单
	public String saveOrder(){
		Customer customer = new Customer();
		customer = (Customer) ServletActionContext.getRequest().getSession().getAttribute("existCustomer");
		if(customer == null){
			this.addActionError("还未登陆，请先登陆");
			return "login";
		}
		if(customer.getSign().equals("1")){
			this.addActionError("您个人信用不足，无法预定");
			return "toOrderPage";
		}
		order.setCustomer(customer);
		order.setState(1);
		order.setOrdertime(new Date());
		Route route = new Route();
		route = routeService.findByRid(order.getRoute().getRid());
		if(order.getPrice().equals(route.getFirst_price())){
			route.setFirst_number(route.getFirst_number()-1);
			routeService.update(route);
		}
		if(order.getPrice().equals(route.getBusiness_price())){
			route.setBusiness_number(route.getBusiness_number()-1);
			routeService.update(route);
		}
		if(order.getPrice().equals(route.getTourist_price())){
			route.setTourist_number(route.getTourist_number()-1);
			routeService.update(route);
		}
		orderService.save(order);
		this.addActionMessage("预定成功");
		return "saveOrder";	
	}
	
	//未支付去付款
	public String goPayOrder(){	
		order = orderService.findByOid(order.getOid());
		order.setState(2);
		
		orderService.update(order);
		return "updateOrderSuccess";
	}
	//已付款，订单完成
	public String updateState(){
		order = orderService.findByOid(order.getOid());
		order.setState(3);
		orderService.update(order);
		return "updateOrderSuccess";
	}
	
	//取消订单
	public String cancelOrder(){
		order = orderService.findByOid(order.getOid());
		
		Route route = new Route();
		route = routeService.findByRid(order.getRoute().getRid());
		if(order.getPrice().equals(route.getFirst_price())){
			route.setFirst_number(route.getFirst_number()+1);
			routeService.update(route);
		}
		if(order.getPrice().equals(route.getBusiness_price())){
			route.setBusiness_number(route.getBusiness_number()+1);
			routeService.update(route);
		}
		if(order.getPrice().equals(route.getTourist_price())){
			route.setTourist_number(route.getTourist_number()+1);
			routeService.update(route);
		}
		
		orderService.delete(order);
		return "cancelOrder";
	}
}
