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
	function addRoute() {
		window.location.href = "${pageContext.request.contextPath}/adminRoute_toAddPage.action";
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
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>航线列表</strong></TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="添加"
							class="button_add" onclick="addRoute()">&#28155;&#21152;</button>
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
								<td align="center" width="5%">出发城市</td>
								<td align="center" width="5%">到达城市</td>
								<td align="center" width="10%">航班日期</td>
								<td align="center" width="10%">出发时间</td>
								<td align="center" width="10%">到达时间</td>
								<td align="center" width="8%">头等舱价格</td>
								<td align="center" width="8%">经济舱价格</td>
								<td align="center" width="8%">商务舱价格</td>
								<td align="center" width="5%">所属客机</td>
								<td align="center" width="5%">机长</td>
								<td align="center" width="5%">检修人员</td>
								<td align="center" width="5%">航站楼</td>
								<td align="center" width="5%">登机口</td>
								<td align="center" width="8%">备注</td>
								<td width="7%" align="center">编辑</td>
								<td width="7%" align="center">删除</td>
							</tr>
							<s:iterator var="r" value="rList" status="status">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="5%"><s:property value="#status.count" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="5%"><s:property value="#r.start_city" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="5%"><s:property value="#r.arrival_city" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="10%"><s:date name="flight_date" format="yyyy-MM-dd" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="10%"><s:date name="start_time" format="MM-dd HH:mm" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="10%"><s:date name="arrival_time" format="MM-dd HH:mm" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%"><s:property value="#r.first_price" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%"><s:property value="#r.tourist_price" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%"><s:property value="#r.business_price" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="5%"><s:property value="#r.aircraft.type" /></td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="5%"><s:property value="#r.captain" /></td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="5%"><s:property value="#r.maintenance_people" /></td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="5%"><s:property value="#r.terminal_building" /></td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="5%"><s:property value="#r.boarding_port" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%"><s:property value="#r.remark" /></td>
									<td align="center" style="HEIGHT: 22px"><a
										href="${pageContext.request.contextPath}/adminRoute_edit.action?rid=<s:property value="#r.rid"/>">
											<img
											src="${pageContext.request.contextPath}/images/i_edit.gif"
											border="0" style="CURSOR: hand">
									</a></td>

									<%-- <td align="center" style="HEIGHT: 22px"><a
										href="${pageContext.request.contextPath}/adminRoute_delete.action?rid=<s:property value="#r.rid"/>">
											<img
											src="${pageContext.request.contextPath}/images/i_del.gif"
											width="16" height="16" border="0" style="CURSOR: hand">
									</a></td> --%>
									
									<td align="center" style="HEIGHT: 22px"><a
										href="javascript:void(0)" onclick="del()">
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
<script type="text/javascript">
function del(){
	var msg = "您真的确定要删除吗？"; 
	if (confirm(msg)==true){ 
		window.location.href = "${pageContext.request.contextPath}/adminRoute_delete.action?rid=<s:property value="#r.rid"/>"; 
	}else{ 
	return false; 
}
}
</script>
</HTML>

