<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
	<div>
		<ul class="breadcrumb">
			<li>
				<a href="${ctx}/">Home</a> <span class="divider">/ 系统管理 / 菜单</span>
			</li>
		</ul>
	</div>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
	<div class="row-fluid sortable ui-sortable">	
		<div class="box span12">
			<div class="box-header well" data-original-title="">
				<h2><a class="ajax-link" href="#" action="${ctx}/admin/menu/create"><i class="icon-plus"></i> Menu</a></h2>
			</div>
			<div class="box-content">
			<table class="table table-bordered table-striped table-condensed">
			  <thead>
			  	<tr role="row">
					<th>菜单</th>
					<th>图标</th>
					<th>权限</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			  </thead>   
			  <tbody>
			  	<c:forEach items="${roots}" var="menu">
					<tr class="odd">
						<td class=" sorting_1">${menu.description}</td>
						<td class="center "><i class="${menu.icon}"></i> ${menu.icon}</td>
						<td class="center ">${menu.permission}</td>
						<td class="center ">
							<c:if test="${menu.active}"><span class="label label-success">Active</span></c:if>
							<c:if test="${!menu.active}"><span class="label label-important">Banned</span></c:if>
						</td>
						<td class="center ">
							<shiro:hasPermission name="${menu.name}:edit">
								<a class="btn btn-info ajax-link" style="padding: 0;" action="${ctx}/admin/menu/update/${menu.id}" title="编辑"><i class="icon-edit icon-white"></i> </a>
								<a class="btn btn-danger ajax-link" style="padding: 0;" action="${ctx}/admin/menu/delete/${menu.id}" title="删除"><i class="icon-trash icon-white"></i> </a>
							</shiro:hasPermission>
						</td>
					</tr>
					
					<c:forEach items="${menu.subMenus}" var="subMenu">
						<tr class="even">
							<td class=" sorting_1">${subMenu.description}</td>
							<td class="center "><i class="${subMenu.icon}"></i> ${subMenu.icon}</td>
							<td class="center ">${subMenu.permission}</td>
							<td class="center ">
								<c:if test="${subMenu.active}"><span class="label label-success">Active</span></c:if>
								<c:if test="${!subMenu.active}"><span class="label label-important">Banned</span></c:if>
							</td>
							<td class="center ">
								<shiro:hasPermission name="${subMenu.name}:edit">
									<a class="btn btn-info ajax-link" style="padding: 0;" action="${ctx}/admin/menu/update/${subMenu.id}" title="编辑"><i class="icon-edit icon-white"></i> </a>
									<a class="btn btn-danger ajax-link" style="padding: 0;" action="${ctx}/admin/menu/delete/${subMenu.id}" title="删除"><i class="icon-trash icon-white"></i> </a>
								</shiro:hasPermission>
							</td>
						</tr>
					</c:forEach>
				</c:forEach>
			  </tbody>
		   </table>
		</div>
		</div><!--/span-->
	</div>

	<!-- public common.js -->
	<script src="${ctx}/static/js/common.js"></script>