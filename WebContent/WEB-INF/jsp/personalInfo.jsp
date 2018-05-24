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

<title>个人信息页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="-10">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript"
	src="bootstrap/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript"
	src="bootstrap/js/locales/bootstrap-datetimepicker.zh-CN.js"
	charset="UTF-8"></script>
<script type="text/javascript" src="js/login.js"></script>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/css/common.css"
	rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css"/>
	
</head>

<body>
	<div class="container index">
		<%@ include file="menu.jsp"%>
	</div>
	
		<div class="container productList">
		<div class="span6" style="position:absolute;left:140;">
			<div class="hotProductCategory" style="padding-left: 70">
				
						<dl>
						<dt style="padding-top:20;padding-bottom: 20">
								<a href="${pageContext.request.contextPath }/customer_toPersonalInfo.action">基本资料</a>
							</dt>
							<dt style="padding-top:20;padding-bottom: 20">
								<a href="${pageContext.request.contextPath }/customer_toCompleteInfo.action">完善个人信息</a>
							</dt>
							<dt style="padding-top:20;padding-bottom: 20">
								<a href="${pageContext.request.contextPath }/customer_toPasswordInfo.action">修改密码</a>
							</dt>
							
						</dl>		
			</div>
			<div class="hotProductCategory" style="padding: 0">
				<img alt="info" width="230" height="250" src="${pageContext.request.contextPath }/imgs/info.jpg">
						</div>
		</div>
		<div class="span18 last" style="position:absolute;left:370;">
			
			<form id="productForm" action="" method="get">
					
				<div id="result" class="result table clearfix">
					<div class="form-group" align="center">
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">用户名：</label>
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5"><s:property value="model.cname"/></label>
					</div>
					
				</div>
				<div id="result" class="result table clearfix">
					<div class="form-group" align="center">
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">真实姓名：</label>
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5"><s:property value="model.name"/></label>
					</div>
					
				</div>	
				<div id="result" class="result table clearfix">
					<div class="form-group" align="center">
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">身份证：</label>
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5"><s:property value="model.idcard"/></label>
					</div>
					
				</div>
				<div id="result" class="result table clearfix">
					<div class="form-group" align="center">
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">手机号：</label>
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5"><s:property value="model.phone"/></label>
					</div>
					
				</div>
				<div id="result" class="result table clearfix">
					<div class="form-group" align="center">
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5">性别：</label>
						<label class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block" style="height: 50;line-height: 5"><s:property value="model.sex"/></label>
					</div>
					
				</div>
			</form>
		</div>
	</div>
	

</body>
</html>
