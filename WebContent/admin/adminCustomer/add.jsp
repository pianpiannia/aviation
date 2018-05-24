<%@ page language="java" pageEncoding="UTF-8"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/css/Style1.css"
	type="text/css" rel="stylesheet">
</HEAD>
<body>
	<form id="adminAircraft_save_do" name="Form1"
		action="${pageContext.request.contextPath}/adminCustomer_save.action"
		method="post">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>添加客户</STRONG> </strong></td>
			</tr>

			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					客户名称：</td>
				<td class="ta_01" bgColor="#ffffff" colspan=1"><input
					type="text" name="cname" value="" class="bg" /></td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					客户密码：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="cpassword" value="" class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					性别：</td>
				<td class="ta_01" bgColor="#ffffff" colspan=1"><input
					type="text" name="sex" value="" class="bg" /></td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					身份证号码：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="idcard" value="" class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					联系方式：</td>
				<td class="ta_01" bgColor="#ffffff" colspan=1"><input
					type="text" name="phone" value="" class="bg" /></td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					是否黑名单客户：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="text" name="sign" value="" class="bg" /></td>
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