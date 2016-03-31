<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>乐淘优品后台系统</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">

<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet" href="${ctx}/static/plugins/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="${ctx}/static/plugins/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="${ctx}/static/plugins/ionicons/css/ionicons.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="${ctx}/static/plugins/iCheck/all.css">
<!-- datepicker -->
<link rel="stylesheet" href="${ctx}/static/plugins/datepicker/datepicker3.css">
<link rel="stylesheet" href="${ctx}/static/plugins/pace/pace.css">
<!-- Theme style -->
<link rel="stylesheet" href="${ctx}/static/plugins/adminLTE/css/AdminLTE.min.css">
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
      page. However, you can choose any other skin. Make sure you
      apply the skin class to the body tag so the changes take effect.
-->
<link rel="stylesheet" href="${ctx}/static/plugins/adminLTE/css/skins/skin-blue.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- jQuery 2.2.0 -->
<script src="${ctx}/static/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="${ctx}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${ctx}/static/plugins/iCheck/icheck.min.js"></script>

<script src="${ctx}/static/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="${ctx}/static/plugins/jquery-validation/jquery.validate.js"></script>
<script src="${ctx}/static/plugins/jquery-validation/additional-methods.js"></script>
<script src="${ctx}/static/plugins/jQuery/jquery.form.js"></script>

<script src="${ctx}/static/plugins/noty/jquery.noty.packaged.min.js"></script>
<script src="${ctx}/static/plugins/pace/pace.js"></script>

</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<%@ include file="/WEB-INF/layouts/header.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
			  <!-- Sidebar Menu -->
			  <ul class="sidebar-menu">
			    <c:forEach items="${roots}" var="menu">
            <shiro:hasPermission name="${menu.name}:view">
              <c:choose>
                <c:when test="${empty menu.subMenus}">
                  <li><a href="#"><i class="fa fa-link"></i> <span>${menu.description}</span></a></li>
                </c:when>
                <c:otherwise>
                  <li class="treeview">
				            <a href="#"><i class="fa fa-link"></i> <span>${menu.description}</span> <i class="fa fa-angle-left pull-right"></i></a>
				            <ul class="treeview-menu">
				              <c:forEach items="${menu.subMenus}" var="subMenu">
				                <shiro:hasPermission name="${menu.name}:${subMenu.name}:view">
				                  <li><a href="${ctx}/${subMenu.link}" class="ajax_link">
				                    <i class="fa fa-circle-o"></i>${subMenu.description}</a>
				                  </li>
				                </shiro:hasPermission>
				              </c:forEach>
				            </ul>
				          </li>
                </c:otherwise>
              </c:choose>
            </shiro:hasPermission>
          </c:forEach>
			  </ul>
			  <!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
			
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div id="content-wrapper" class="content-wrapper">
			<%@ include file="/WEB-INF/views/index_content.jsp"%>
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<footer class="main-footer">
			<%@ include file="/WEB-INF/layouts/footer.jsp"%>
		</footer>

		<%@ include file="/WEB-INF/layouts/sidebar.jsp"%>
	</div>

	<!-- AdminLTE App -->
	<script src="${ctx}/static/plugins/adminLTE/js/app.min.js"></script>
	<script src="${ctx}/static/js/app.js"></script>
</body>
</html>