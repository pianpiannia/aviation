<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link href="${pageContext.request.contextPath}/css/left.css" rel="stylesheet" type="text/css"/>
<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/dtree.css" type="text/css" />
</head>
<body>
<table width="100" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td>
<div class="dtree">

	<a href="javascript: d.openAll();">展开所有</a> | <a href="javascript: d.closeAll();">关闭所有</a>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtree.js"></script>
	<script type="text/javascript">
		
		d = new dTree('d');
		d.add('01',-1,'系统菜单树');
		d.add('0101','01','用户管理');
		d.add('010101','0101','用户管理','${pageContext.request.contextPath}/adminCustomer_findAll.action','','mainFrame');
		d.add('010102','0101','管理员管理','${pageContext.request.contextPath}/adminUser_findAll.action','','mainFrame');
		d.add('0102','01','航线管理');
		d.add('010201','0102','航线管理','${pageContext.request.contextPath}/adminRoute_findAll.action','','mainFrame');
		d.add('0103','01','客机管理');
		d.add('010301','0103','客机管理','${pageContext.request.contextPath}/adminAircraft_findAll.action?page=1','','mainFrame')
		d.add('0104','01','订单管理');
		d.add('010401','0104','订单管理','${pageContext.request.contextPath}/adminOrder_findAll.action?page=1','','mainFrame')
		document.write(d);
		//
	</script>
</div>	</td>
  </tr>
</table>
</body>
</html>
