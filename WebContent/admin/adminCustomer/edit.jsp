<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
	</HEAD>
	
	<body>
		<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/adminCustomer_update.action" method="post" enctype="multipart/form-data">
			<input type="hidden" name="cid" value="<s:property value="model.cid"/>"/>
			&nbsp;
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>修改客户信息</STRONG>
						</strong>
					</td>	
				</tr>
	
				<tr>
					<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
						客户名称：
					</td>			
					<td class="ta_01" bgColor="#ffffff" colspan="1">
						<input type="text" readonly="readonly" name="cname" value="<s:property value="model.cname"/>" class="bg"/>
					</td>
					<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
						客户密码：
					</td>			
					<td class="ta_01" bgColor="#ffffff" colspan="1">
						<input type="password" readonly="readonly" name="cpassword" value="<s:property value="model.cpassword"/>" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
						性别：
					</td>			
					<td class="ta_01" bgColor="#ffffff" colspan="1">
						<input type="text" readonly="readonly" name="sex" value="<s:property value="model.sex"/>" class="bg"/>
					</td>
					<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
						身份证号码：
					</td>			
					<td class="ta_01" bgColor="#ffffff" colspan="1">
						<input type="text" readonly="readonly" name="idcard" value="<s:property value="model.idcard"/>" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
						联系方式：
					</td>			
					<td class="ta_01" bgColor="#ffffff" colspan="1">
						<input type="text" readonly="readonly" name="phone" value="<s:property value="model.phone"/>" class="bg"/>
					</td>
					<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
						是否黑名单客户：
					</td>			
					<td class="ta_01" bgColor="#ffffff" colspan="1">
						<input type="text" name="sign" value="<s:property value="model.sign"/>" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
						真实姓名：
					</td>			
					<td class="ta_01" bgColor="#ffffff" colspan="1">
						<input type="text" readonly="readonly" name="name" value="<s:property value="model.name"/>" class="bg"/>

				</tr>

			
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<button type="submit" value="确定" class="button_ok">
							&#30830;&#23450;
						</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>