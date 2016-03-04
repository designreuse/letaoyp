<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.LockedAccountException "%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>Smart HangZhou</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Smart HangZhou">
	<meta name="author" content="">
	
	<link id="bs-css" href="${ctx}/static/css/bootstrap-cerulean.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
	<link href="${ctx}/static/css/bootstrap-responsive.css" rel="stylesheet">
	<link href="${ctx}/static/css/charisma-app.css" rel="stylesheet">
	<link href="${ctx}/static/css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href='${ctx}/static/css/fullcalendar.css' rel='stylesheet'>
	<link href='${ctx}/static/css/fullcalendar.print.css' rel='stylesheet'  media='print'>
	<link href='${ctx}/static/css/chosen.css' rel='stylesheet'>
	<link href='${ctx}/static/css/uniform.default.css' rel='stylesheet'>
	<link href='${ctx}/static/css/colorbox.css' rel='stylesheet'>
	<link href='${ctx}/static/css/jquery.cleditor.css' rel='stylesheet'>
	<link href='${ctx}/static/css/jquery.noty.css' rel='stylesheet'>
	<link href='${ctx}/static/css/noty_theme_default.css' rel='stylesheet'>
	<link href='${ctx}/static/css/elfinder.min.css' rel='stylesheet'>
	<link href='${ctx}/static/css/elfinder.theme.css' rel='stylesheet'>
	<link href='${ctx}/static/css/jquery.iphone.toggle.css' rel='stylesheet'>
	<link href='${ctx}/static/css/opa-icons.css' rel='stylesheet'>
	<link href='${ctx}/static/css/uploadify.css' rel='stylesheet'>
	<!--[if lt IE 9]>
	  <script src="${ctx}/static/js/html5.js"></script>
	<![endif]-->

	<!-- The fav icon -->
	<link rel="shortcut icon" href="${ctx}/static/img/favicon.ico">
	<!-- jQuery -->
	<script src="${ctx}/static/js/jquery-1.7.2.min.js"></script>
</head>

<body>
	<jsp:include page="include/head.jsp"></jsp:include>	
	
	<div class="container-fluid">
		<div class="row-fluid">
				
			<!-- left menu starts -->
			<div class="span2 main-menu-span">
				<div class="well nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<c:forEach items="${roots}" var="menu">
							<shiro:hasPermission name="${menu.name}:view">
								<li class="nav-header hidden-tablet"> ${menu.description}</li>
								<c:forEach items="${menu.subMenus}" var="menu">
									<shiro:hasPermission name="${menu.name}:view">
										<li><a class="ajax-link" href="javascript:void(0)" action="${ctx}/${menu.link}"><i class="${menu.icon}"></i><span class="hidden-tablet"> ${menu.description}</span></a></li>
									</shiro:hasPermission>
								</c:forEach>
							</shiro:hasPermission>
						</c:forEach>
					</ul>
				</div><!--/.well -->
			</div><!--/span-->
			<!-- left menu ends -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<div id="content" class="span10">
			<!-- content starts -->
			

			<div>
				<ul class="breadcrumb">
					<li>
						<a href="#">Home</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="#">Dashboard</a>
					</li>
				</ul>
			</div>
			<div class="sortable row-fluid">
				<a data-rel="tooltip" title="6 new members." class="well span3 top-block" href="#">
					<span class="icon32 icon-red icon-user"></span>
					<div>Total Members</div>
					<div>507</div>
					<span class="notification">6</span>
				</a>

				<a data-rel="tooltip" title="4 new pro members." class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-star-on"></span>
					<div>Pro Members</div>
					<div>228</div>
					<span class="notification green">4</span>
				</a>

				<a data-rel="tooltip" title="$34 new sales." class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-cart"></span>
					<div>Sales</div>
					<div>$13320</div>
					<span class="notification yellow">$34</span>
				</a>
				
				<a data-rel="tooltip" title="12 new messages." class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-envelope-closed"></span>
					<div>Messages</div>
					<div>25</div>
					<span class="notification red">12</span>
				</a>
			</div>
			
			<div class="row-fluid">
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-info-sign"></i> Introduction</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<h1>Charisma <small>free, premium quality, responsive, multiple skin admin letaoyp.</small></h1>
						<p>Its a live demo of the letaoyp. I have created Charisma to ease the repeat work I have to do on my projects. Now I re-use Charisma as a base for my admin panel work and I am sharing it with you :)</p>
						<p><b>All pages in the menu are functional, take a look at all, please share this with your followers.</b></p>
						
						<p class="center">
							<a href="http://usman.it/free-responsive-admin-letaoyp" class="btn btn-large btn-primary"><i class="icon-chevron-left icon-white"></i> Back to article</a> 
							<a href="http://usman.it/free-responsive-admin-letaoyp" class="btn btn-large"><i class="icon-download-alt"></i> Download Page</a>
						</p>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
					
					<!-- content ends -->
			</div><!--/#content.span10-->
				</div><!--/fluid-row-->
				
		<hr>

		<div class="modal hide fade" id="myModal">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h3>Settings</h3>
			</div>
			<div class="modal-body">
				<p>Here settings can be configured...</p>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">Close</a>
				<a href="#" class="btn btn-primary">Save changes</a>
			</div>
		</div>

		<footer>
			<p class="pull-left">&copy; <a href="http://usman.it" target="_blank">Muhammad Usman</a> 2012</p>
			<p class="pull-right">Powered by: <a href="http://usman.it/free-responsive-admin-letaoyp">Charisma</a></p>
		</footer>
		
	</div><!--/.fluid-container-->
	
	<!-- jQuery validate -->
	<script src="${ctx}/static/js/jquery-validation/1.11.1/jquery.validate.min.js"></script>
	<!-- jQuery UI -->
	<script src="${ctx}/static/js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	<script src="${ctx}/static/js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="${ctx}/static/js/bootstrap-alert.js"></script>
	<!-- modal / dialog library -->
	<script src="${ctx}/static/js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="${ctx}/static/js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="${ctx}/static/js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="${ctx}/static/js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="${ctx}/static/js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="${ctx}/static/js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="${ctx}/static/js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="${ctx}/static/js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="${ctx}/static/js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="${ctx}/static/js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="${ctx}/static/js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="${ctx}/static/js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<script src='${ctx}/static/js/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='${ctx}/static/js/jquery.dataTables.min.js'></script>

	<!-- chart libraries start -->
	<script src="${ctx}/static/js/excanvas.js"></script>
	<script src="${ctx}/static/js/jquery.flot.min.js"></script>
	<script src="${ctx}/static/js/jquery.flot.pie.min.js"></script>
	<script src="${ctx}/static/js/jquery.flot.stack.js"></script>
	<script src="${ctx}/static/js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="${ctx}/static/js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="${ctx}/static/js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="${ctx}/static/js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="${ctx}/static/js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="${ctx}/static/js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="${ctx}/static/js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="${ctx}/static/js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="${ctx}/static/js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="${ctx}/static/js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="${ctx}/static/js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="${ctx}/static/js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="${ctx}/static/js/charisma.js"></script>
	<!-- public common.js -->
	<script src="${ctx}/static/js/common.js"></script>

</body>
</html>
