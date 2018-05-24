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
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css" />

<script>
	function checkFrom() {
		//校验用户名
		//获得用户名文本框的值
		var cname = document.getElementById("username").value;
		if (cname == null || cname == '') {
			alert("用户名不能为空");
			return false;
		}
		//校验密码
		//获得密码文本框的值
		var cpassword = document.getElementById("password").value;
		if (cpassword == null || cpassword == '') {
			alert("密码不能为空");
			return false;
		}
		if(cpassword.length()<6){
			alert("密码长度不能小于6！");
			return false;
		}
		
		//校验确认密码
		var repassword = document.getElementById("repassword").value;
		if (repassword != cpassword) {
			alert("两次密码输入不一致");
			return false;
		}
		
	}
	
	function checkPassword(){
		var cpassword = document.getElementById("password").value;
		var span2 = document.getElementById("span2");
		if(cpassword.length>0 && cpassword.length<6){
			 span2.innerHTML = "密码长度不能小于6！";
		} 
		else { span2.innerHTML = ""; }

	}
	
	function surePassword(){
		
		//获得密码文本框的值
		var cpassword = document.getElementById("password").value;
		//获得确认密码框内容
		var repassword = document.getElementById("repassword").value;
		
		var span3 = document.getElementById("span3");
		if (repassword != cpassword) {
			span3.innerHTML = "两次密码输入不一致！";
		}else{ span3.innerHTML = "";		}
	}

	function checkCustomername() {
		//获得文本框的值
		var cname = document.getElementById("username").value;
		//传统Ajax校验
		//1.创建异步交互对象
		var xhr = createXmlHttp();
		//2.设置监听
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					document.getElementById("span1").innerHTML = xhr.responseText;
				}
			}
		}
		//3.打开链接
		xhr.open("GET",
						"${pageContext.request.contextPath}/customer_findByName.action?time="
								+ new Date().getTime() + "&cname="
								+ cname, true);
		//4.发送
		xhr.send(null);
	}
	function createXmlHttp() {
		var xmlHttp;
		try {
			xmlHttp = new XMLHttpRequest();
		} catch (e) {
			try {
				xmlHttp = new ActiveXObject("Msxm12.XMLHTTP");
			} catch (e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
				}
			}
		}
		return xmlHttp;
	}

	function change() {
		var img1 = document.getElementById("checkImg");
		img1.src = "${pageContext.request.contextPath}/checkImg.action?"
				+ new Date().getTime();
	}
</script>
</head>
<body>
	<div class="container index">
		<%@ include file="menu.jsp" %>
	</div>

	<!-- 用户注册 -->

	<div class="container register" style="position:absolute;left:200px">
		<div class="span24">
			<div class="wrap">
				<div class="main clearfix">
					<div class="title">
						<strong>用户注册</strong>USER REGISTER
					</div>
					<div>
						<s:actionerror />
					</div>
					<form id="registerForm"
						action="${pageContext.request.contextPath }/customer_regist.action"
						method="post" novalidate="novalidate"
						onsubmit="return checkFrom()">
						<table>
							<tbody>
								<tr>
									<th><span class="requiredField">*</span>用户名:</th>
									<td><input type="text" id="username" name="cname"
										class="text" maxlength="20" onblur="checkCustomername()"/>
										<span id="span1"></span></td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>密&nbsp;&nbsp;码:</th>
									<td><input type="password" id="password" name="cpassword"
										class="text"  maxlength="20" autocomplete="off" onblur="checkPassword()"/> <span id="span2"></span></td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>确认密码:</th>
									<td><input type="password" id="repassword"
										name="repassword" class="text" maxlength="20"
										autocomplete="off" onblur="surePassword()"/><span id="span3"></span></td>
								</tr>
								<%-- <tr>
									<th><span class="requiredField">*</span>E-mail:</th>
									<td><input type="text" id="email" name="email"
										class="text" maxlength="200"/> <span><s:fielderror
												fieldName="email" /></span></td>
								</tr> --%>
								
								<!-- <tr>
									<th>性别:</th>
									<td><input type="radio" name="sex" value="男">男
										<input type="radio" name="sex" value="女">女
									</td>
								</tr>
								<tr>
									<th>电话:</th>
									<td><input type="text" name="phone" class="text"/></td>
								</tr> -->


								<tr>
									<th><span class="requiredField">*</span>验证码:</th>
									<td><span class="fieldSet"> <input type="text"
											id="checkcode" name="checkcode" class="text captcha"
											maxlength="4" autocomplete="off"/> <img id="checkImg"
											class="captchaImage"
											src="${pageContext.request.contextPath}/checkImg.action"
											onclick="change()" title="点击更换验证码"></span></td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td><input type="submit" class="submit" value="注册"/></td>
								</tr>
								
							</tbody>
						</table>
						<div class="login">

							<dl>
								<dt>已经拥有账号了？</dt>
								<dd>
									立即登录即可体验航空出行！<a href="${pageContext.request.contextPath }/customer_loginPage.action">立即登录</a>
								</dd>
							</dl>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
