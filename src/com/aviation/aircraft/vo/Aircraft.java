package com.aviation.aircraft.vo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.aviation.order.vo.Order;
import com.aviation.route.vo.Route;

/**
 * 
 * @author lijun
 *create table "aircraft" 
(
   "aid"                INT                  not null,
   "type"               VARCHAR(50)          not null,
   "purchase_time"      DATE                 not null,
   "service_time"       DATE                 not null,
   "first_class"        NUMBER(10)           not null,
   "tourist_class"      NUMBER(10)           not null,
   "business_class"     NUMBER(10)           not null,
   "remark"             VARCHAR(100),
   constraint PK_AIRCRAFT primary key ("aid")
);
comment on table "aircraft" is '客机信息';
comment on column "aircraft"."aid" is '客机编号';
comment on column "aircraft"."type" is '客机型号';
comment on column "aircraft"."purchase_time" is '购买时间';
comment on column "aircraft"."service_time" is '服役时间';
comment on column "aircraft"."first_class" is '头等舱数量';
comment on column "aircraft"."tourist_class" is '经济舱数量';
comment on column "aircraft"."business_class" is '公务舱数量';
comment on column "aircraft"."remark" is '备注';
 */

//客机信息
public class Aircraft {
	//客机id
	private Integer aid;
	//所属航空公司
	private String airline;
	//客机型号
	private String type;
	//购买时间
	private String purchaseTime;
	//服役时间
	private String serviceTime;
	//头等舱数量
	private Integer firstClass;
	//经济舱数量
	private Integer touristClass;
	//公务舱数量
	private Integer businessClass;
	//最近维修时间
	private Date repair_time;
	//维修次数
	private Integer frequency;
	//备注
	private String remark;
	//与航线关系
	private Set<Route> routes = new HashSet<Route>();
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public String getAirline() {
		return airline;
	}
	public void setAirline(String airline) {
		this.airline = airline;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPurchaseTime() {
		return purchaseTime;
	}
	public void setPurchaseTime(String purchaseTime) {
		this.purchaseTime = purchaseTime;
	}
	public String getServiceTime() {
		return serviceTime;
	}
	public void setServiceTime(String serviceTime) {
		this.serviceTime = serviceTime;
	}
	public Integer getFirstClass() {
		return firstClass;
	}
	public void setFirstClass(Integer firstClass) {
		this.firstClass = firstClass;
	}
	public Integer getTouristClass() {
		return touristClass;
	}
	public void setTouristClass(Integer touristClass) {
		this.touristClass = touristClass;
	}
	public Integer getBusinessClass() {
		return businessClass;
	}
	public void setBusinessClass(Integer businessClass) {
		this.businessClass = businessClass;
	}
	public Date getRepair_time() {
		return repair_time;
	}
	public void setRepair_time(Date repair_time) {
		this.repair_time = repair_time;
	}
	public Integer getFrequency() {
		return frequency;
	}
	public void setFrequency(Integer frequency) {
		this.frequency = frequency;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Set<Route> getRoutes() {
		return routes;
	}
	public void setRoutes(Set<Route> routes) {
		this.routes = routes;
	}
	
	
}
