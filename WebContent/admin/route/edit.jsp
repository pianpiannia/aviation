<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/css/Style1.css"
	type="text/css" rel="stylesheet">
</HEAD>
<script type="text/javascript" src="${pageContext.request.contextPath}/laydate/laydate.js"></script>
<script>
	laydate.render({
	  elem: '#flight_date' //指定元素
	});
	laydate.render({
		elem: '#start_time',type:'datetime' //指定元素
	});
	laydate.render({
		elem: '#arrival_time',type:'datetime' //指定元素
	});
</script>
<body>
	<form id="" name="Form1"
		action="${pageContext.request.contextPath}/adminRoute_update.action"
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="rid"
			value="<s:property value="model.rid"/>" />
			 &nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>编辑航线信息</STRONG> </strong></td>
			</tr>

			<tr>
				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					出发城市：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="start_city"
					value="<s:property value="model.start_city"/>" class="bg" /></td>
				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					到达城市：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="arrival_city"
					value="<s:property value="model.arrival_city"/>" class="bg" /></td>
			</tr>
			<tr>
				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					航班日期：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1" width="30%"><input
					type="text" name="flight_date" id="flight_date"
					value="<s:property value="%{getText('{0,date,yyyy-MM-dd}',{model.flight_date})}"/>" class="bg" /></td>
					<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					经济舱价格：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="tourist_price"
					value="<s:property value="model.tourist_price"/>" class="bg" /></td>
				
			</tr>
			<tr>
				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					出发时间：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="start_time" id="start_time"
					value="<s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{model.start_time})}"/>" class="bg" /></td>


				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					头等舱价格：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="first_price"
					value="<s:property value="model.first_price"/>" class="bg" /></td>
			</tr>
			<tr>
				
				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					到达时间：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="arrival_time" id="arrival_time"
					value="<s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{model.arrival_time})}"/>" class="bg" /></td>
				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					商务舱价格：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="business_price"
					value="<s:property value="model.business_price"/>" class="bg" /></td>
			</tr>
			
			<tr>
				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					机长：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="captain"
					value="<s:property value="model.captain"/>" class="bg" /></td>
				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					维修人员：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="maintenance_people"
					value="<s:property value="model.maintenance_people"/>" class="bg" /></td>
			</tr>
			<tr>
				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					航站楼：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="terminal_building"
					value="<s:property value="model.terminal_building"/>" class="bg" /></td>
				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					登机口：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="boarding_port"
					value="<s:property value="model.boarding_port"/>" class="bg" /></td>
			</tr>
			<tr>
				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					所属客机：</td>
			
				<td class="ta_01" bgColor="#ffffff" colspan="1">
				<select name="aircraft.aid">
					<s:iterator var="a" value="aList">
						<option value="<s:property value="#a.aid"/>"<s:if test="model.aircraft.aid==#a.aid">selected</s:if>><s:property value="#a.type"/></option>
					</s:iterator>
				</select>
				</td>
			
				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					备注：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="remark"
					value="<s:property value="model.remark"/>" class="bg" /></td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="submit" value="确定" class="button_ok">
						&#30830;&#23450;</button> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> <INPUT
					class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1"></span>
				</td>
			</tr>
		</table>
	</form>
</body>
</HTML>