package com.aviation.ticket.vo;

import java.sql.Date;

/**
 * 
 * @author lijun
 *drop table "tickets" cascade constraints;
create table "tickets" 
(
   "tid"                int                  not null,
   "cid"                int                  not null,
   "rid"                int                  not null,
   "date"               DATE                 not null,
   "jipiaoleixing"      VARCHAR(50)          not null,
   "zhangshu"           VARCHAR(50)          not null,
   "feiyong"            VARCHAR(50)          not null,
   constraint PK_TICKETS primary key ("tid")
);

comment on table "tickets" is'票务信息';
comment on column "tickets"."tid" is'订单编号';
comment on column "tickets"."cid" is'客户信息';
comment on column "tickets"."rid" is'航班信息';
comment on column "tickets"."date" is'出行日期';
comment on column "tickets"."jipiaoleixing" is'机票类型';
comment on column "tickets"."zhangshu" is'购买张数';
comment on column "tickets"."feiyong" is'费用';
 */
public class Ticket {
	private Integer tid;
	private Integer cid;
	private Integer rid;
	private Date date;
	private String jipiaoleixing;
}
