package com.aviation.order.adminaction;


import com.aviation.order.service.OrderService;
import com.aviation.order.vo.Order;
import com.aviation.util.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


public class AdminOrderAction extends ActionSupport implements ModelDriven<Order> {

	private Order order = new Order();

	@Override
	public Order getModel() {
		return order;
	}
	
	private Integer page;
	
	public void setPage(Integer page) {
		this.page = page;
	}

	private OrderService orderService;
	

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	public String findAll(){
		
		PageBean<Order> pageBean = orderService.findAll(page);
		
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}
	
	public String findOrderByOid(){
		order = orderService.findByOid(order.getOid());
		return "findOrderByOid";
	}
	
	public String delete(){
		order = orderService.findByOid(order.getOid());
		orderService.delete(order);
		return "deleteSuccess";
	}
	
}
