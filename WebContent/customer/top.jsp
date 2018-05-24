<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet" type="text/css" />
	
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/laydate/laydate.js"></script>

</head>
<body>
<div class="container">
   		<div class="row col-md-12">
   		<img src="${pageContext.request.contextPath }/imgs/headerlogo.jpg" width="100%">
   	</div>
   	</div>
<div class="container">
	<div class="row">
		<div class="col-md-9">
		<s:if test="#session.existCustomer == null">
			<ul class="nav nav-pills">
				<li class="active"><a
					href="${pageContext.request.contextPath }/index_index.action" target="_new">首页</a></li>
				<li><a
					href="${pageContext.request.contextPath }/route_findAll.action?page=1">机票</a></li>
			</ul>
			</s:if>
			<s:else>
			<ul class="nav nav-pills">
				<li class="active"><a
					href="${pageContext.request.contextPath }/index_index.action">首页</a></li>
				<li><a
					href="${pageContext.request.contextPath }/route_findAll.action?page=1">机票</a></li>
				
				<li><a
					href="${pageContext.request.contextPath }/order_toMyOrder.action?page=1">我的订单</a></li>
				<li><a
					href="${pageContext.request.contextPath }/customer_toPersonalInfo.action">我的信息</a></li>
			</ul></s:else>
		</div>
		<div class="col-md-3">
			<ul class="nav nav-pills">
			<s:if test="#session.existCustomer == null">
				<li><a href="${pageContext.request.contextPath }/customer_loginPage.action">登陆</a></li>
				
				<li><a href="${pageContext.request.contextPath }/customer_registPage.action">注册</a></li>
			</s:if>
			<s:else>
				<li><a><s:property value="#session.existCustomer.cname"/></a></li>
				<li><a href="${pageContext.request.contextPath }/customer_quit.action">退出</a></li>
			</s:else>	
			</ul>
		</div>
	</div>

	
	
</div>
</body>
</html>