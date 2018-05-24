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

<title>订单界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/login.js"></script>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css"/>
	
<script type="text/javascript">
/* function checkFrom() {
	//校验用户名
	//获得用户名文本框的值
	var cname = document.getElementById("cname").value;
	if (cname == null || cname == '') {
		alert("客户姓名不能为空");
		return false;
	}
	//校验密码
	//获得密码文本框的值
	var cpassword = document.getElementById("idcard").value;
	if (cpassword == null || cpassword == '') {
		alert("身份证不能为空");
		return false;
	}
	
} */
/* 
function payOrder(){
	
	window.location.href = "${pageContext.request.contextPath}/order_payOrder.action";
} */

function checkFrom(){
	var cname = document.getElementById("cname").value;
	if (cname == null || cname == '') {
		alert("客户姓名不能为空");
		return false;
	}
	var idcard = document.getElementById("idcard").value;
	if(idcard.length != 18){
		alert("身份证号码位数位18");
		return false;
	}
	
}
</script>

</head>

<body>

	<div class="container index">
		<%@ include file="menu.jsp"%>
	</div>
	<div class="container productList">
	<div class="span18 last" style="position:absolute;left:370;">
			
			<form id="orderForm" 
					action="${pageContext.request.contextPath }/order_saveOrder.action" 
					method="post"
					onsubmit="return checkFrom()">
				<input type="hidden" name="route.rid" value="<s:property value="model.rid"/>">
				<%-- <s:hidden name="route.rid" value="<s:property value='model.rid'/>"></s:hidden> --%>
				<div id="result" class="result table clearfix" style="margin: 0">
					<div class="form-group" align="center">
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">航班信息：</label>
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">
						<s:property value="model.aircraft.type"/>/<s:property value="model.aircraft.airline"/></label>
					</div>
					
				</div>
				<div id="result" class="result table clearfix" style="margin: 0">
					<div class="form-group" align="center">
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">航班日期：</label>
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">
						<s:property value="%{getText('{0,date,yyyy-MM-dd}',{model.flight_date})}"/></label>
						</div>
					
				</div>	
				<div id="result" class="result table clearfix" style="margin: 0">
					<div class="form-group" align="center">
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">城市区间：</label>
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">
						<s:property value="model.start_city"/>————<s:property value="model.arrival_city"/></label>
						
					</div>
					
				</div>
				<div id="result" class="result table clearfix" style="margin: 0">
					<div class="form-group" align="center">
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">出发时间：</label>
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">
						<s:property value="%{getText('{0,date,yy-MM-dd HH:mm:ss}',{model.start_time})}"/></label>
						
					</div>
					
				</div>
				<div id="result" class="result table clearfix" style="margin: 0">
					<div class="form-group" align="center">
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">到达时间：</label>
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">
						<s:property value="%{getText('{0,date,yy-MM-dd HH:mm:ss}',{model.arrival_time})}"/></label>
						
					</div>
					
				</div>
				<div id="result" class="result table clearfix" style="margin: 0">
					<div class="form-group" align="center">
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">登机信息：</label>
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">航站楼：
						<s:property value="model.terminal_building"/>/登机口：<s:property value="model.boarding_port"/></label>
					</div>					
				</div>
				<div id="result" class="result table clearfix" style="margin: 0">
					<div class="form-group" align="center">
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">价格：</label>
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5;color: red">${param.price}</label>
						<input type="hidden" name="price" value="${param.price}">
					</div>
					
				</div>
				<input type="button"
						style="width: 100px; height: 35px; line-height: 35px; margin-top: 5px; color: black; cursor: pointer; outline: none; blr: expression(this.hideFocus = true); border: none; background-color: #ffffff;"
						value="请输入乘客信息">
			<div>		
					<div id="result" class="result table clearfix" style="margin: 0">
						<div class="form-group" align="center">
							<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">乘客姓名：</label>
							<input type="text" 
							style="padding-top:20;padding-left:0;BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid" 
							name="cname" id="cname"/>
						</div>
						
					</div>
					<div id="result" class="result table clearfix">
						<div class="form-group" align="center">
							<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">乘客身份证：</label>
							<input type="text"  onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="18" placeholder="18位身份证号码" 
							style="padding-top:20;padding-left:0;BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid" 
							name="idcard" id="idcard"/>
						</div>
						
					</div>
			</div>
			<div id="result" class="result table clearfix" style="border: 0">
						<div class="form-group" align="center">
							<!-- <input type="button" class="btn btn-primary" onclick="payOrder()" value="确认支付">
							 --><input type="submit" class="btn btn-primary" value="提交订单">
							<input type="button" class="btn btn-primary" onclick="history.go(-1)" value="取消订单">
						</div>
					
					</div>
			
			</form>
		</div>
		</div>
	<%-- <form role="form" class="form-horizontal" method="post" id="addmo" action="${pageContext.request.contextPath }/order_saveOrder.action"
	onsubmit="return checkFrom()">
		<div class="modal-body">
			<div class="form-group">
				<label for="no"
					class="col-md-3 col-sm-3 col-md-offset-1 control-label right-block">航班编号：</label>
				<div class="col-md-4 col-sm-4">
					<input name="rid" id="rid" class="form-control" value="<s:property value="model.rid"/>">
				</div>
			</div>

			<div class="form-group">
				<label for="company"
					class="col-md-3 col-sm-3 col-md-offset-1 control-label right-block">日期：</label>
				<div class="col-md-4 col-sm-4">
					<input name="flight_date" id="flight_date" class="form-control" 
					value="<s:property value="%{getText('{0,date,yyyy-MM-dd}',{model.flight_date})}"/>">
				</div>
			</div>

			<div class="form-group">
				<label for="model"
					class="col-md-3 col-sm-3 col-md-offset-1 control-label right-block">航班机型：</label>
				<div class="col-md-4 col-sm-4">
					<input name="order.aircraft" id="aircraft.type" class="form-control" value="<s:property value="model.aircraft.type"/>">
					</div>
			</div>

			<div class="form-group">
				<label for="leaveCity"
					class="col-md-3 col-sm-3 col-md-offset-1 control-label right-block">出发城市：</label>
				<div class="col-md-4 col-sm-4">
					<input name="start_city" id="start_city" class="form-control" value="<s:property value="model.start_city"/>">
				</div>
			</div>

			<div class="form-group">
				<label for="arrivalCity"
					class="col-md-3 col-sm-3 col-md-offset-1 control-label right-block">到达城市：</label>
				<div class="col-md-4 col-sm-4">
					<input name="arrival_city" id="arrival_city" class="form-control" value="<s:property value="model.arrival_city"/>">
				</div>
			</div>

			<div class="form-group">
				<label
					class="col-md-3 col-sm-3 col-md-offset-1 control-label right-block">价格:</label>
				<div class="col-md-2 col-sm-2">
					<input type="text" name="price" id="price" value="${requestScope.price}" value="${param.price}"
						class="form-control" > 
				</div>
			</div>

			<div class="form-group">
				<label for="leaveTime"
					class="col-md-3 col-sm-3 col-md-offset-1 control-label">出发时间:</label>
				<div class="col-md-4 col-sm-4">
					<input class="form-control" size="16" type="text" readonly
						id="start_time"name="start_time" 
						value="<s:property value="%{getText('{0,date,yy-MM-dd HH:mm:ss}',{model.start_time})}"/>">
				</div>
				<input type="hidden" /><br/>
			</div>

			<div class="form-group">
				<label for="arrivalTime"
					class="col-md-3 col-sm-3 col-md-offset-1 control-label">到达时间:</label>
				<div class="col-md-4 col-sm-4">
					<input class="form-control" size="16" type="text" readonly
						id="arrival_time" name="arrival_time" 
						value="<s:property value="%{getText('{0,date,yy-MM-dd HH:mm:ss}',{model.arrival_time})}"/>">
				</div>
				
				<input type="hidden" value="" /><br />
			</div>
			<div class="form-group">
				<label
					class="col-md-3 col-sm-3 col-md-offset-1 control-label right-block">客户姓名:</label>
				<div class="col-md-2 col-sm-2">
					<input type="text" name="cname" id="cname"
						class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label
					class="col-md-3 col-sm-3 col-md-offset-1 control-label right-block">身份证号:</label>
				<div class="col-md-2 col-sm-2">
					<input type="text" name="idcard" id="idcard"
						class="form-control">
				</div>
			</div>
			<input type="hidden" name="cid" id="cid"
						class="form-control" value="#session.existCustomer.cid">
		</div>
		<div class="modal-footer">
			<div class="form-group">
				<div class="col-md-1 col-md-offset-4">
					<input type="submit" class="btn btn-primary" value="提交订单">
				</div>
				<div class="col-md-1 col-md-offset-2">
					<input type="button" class="btn btn-primary" onclick="history.go(-1)" value="取消订单">
				</div>
			</div>
		</div>
	</form> --%>
</body>
</html>
