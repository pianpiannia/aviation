package com.aviation.order.vo;

import java.util.Date;

import com.aviation.aircraft.vo.Aircraft;
import com.aviation.customer.vo.Customer;
import com.aviation.route.vo.Route;

/**
 * 
 * @author lijun
 *
 */
public class Order {
	//订单编号
	private Integer oid;
	//订单日期
	private Date ordertime;
	//航线信息
	private Route route;
	//票价
	private Double price;
	//客户名称
	private String cname;
	//客户身份证号
	private String idcard;
	//外键对象：用户
	private Customer customer;
	//订单状态码
	// 1:未付款   2:订单已经付款   3:订单结束
	private Integer state;
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	public Route getRoute() {
		return route;
	}
	public void setRoute(Route route) {
		this.route = route;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	
	
}
