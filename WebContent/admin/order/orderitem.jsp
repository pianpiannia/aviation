<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<table width="100%">
	
	<tr>
		<td>航线编号：<s:property value="model.route.rid"/></td>
		<td>航班日期：<s:property value="%{getText('{0,date,yyyy-MM-dd}',{model.route.flight_date})}"/></td>
		
		<td>乘客姓名：<s:property value="model.cname"/></td>
		<td>身份证：<s:property value="model.idcard"/></td>
		<td>所属用户：<s:property value="model.customer.cname"/></td>
	</tr>
</table>