package com.aviation.order.vo;

import java.util.Date;

import com.aviation.aircraft.vo.Aircraft;
import com.aviation.customer.vo.Customer;
import com.aviation.route.vo.Route;

/**
 * 
 * @author lijun
 *drop table if exists "order";
create table "order"
(
   oid                  int not null comment '订单编号',
   rid                  int not null comment '航线编号',
   date                 date not null comment '日期',
   aircraft_type        varchar(50) not null comment '航班机型',
   start_city           varchar(50) not null comment '出发城市',
   arrival_city         varchar(50) not null comment '到达城市',
   price                date not null comment '出发时间',
   start_time           date not null comment '到达时间',
   arrival_time         varchar(50) not null comment '价格',
   cname                varchar(50) not null comment '客户名称',
   idcard               varchar(50) not null comment '身份证号码',
   cid                  int not null comment '客户id',
   state                int comment '订单状态',
   primary key (oid)
);
alter table "order" comment '订单信息';
alter table "order" add constraint FK_Reference_1 foreign key (cid)
      references customer (cid) on delete restrict on update restrict;
alter table "order" add constraint FK_Reference_2 foreign key (rid)
      references route (rid) on delete restrict on update restrict;
 */
public class Order2 {
	//订单编号
	private Integer oid;
	//订单日期
	private Date ordertime;
	//航线编号
	private Integer rid;
	//航班日期
	private Date flight_date;
	//外键对象：客机
	private Aircraft aircraft;
	//出发城市
	private String start_city;
	//到达城市
	private String arrival_city;
	//出发时间
	private Date start_time;
	//到达时间
	private Date arrival_time;
	//票价
	private Double price;
	//客户名称
	private String cname;
	//客户身份证号
	private String idcard;
	//订单状态码
	// 1:未付款   2:订单已经付款   3:订单结束
	private Integer state;
	//外键对象：用户
	private Customer customer;
	
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
	public Date getFlight_date() {
		return flight_date;
	}
	public void setFlight_date(Date flight_date) {
		this.flight_date = flight_date;
	}
	public Aircraft getAircraft() {
		return aircraft;
	}
	public void setAircraft(Aircraft aircraft) {
		this.aircraft = aircraft;
	}
	public String getStart_city() {
		return start_city;
	}
	public void setStart_city(String start_city) {
		this.start_city = start_city;
	}
	public String getArrival_city() {
		return arrival_city;
	}
	public void setArrival_city(String arrival_city) {
		this.arrival_city = arrival_city;
	}
	public Date getStart_time() {
		return start_time;
	}
	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}
	public Date getArrival_time() {
		return arrival_time;
	}
	public void setArrival_time(Date arrival_time) {
		this.arrival_time = arrival_time;
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
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
}
