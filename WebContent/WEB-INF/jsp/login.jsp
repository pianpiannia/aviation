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

<title>注册</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet" type="text/css" />


</head>
<body>
	<div class="container index">
		<%@ include file="menu.jsp" %>
	</div>
	<div class="container login" style="position:absolute;left:450px;top:200px">
		
		<div class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong>客户登录</strong>USER LOGIN
					</div>
					<div style="position:absolute;left:110px;top:45px;color: red">
						<s:actionerror />
					</div>
					<form id="loginForm"
						action="${pageContext.request.contextPath }/customer_login.action"
						method="post" novalidate="novalidate">
						<table>
							<tbody>
								<tr>
									<th>用户名:</th>
									<td><input type="text" id="username" name="cname"
										class="text" maxlength="20" autocomplete="off"></td>
								</tr>
								<tr>
									<th>密&nbsp;&nbsp;码:</th>
									<td><input type="password" id="password" name="cpassword"
										class="text" maxlength="20" autocomplete="off"></td>
								</tr>

								<tr>
									<th>&nbsp;</th>
									<td><label> <input type="checkbox"
											id="isRememberUsername" name="isRememberUsername"
											value="true">记住用户名
									</label></td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td><input type="submit" class="submit" value="登 录">
									</td>
								</tr>
								<tr class="register">
									<th>&nbsp;</th>
									<td>
										<dl>
											<dt>还没有注册账号？</dt>
											<dd>
												立即注册即可体验航班预定！ <a href="${pageContext.request.contextPath }/customer_registPage.action">立即注册</a>
											</dd>
										</dl>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
