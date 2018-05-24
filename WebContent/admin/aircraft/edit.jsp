<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/css/Style1.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/laydate/laydate.js"></script>
<script>
	laydate.render({
		elem : '#purchaseTime' //指定元素
	});
	laydate.render({
		elem : '#serviceTime' //指定元素
	});
	laydate.render({
		elem : '#repair_time' //指定元素
	});
</script>
</HEAD>

<body>
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/adminAircraft_update.action"
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="aid"
			value="<s:property value="model.aid"/>" /> &nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>编辑客机信息</STRONG> </strong></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					购入时间：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="purchaseTime" id="purchaseTime"
					value="<s:property value="model.purchaseTime"/>" class="bg" /></td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					服役时间：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="serviceTime" id="serviceTime"
					value="<s:property value="model.serviceTime"/>" class="bg" /></td>
			</tr>
			<tr>

				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					头等舱数量：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="hidden" name="airline"
					value="<s:property value="model.airline"/>" /><input
					type="hidden" name="number"
					value="<s:property value="model.number"/>" /> <input type="hidden"
					name="type" value="<s:property value="model.type"/>" /> <input
					type="text" name="firstClass"
					value="<s:property value="model.firstClass"/>" class="bg" /></td>
				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					经济舱数量：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="touristClass"
					value="<s:property value="model.touristClass"/>" class="bg" /></td>
			</tr>
			<tr>
				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					商务舱数量：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="businessClass"
					value="<s:property value="model.businessClass"/>" class="bg" /></td>
				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					维修次数：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="frequency"
					value="<s:property value="model.frequency"/>" class="bg" /></td>
			</tr>
			<tr>
				<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
					维修时间：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" id="repair_time" name="repair_time"
					value="<s:property value="%{getText('{0,date,yyyy-MM-dd}',{model.repair_time})}"/>" class="bg" /></td>

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