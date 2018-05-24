package com.aviation.adminuser.vo;




/**
 * 
 * @author lijun
 * create table "adminuser" 
(
   "userid"             int                  not null,
   "username"           VARCHAR(50)          not null,
   "password"           VARCHAR(50)          not null,
   constraint PK_ADMINUSER primary key ("userid")
);
comment on table "adminuser" is
'管理员信息表';
comment on column "adminuser"."userid" is
'管理员编号';
comment on column "adminuser"."username" is
'管理员姓名';
comment on column "adminuser"."password" is
'密码';
 */
//管理员信息表
public class AdminUser {
	//管理员编号
	private Integer userid;
	//管理员姓名
	private String username;
	//密码
	private String password;
	
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
