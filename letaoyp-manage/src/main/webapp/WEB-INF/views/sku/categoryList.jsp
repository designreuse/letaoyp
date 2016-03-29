<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<section class="content-header">
	<h1>
		sku <small>类目</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="${ctx}/admin"><i class="fa fa-dashboard"></i> Home</a></li>
		<li>sku</li>
		<li class="active">类目</li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">
						<form id="searchForm" action="${ctx}/sku/category">
							<button type="button" class="btn btn-default btn-sm checkbox-toggle" data-toggle-for="checkbox-toggled">
								<i class="fa fa-square-o"></i>
							</button>
							<div class="btn-group">
								<shiro:hasPermission name="sku:category:edit">
									<a action="${ctx}/sku/category/create" class="btn btn-default btn-sm" title="新增" data-toggle="modal"
										data-target="#modal_form"> <i class="fa fa-plus-square"></i>
									</a>
									<button type="button" class="btn btn-default btn-sm" title="失效" ajax data-data='{"active": "0"}'
										data-confirm="确认失效选中记录？" data-url="${ctx}/sku/category/settings" data-method="post">
										<i class="fa fa-ban"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm" title="激活" ajax data-data='{"active": "1"}'
										data-url="${ctx}/sku/category/settings" data-method="post">
										<i class="fa fa-toggle-on"></i>
									</button>
								</shiro:hasPermission>

								<shiro:hasPermission name="sku:category:delete">
									<button type="button" class="btn btn-default btn-sm" title="删除" ajax data-confirm="该操作将永久删除记录，确认删除？"
										data-url="${ctx}/sku/category/delete" data-method="post">
										<i class="fa fa-trash-o"></i>
									</button>
								</shiro:hasPermission>
							</div>


							<button type="button" id="button_search" class="btn btn-default btn-sm ajax_link">
								<i class="fa fa-search"></i>
							</button>
							<div class="box-tools pull-right" style="margin-left: 10px;">
								<input placeholder="start time" class="datepicker input-sm" name="search_GT_created"
									value="${param.search_GT_created}" type="text"> <input placeholder="end time"
									class="datepicker input-sm" name="search_LT_created" value="${param.search_LT_created}" type="text"> <input
									id="page" name="page" value="${param.page == null ? 1 : param.page}" type="hidden">
							</div>
						</form>
					</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table class="table table-bordered table-hover">
						<thead>
							<tr role="row">
								<th sortColumn="order">降序排列</th>
								<th sortColumn="name">name</th>
								<th sortColumn="seo_description">seoDescription</th>
								<th sortColumn="seo_keywords">seoKeywords</th>
								<th sortColumn="seo_title">seoTitle</th>
								<th sortColumn="tree_path">treePath</th>
								<th sortColumn="tree_name">treeName</th>
								<th sortColumn="parent">parent</th>
								<th sortColumn="is_leaf">isLeaf</th>
								<th sortColumn="level">层级</th>
								<th sortColumn="icon">图标</th>
								<th sortColumn="top">是否置顶至首页</th>
								<th sortColumn="logo">类目logo</th>
								<th sortColumn="active">active</th>
								<th sortColumn="created">created</th>
								<th sortColumn="modified">modified</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="checkbox-toggled">
							<c:forEach items="${page.content}" var="category" varStatus="status">
								<tr>
									<td class="center"><input class="icheck" type="checkbox" value="${category.id}">${category.order}</td>
									<td class="center">${category.name}</td>
									<td class="center">${category.seoDescription}</td>
									<td class="center">${category.seoKeywords}</td>
									<td class="center">${category.seoTitle}</td>
									<td class="center">${category.treePath}</td>
									<td class="center">${category.treeName}</td>
									<td class="center">${category.parent}</td>
									<td class="center">${category.isLeaf}</td>
									<td class="center">${category.level}</td>
									<td class="center">${category.icon}</td>
									<td class="center">${category.top}</td>
									<td class="center">${category.logo}</td>
									<td class="center">${category.active}</td>
									<td class="center"><fmt:formatDate value='${category.created}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
									<td class="center"><fmt:formatDate value='${category.modified}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
									<td class="center "><shiro:hasPermission name="sku:category:edit">
											<a href="#modal_form" action="${ctx}/sku/category/update/${category.id}" title="编辑" data-toggle="modal"
												data-target="#modal_form"><i class="fa fa-edit"></i> </a>
										</shiro:hasPermission> <shiro:hasPermission name="sku:category:delete">
											<a href="${ctx}/sku/category/delete/${category.id}" title="删除"><i class="fa fa-trash-o"></i> </a>
										</shiro:hasPermission></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<tags:pagination page="${page}" paginationSize="5" action="${ctx}/sku/category" />

				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>


<div id="modal_form" class="modal fade" role="dialog" aria-labelledby="...">
	<div class="modal-dialog">
		<div class="modal-content"></div>
	</div>
</div>
<!-- /.modal -->

<script type="text/javascript" src="${ctx}/static/js/app_single.js" />
