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

<title>航空信息首页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet" type="text/css" />
	
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/laydate/laydate.js"></script>
<script type="text/javascript">
	function showDate(){
	   var today = new Date();
	   year = today.getFullYear();
	   month = today.getMonth() + 1;
	   date = today.getDate()+1;
	   document.getElementById("flight_date").value=year+"-"+month+"-"+date;
	}
	
	function checkForm(){
		var start_city = document.getElementById("start_city").value;
		if(start_city==null || start_city==''){
			alert("请输入出发城市");
			return false;
		}
		
		var arrival_city = document.getElementById("arrival_city").value;
		if(arrival_city==null || arrival_city==''){
			alert("请输入到达城市");
			return false;
		}
	}
</script>
<script>
	laydate.render({
		  elem: '#flight_date' //指定元素
	});
</script>
</head>
<body onload="showDate()">
<div class="container index">
	<%@ include file="menu.jsp" %>
</div>	
	
	<div class="container login" style="position:absolute;left:150px;top:200px">
		
		<div class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong>航班预定</strong>
					</div>
					<form action="${pageContext.request.contextPath }/route_findMoreCondition.action" 
						method="post"
						onsubmit="return checkForm()">
						<table>
							<tbody>
								<tr>
									<th>出发城市:</th>
									<td><input type="text" name="start_city" id="start_city"
										class="text" value="北京"></td>
								</tr>
								<tr>
									<th>到达城市:</th>
									<td><input type="text" name="arrival_city" id="arrival_city"
										class="text"></td>
								</tr>

								<tr>
									<th>出发日期:</th>
									<td><input type="text" id="flight_date" name="flight_date"
										class="text"></td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td><input type="submit" class="submit" value="立即查询">
									</td>
								</tr>
								
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div style="position: absolute; left: 700px">
		<a
			href="${pageContext.request.contextPath }/route_findAll.action?page=1">
			<img src="imgs/index.jpg" alt="">
		</a>
	</div>

</body>
</html>
