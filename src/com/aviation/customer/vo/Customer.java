package com.aviation.customer.vo;

import java.util.HashSet;
import java.util.Set;

import com.aviation.order.vo.Order;

/**
 * 
 * @author lijun
 *create table "customer" 
(
   "cid"                int                  not null,
   "cname"              VARCHAR(50)          not null,
   "cpassword"              VARCHAR(50)          not null,
   "sex"                VARCHAR(50)          not null,
   "idcard"             VARCHAR(50)          not null,
   "phone"              VARCHAR(50)          not null,
   "sign"               CHAR(1)              not null,
   constraint PK_CUSTOMER primary key ("cid")
);
comment on table "customer" is '客户信息表';
comment on column "customer"."cid" is '客户编号';
comment on column "customer"."cname" is '客户姓名';
comment on column "customer"."cpassword" is '客户密码';
comment on column "customer"."sex" is '性别';
comment on column "customer"."idcard" is '身份证号码';
comment on column "customer"."phone" is '联系电话';
comment on column "customer"."sign" is '黑名单标记';
 */

//客户信息表
public class Customer {
	//客户编号
	private Integer cid;
	//用户名
	private String cname;
	//用户密码
	private String cpassword;
	//性别
	private String sex;
	//真实姓名
	private String name;
	//身份证号码
	private String idcard;
	//联系电话
	private String phone;
	//黑名单标记
	private String sign;
	//一个用户对应多个订单
	private Set<Order> orders = new HashSet<Order>();
	
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCpassword() {
		return cpassword;
	}
	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	
}
