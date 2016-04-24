<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="member" value="${sessionScope._letaoyp_u_.member}" />

<!DOCTYPE html>
<html>
<head>
<title>友橙优品:<sitemesh:title /></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="">
<meta name="Description" content="龙淘优品">

<link type="image/x-icon" href="${ctx}/static/images/favicon.ico"
	rel="shortcut icon">

<link href="${ctx}/static/css/style.css" rel="stylesheet" type="text/css">
<link href="${ctx}/static/css/ec11.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${ctx}/static/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="${ctx}/static/lib/layer/layer.js"></script>
<sitemesh:head />
</head>

<body>
	<div class="div_layout_container">
		<%@ include file="/WEB-INF/layouts/header.jsp"%>
		<div class="clear0"></div>
		<div id="div_layout_content">
			<sitemesh:body />
		</div>
		
		<div class="clear0"></div>
		<%@ include file="/WEB-INF/layouts/footer.jsp"%>
	</div>
	
	<script type="text/javascript" src="${ctx}/static/js/app.js"></script>
</body>
</html>