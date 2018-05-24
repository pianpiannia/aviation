<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>我的订单查看和退票界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/login.js"></script>

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">

<link href="${pageContext.request.contextPath }/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/cart.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
</head>

<body>
	<div class="container index">
	<%@ include file="menu.jsp" %>
	</div>
<div class="container">
	<div class="cart" style="position: absolute; left: 120px">

		<div class="span24" style="width: 1110px;">
			<div class="step step1">
				<ul>
					<li style="color: red; font-size: 20">我的订单</li>
				</ul>
			</div>
		
			<table>
				<tbody>
					<s:iterator var="order" value="pageBean.list">
					
						<tr>
							<th colspan="8">订单编号:<s:property value="#order.oid" />&nbsp;&nbsp;&nbsp;&nbsp;订单金额:<font
								color="red"><s:property value="#order.price" /> </font>
								&nbsp;&nbsp;&nbsp;&nbsp;
								
								<s:if test="#order.state == 1">
									<input style="border: 0;color: red;background-color: #FAFAFA" type="button" onclick="surepay()" value="未付款，去付款">
									<script type="text/javascript">
										function surepay(){
											var con = confirm("确认付款吗？");
											if(con==true){
												window.location.href="${pageContext.request.contextPath }/order_goPayOrder.action?oid=<s:property value="#order.oid" />";
											}
										}
									</script>
										<%-- <a style="color: red" href="${pageContext.request.contextPath }/order_goPayOrder.action?oid=<s:property value="#order.oid" />">未付款，去付款</a>
										 --%>
										 
									<input style="position: absolute;right:80;border: 0;color: red;background-color: #FAFAFA" type="button" onclick="surecanael()" value="取消订单">
									<script type="text/javascript">
										function surecanael(){
											var con = confirm("确认取消吗？");
											if(con==true){
												window.location.href="${pageContext.request.contextPath }/order_cancelOrder.action?oid=<s:property value="#order.oid" />";
											}
										}
									</script>
										<%-- <a style="position: absolute;right:80;color:red" href="${pageContext.request.contextPath }/order_cancelOrder.action?oid=<s:property value="#order.oid" />">取消订单</a> --%>
								</s:if> 
								<s:if test="#order.state == 2">
									已付款,<input style="border: 0;color: red;background-color: #FAFAFA" type="button" onclick="sure()" value="确认完成">
									<script type="text/javascript">
										function sure(){
											var con = confirm("确认完成吗？");
											if(con==true){
												window.location.href="${ pageContext.request.contextPath }/order_updateState.action?oid=<s:property value="#order.oid" />";
											}
										}
									</script><%-- <a style="color: red" href="${ pageContext.request.contextPath }/order_updateState.action?oid=<s:property value="#order.oid" />">确认完成</a>
									 --%>
								</s:if> <s:if test="#order.state == 3">
									已完成
								</s:if>
								
							</th>
						</tr>
						<tr>

							<th width="8%">航班号</th>
							<th width="5%">机型</th>
							<th width="10%">航空公司</th>
							<th width="10%">航班日期</th>
							<th width="20%">城市区间</th>
							<th width="5%">航站楼</th>
							<th width="5%">登机口</th>
							<th width="20%">时间区间</th>
						</tr>
						<tr>

							<td width="8%" align="center"><s:property value="#order.route.rid" /></td>
							<td width="5%" align="center"><s:property
									value="#order.route.aircraft.type" /></td>
							<td width="10%" align="center"><s:property
									value="#order.route.aircraft.airline" /></td>
							<td width="10%" align="center"><s:property
									value="%{getText('{0,date,yyyy-MM-dd}',{#order.route.flight_date})}" /></td>
							<td width="20%" align="center"><s:property
									value="#order.route.start_city" />————<s:property
									value="#order.route.arrival_city" />
							<td width="10%" align="center"><s:property
									value="#order.route.terminal_building" /></td>
							<td width="10%" align="center"><s:property
									value="#order.route.boarding_port" /></td>
							<td width="20%" align="center"><s:property
									value="%{getText('{0,date,MM-dd HH 时mm 分}',{#order.route.start_time})}" />————<s:property
									value="%{getText('{0,date,MM-dd HH 时mm 分}',{#order.route.arrival_time})}" />
							</td>
						</tr>
		
		
					</s:iterator>
					
					<tr>
						<th colspan="8">
							<div class="pagination">
								<span>第<s:property value="pageBean.page" />/<s:property
										value="pageBean.totalPage" />页
								</span>

								<s:if test="pageBean.page != 1">
									<a
										href="${pageContext.request.contextPath }/order_toMyOrder.action?&page=1"
										class="firstPage">&nbsp;</a>
									<a
										href="${pageContext.request.contextPath }/order_toMyOrder.action?&page=<s:property value="pageBean.page-1"/>"
										class="previousPage">&nbsp;</a>
								</s:if>
								<s:iterator var="i" begin="1" end="pageBean.totalPage">
									<s:if test="pageBean.page != #i">
										<a
											href="${pageContext.request.contextPath }/order_toMyOrder.action?&page=<s:property value="#i"/>"><s:property
												value="#i" /></a>
									</s:if>
									<s:else>
										<span class="currentPage"><s:property value="#i" /></span>
									</s:else>
								</s:iterator>
								<s:if test="pageBean.page != pageBean.totalPage">
									<a class="nextPage"
										href="${pageContext.request.contextPath }/order_toMyOrder.action?&page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
									<a class="lastPage"
										href="${pageContext.request.contextPath }/order_toMyOrder.action?&page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
								</s:if>


							</div>
						</th>
					</tr>
				</tbody>
			</table>

		
		</div>

	</div></div>
</body>
</html>
