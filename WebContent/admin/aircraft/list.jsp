<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="${pageContext.request.contextPath}/js/public.js"></script>
<script type="text/javascript">
	function addAircraft() {
		window.location.href = "${pageContext.request.contextPath}/admin/aircraft/add.jsp";
	}
</script>
</HEAD>
<body>
	<br>
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/user/list.jsp"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>客机列表</strong></TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="添加"
							class="button_add" onclick="addAircraft()">&#28155;&#21152;</button>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

								<td align="center" width="5%">序号</td>
								<td align="center" width="8%">航空公司</td>
								<td align="center" width="8%">客机类型</td>
								<td align="center" width="10%">购买时间</td>
								<td align="center" width="10%">服役时间</td>
								<td align="center" width="8%">头等舱数量</td>
								<td align="center" width="8%">经济舱数量</td>
								<td align="center" width="8%">商务舱数量</td>
								<td align="center" width="10%">维修时间</td>
								<td align="center" width="5%">维修次数</td>
								<td align="center" width="10%">备注</td>
								<td width="7%" align="center">编辑</td>
								<td width="7%" align="center">删除</td>
							</tr>
							<s:iterator var="a" value="aList" status="status">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="5%"><s:property value="#status.count" /></td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%"><s:property value="#a.airline" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%"><s:property value="#a.type" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="10%"><s:property value="#a.purchaseTime" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="10%"><s:property value="#a.serviceTime" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%"><s:property value="#a.firstClass" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%"><s:property value="#a.touristClass" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%"><s:property value="#a.businessClass" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="10%"><%-- <s:property value="#a.repair_time" /> --%>
										<s:date name="repair_time" format="yyyy-MM-dd" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="5%"><s:property value="#a.frequency" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="10%"><s:property value="#a.remark" /></td>
									<td align="center" style="HEIGHT: 22px"><a
										href="${pageContext.request.contextPath}/adminAircraft_edit.action?aid=<s:property value="#a.aid"/>">
											<img
											src="${pageContext.request.contextPath}/images/i_edit.gif"
											border="0" style="CURSOR: hand">
									</a></td>

									<td align="center" style="HEIGHT: 22px"><a
										href="${pageContext.request.contextPath}/adminAircraft_delete.action?aid=<s:property value="#a.aid"/>">
											<img
											src="${pageContext.request.contextPath}/images/i_del.gif"
											width="16" height="16" border="0" style="CURSOR: hand">
									</a></td>
								</tr>
							</s:iterator>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</HTML>

