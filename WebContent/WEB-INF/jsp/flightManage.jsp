<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>航班管理主界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/cart.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/laydate/laydate.js"></script>
<script type="text/javascript">
	
	function goOrder(rid) {
		$("#addtjia").modal("show");
		var routeitem = document.getElementById("routeitem");
		// 1.创建异步对象
		var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){	
					routeitem.innerHTML = xhr.responseText;
				}
			}
		}
		// 3.打开连接
		xhr.open("GET","${pageContext.request.contextPath}/route_findByRid.action?rid="+rid+"&time="+new Date().getTime(),true);
		// 4.发送
		xhr.send(null);
			
	}
	
	function createXmlHttp(){
		   var xmlHttp;
		   try{ // Firefox, Opera 8.0+, Safari
		        xmlHttp=new XMLHttpRequest();
		    }
		    catch (e){
			   try{// Internet Explorer
			         xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			      }
			    catch (e){
			      try{
			         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			      }
			      catch (e){}
			      }
		    }

			return xmlHttp;
		 }
</script>
<script>
	laydate.render({
	  elem: '#flight_date' //指定元素
	});
</script>
<style>
div.cart table {
	width: 100%;
	margin-bottom: 10px;
}

div.cart table th {
	line-height: 36px;
	padding: 0px 6px;
	color: #999999;
	font-weight: normal;
	text-align: center;
	border: solid 1px #e6e4e3;
	background-color: #fafafa;
}

div.cart table td {
	line-height: 40px;
	padding: 10px;
	border: solid 0px #f1f1f1;
}

div.cart dl {
	height: 20px;
	line-height: 20px;
	padding: 4px 10px;
	margin-bottom: 10px;
	border: solid 1px #f1f1f1;
}

div.cart dt {
	float: left;
	margin-right: 10px;
	font-weight: bold;
}

div.cart dd {
	float: left;
	margin-right: 10px;
}

div.query table input {
	width: 100px;
	height: 22px;
	line-height: 22px;
	padding: 10px;
	margin: 8px 4px; #
	margin: -1px 4px;
	_margin: -1px 4px;
	text-align: left;
	vertical-align: middle;
	ime-mode: disabled;
	border: 1px solid #cccccc;
}

div.query table td {
	padding-left: 20;
}
</style>

</head>

<body>

	<div class="container index">
		<%@ include file="menu.jsp"%>
	</div>

	<div class="container">
		<form
			action="${pageContext.request.contextPath }/route_findMoreCondition.action?page=1"
			class="form-horizontal" role="form">
			<div class="query" style="padding-left: 100">
				<table>
					<tr>
						<td><label>出发城市：</label></td>
						<td><input name="start_city" id="start_city"
							placeholder="出发城市"></td>

						<td><label>到达城市：</label></td>
						<td><input name="arrival_city" id="arrival_city"
							placeholder="到达城市"></td>

						<td><label>出发日期：</label></td>
						<td><input name="flight_date" id="flight_date"
							placeholder="出发日期"></td>

						<td><input type="submit"
							style="width: 100px; height: 24px; line-height: 22px; padding: 0px 4px; text-align: center; color: #ffffff; cursor: pointer; outline: none; blr: expression(this.hideFocus = true); border: none; vertical-align: middle; background-color: #2F75A8;"
							value="查询"></td>

					</tr>

				</table>
			</div>
		</form>

		<div class="cart" style="position: absolute; left: 128px">
			<div class="span24" style="width: 1110px;">
				<table>
					<tbody>
						<tr>
							<th width="8%">机型</th>
							<th width="6%">航空公司</th>
							<th width="10%">航班日期</th>
							<th width="15%">城市区间</th>
							<th width="20%">时间区间</th>
							<th width="5%">价格</th>
							<th width="5%">预定</th>
						</tr>
						<s:iterator var="route" value="pageBean.list">
							<tr>

								<td width="8%" align="center"><s:property 
										value="#route.aircraft.type" /></td>
								<td width="6%" align="center"><s:property
										value="#route.aircraft.airline" /></td>
								<td width="10%" align="center"><s:property
										value="%{getText('{0,date,yyyy-MM-dd}',{#route.flight_date})}" /></td>
								<td width="15%" align="center"><s:property
										value="#route.start_city" />————<s:property
										value="#route.arrival_city" />
								<td width="20%" align="center"><s:property
										value="%{getText('{0,date,MM-dd HH 时mm 分}',{#route.start_time})}" />————<s:property
										value="%{getText('{0,date,MM-dd HH 时mm 分}',{#route.arrival_time})}" />
								</td>
								<td width="8%" align="center"><s:property
										value="#route.tourist_price" /></td>
								<td width="5%" align="center"><a href="javaScript:void(0)"
									onclick="goOrder(<s:property value="#route.rid" />)">去订票</a> 
									<!-- <button onclick="dotjia()">去订票</button> -->

								</td>

							</tr>
						</s:iterator>
						<%-- <tr>
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
						</tr> --%>
					</tbody>
				</table>

			</div>

		</div>
	</div>
	<div class="modal fade" id="addtjia" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal" onclick="doAddSBoard()">X</button>
					<h2 class="text-center">机票预定</h2>
				</div>
				
			<form role="form" class="form-horizontal" method="post" id="addmo" return="return false;">
				<div id="routeitem"></div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>
