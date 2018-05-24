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
<link href="${pageContext.request.contextPath}/css/product.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript">
	function checkFrom() {
		oldpassword
		//校验旧密码
		//原密码
		var oldpassword = document.getElementById("oldpassword").value;
		var pas = '<s:property value="#session.existCustomer.cpassword"/>';
		if(oldpassword!=pas)
        {
			/* //传统Ajax校验
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
						"${pageContext.request.contextPath}/customer_toChangePage, true);
			//4.发送
			xhr.send(null); */
           	alert("旧密码输入不正确");
           	return false;
        }
		
		//检验新密码
		//获得新密码文本框的值
		var cpassword = document.getElementById("cpassword").value;
		
		if (cpassword == null || cpassword == '') {
			alert("新密码不能为空");
			return false;
		}
		if (cpassword.length < 6) {
			alert("密码长度不能小于6！");
			return false;
		}

		//校验确认密码
		var repassword = document.getElementById("repassword").value;
		if (repassword == null || repassword == '') {
			alert("请输入确认密码");
			return false;
		}
		if (repassword != cpassword) {
			alert("两次密码输入不一致");
			return false;
		}

	}
	function checkPassword() {
		var cpassword = document.getElementById("cpassword").value;
		var span2 = document.getElementById("span2");
		if (cpassword.length > 0 && cpassword.length < 6) {
			span2.innerHTML = "密码长度不能小于6！";
		} else {
			span2.innerHTML = "";
		}

	}

	function surePassword() {

		//获得密码文本框的值
		var cpassword = document.getElementById("cpassword").value;
		//获得确认密码框内容
		var repassword = document.getElementById("repassword").value;

		var span3 = document.getElementById("span3");
		if (repassword != cpassword) {
			span3.innerHTML = "两次密码输入不一致！";
		} else {
			span3.innerHTML = "";
		}
	}
</script>
</head>

<body>
	<div class="container index">
		<%@ include file="menu.jsp"%>
	</div>

	<div class="container productList">
		<div class="span6" style="position: absolute; left: 140;">
			<div class="hotProductCategory" style="padding-left: 70">

				<dl>
					<dt style="padding-top: 20; padding-bottom: 20">
						<a
							href="${pageContext.request.contextPath }/customer_toPersonalInfo.action">基本资料</a>
					</dt>
					<dt style="padding-top: 20; padding-bottom: 20">
						<a
							href="${pageContext.request.contextPath }/customer_toCompleteInfo.action">完善个人信息</a>
					</dt>
					<dt style="padding-top: 20; padding-bottom: 20">
						<a
							href="${pageContext.request.contextPath }/customer_toPasswordInfo.action">修改密码</a>
					</dt>

				</dl>
			</div>
			<div class="hotProductCategory" style="padding: 0">
				<img alt="info" width="230" height="250"
					src="${pageContext.request.contextPath }/imgs/info.jpg">
			</div>
		</div>
		<div class="span18 last" style="position: absolute; left: 370;">

			<form
				action="${pageContext.request.contextPath }/customer_editInfo.action"
				method="post" onsubmit="return checkFrom()">
				<input type="hidden" name="cid"
					value="<s:property value="model.cid"/>" /> <input type="hidden"
					name="cname" value="<s:property value="model.cname"/>" /> <input
					type="hidden" name="name" value="<s:property value="model.name"/>" />
				<input type="hidden" name="idcard"
					value="<s:property value="model.idcard"/>" /> <input type="hidden"
					name="phone" value="<s:property value="model.phone"/>" /> <input
					type="hidden" name="sex" value="<s:property value="model.sex"/>" />
				<input type="hidden" name="sign"
					value="<s:property value="model.sign"/>" />
				<div id="result" class="result table clearfix">
					<div class="form-group" align="center">
						<label
							class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block"
							style="height: 50; line-height: 5">旧密码：</label> <input
							type="password" id="oldpassword"
							style="padding-top: 20; padding-left: 0; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
							name="old" />
					</div>

				</div>
				<div id="result" class="result table clearfix">
					<div class="form-group" align="center">
						<label
							class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block"
							style="height: 50; line-height: 5">新密码：</label> <input
							type="password" id="cpassword"
							style="padding-top: 20; padding-left: 0; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
							name="cpassword" onblur="checkPassword()"/><span id="span2"></span>
					</div>

				</div>
				<div id="result" class="result table clearfix">
					<div class="form-group" align="center">
						<label
							class="col-md-3 col-sm-2 col-md-offset-2 control-label right-block"
							style="height: 50; line-height: 5">重复新密码：</label> <input
							type="password" id="repassword"
							style="padding-top: 20; padding-left: 0; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
							name="repassword" onblur="surePassword()"/><span id="span3"></span>
					</div>

				</div>
				<div style="padding-left: 300; padding-top: 30">
					<input type="submit"
						style="width: 100px; height: 35px; line-height: 35px; margin-bottom: 10px; color: #ffffff; cursor: pointer; outline: none; blr: expression(this.hideFocus = true); border: none; background-color: #2F75A8;"
						value="确认修改">
				</div>
			</form>
		</div>
	</div>


</body>
</html>
