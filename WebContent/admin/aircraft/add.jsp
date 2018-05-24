<%@ page language="java" pageEncoding="UTF-8"%>
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
	  elem: '#purchaseTime' //指定元素
	});
	laydate.render({
		elem: '#serviceTime' //指定元素
	});
</script>
<body>
	<form id="adminAircraft_save_do" name="Form1"
		action="${pageContext.request.contextPath}/adminAircraft_save.action"
		method="post">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>添加客机</STRONG> </strong></td>
			</tr>

			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					客机编号：</td>
				<td class="ta_01" bgColor="#ffffff" colspan=1"><input
					type="text" name="number" value="" class="bg" /></td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					客机类型：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="type" value="" class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					购入时间：</td>
				<td class="ta_01" bgColor="#ffffff" colspan=1"><input
					type="text" name="purchaseTime" id="purchaseTime" value="" class="bg" /></td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					服役时间：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="serviceTime" id="serviceTime" value="" class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					头等舱数量：</td>
				<td class="ta_01" bgColor="#ffffff" colspan=1"><input
					type="text" name="firstClass" value="" class="bg" /></td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					经济舱数量：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="touristClass" value="" class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					商务舱数量：</td>
				<td class="ta_01" bgColor="#ffffff" colspan=1"><input
					type="text" name="businessClass" value="" class="bg" /></td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					所属航空公司：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="airline" value="" class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					备注：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="remark" value="" class="bg" /></td>
			</tr>
			
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="submit"value="确定"
						class="button_ok">&#30830;&#23450;</button> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
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