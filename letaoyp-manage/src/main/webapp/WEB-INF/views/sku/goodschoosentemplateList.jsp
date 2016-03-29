<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<section class="content-header">
	<h1>
		sku <small>商品选择条件模板</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="${ctx}/admin"><i class="fa fa-dashboard"></i> Home</a></li>
		<li>sku</li>
		<li class="active">商品选择条件模板</li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">
						<form id="searchForm" action="${ctx}/sku/goodschoosentemplate">
							<button type="button" class="btn btn-default btn-sm checkbox-toggle" data-toggle-for="checkbox-toggled">
								<i class="fa fa-square-o"></i>
							</button>
							<div class="btn-group">
								<shiro:hasPermission name="sku:goodschoosentemplate:edit">
									<a action="${ctx}/sku/goodschoosentemplate/create" class="btn btn-default btn-sm" title="新增"
										data-toggle="modal" data-target="#modal_form"> <i class="fa fa-plus-square"></i>
									</a>
									<button type="button" class="btn btn-default btn-sm" title="失效" ajax data-data='{"active": "0"}'
										data-confirm="确认失效选中记录？" data-url="${ctx}/sku/goodschoosentemplate/settings" data-method="post">
										<i class="fa fa-ban"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm" title="激活" ajax data-data='{"active": "1"}'
										data-url="${ctx}/sku/goodschoosentemplate/settings" data-method="post">
										<i class="fa fa-toggle-on"></i>
									</button>
								</shiro:hasPermission>

								<shiro:hasPermission name="sku:goodschoosentemplate:delete">
									<button type="button" class="btn btn-default btn-sm" title="删除" ajax data-confirm="该操作将永久删除记录，确认删除？"
										data-url="${ctx}/sku/goodschoosentemplate/delete" data-method="post">
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
								<th sortColumn="category">category</th>
								<th sortColumn="name">模板名</th>
								<th sortColumn="brand">品牌</th>
								<th sortColumn="active">active</th>
								<th sortColumn="created">created</th>
								<th sortColumn="modified">modified</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="checkbox-toggled">
							<c:forEach items="${page.content}" var="goodsChoosenTemplate" varStatus="status">
								<tr>
									<td class="center"><input class="icheck" type="checkbox" value="${goodsChoosenTemplate.id}">${goodsChoosenTemplate.category}</td>
									<td class="center">${goodsChoosenTemplate.name}</td>
									<td class="center">${goodsChoosenTemplate.brand}</td>
									<td class="center">${goodsChoosenTemplate.active}</td>
									<td class="center"><fmt:formatDate value='${goodsChoosenTemplate.created}' pattern='yyyy-MM-dd HH:mm:ss' />
									</td>
									<td class="center"><fmt:formatDate value='${goodsChoosenTemplate.modified}' pattern='yyyy-MM-dd HH:mm:ss' />
									</td>
									<td class="center "><shiro:hasPermission name="sku:goodschoosentemplate:edit">
											<a href="#modal_form" action="${ctx}/sku/goodschoosentemplate/update/${goodsChoosenTemplate.id}" title="编辑"
												data-toggle="modal" data-target="#modal_form"><i class="fa fa-edit"></i> </a>
										</shiro:hasPermission> <shiro:hasPermission name="sku:goodschoosentemplate:delete">
											<a href="${ctx}/sku/goodschoosentemplate/delete/${goodsChoosenTemplate.id}" title="删除"><i
												class="fa fa-trash-o"></i> </a>
										</shiro:hasPermission></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<tags:pagination page="${page}" paginationSize="5" action="${ctx}/sku/goodschoosentemplate" />

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
