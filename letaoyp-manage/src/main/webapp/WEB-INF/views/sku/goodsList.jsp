<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<section class="content-header">
	<h1>
		sku <small>商品</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="${ctx}/admin"><i class="fa fa-dashboard"></i> Home</a></li>
		<li>sku</li>
		<li class="active">商品</li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">
						<form id="searchForm" action="${ctx}/sku/goods">
							<button type="button" class="btn btn-default btn-sm checkbox-toggle" data-toggle-for="checkbox-toggled">
								<i class="fa fa-square-o"></i>
							</button>
							<div class="btn-group">
								<shiro:hasPermission name="sku:goods:edit">
									<a action="${ctx}/sku/goods/create" class="btn btn-default btn-sm" title="新增" data-toggle="modal"
										data-target="#modal_form"> <i class="fa fa-plus-square"></i>
									</a>
									<button type="button" class="btn btn-default btn-sm" title="失效" ajax data-data='{"active": "0"}'
										data-confirm="确认失效选中记录？" data-url="${ctx}/sku/goods/settings" data-method="post">
										<i class="fa fa-ban"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm" title="激活" ajax data-data='{"active": "1"}'
										data-url="${ctx}/sku/goods/settings" data-method="post">
										<i class="fa fa-toggle-on"></i>
									</button>
								</shiro:hasPermission>

								<shiro:hasPermission name="sku:goods:delete">
									<button type="button" class="btn btn-default btn-sm" title="删除" ajax data-confirm="该操作将永久删除记录，确认删除？"
										data-url="${ctx}/sku/goods/delete" data-method="post">
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
								<th sortColumn="status">上架 下架</th>
								<th sortColumn="shipping_date">上架时间</th>
								<th sortColumn="name">name</th>
								<th sortColumn="base_hits">baseHits</th>
								<th sortColumn="hits">点击数</th>
								<th sortColumn="image">商品图标 取上传图片的第一张</th>
								<th sortColumn="sales_price">销售价</th>
								<th sortColumn="market_price">市场价</th>
								<th sortColumn="cost">成本价</th>
								<th sortColumn="brand">品牌</th>
								<th sortColumn="star">星级</th>
								<th sortColumn="weight">重量</th>
								<th sortColumn="unit">unit描述</th>
								<th sortColumn="description">description</th>
								<th sortColumn="property">键值对属性</th>
								<th sortColumn="category">category</th>
								<th sortColumn="comments">评论数</th>
								<th sortColumn="online_time">onlineTime</th>
								<th sortColumn="active">active</th>
								<th sortColumn="created">created</th>
								<th sortColumn="modified">modified</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="checkbox-toggled">
							<c:forEach items="${page.content}" var="goods" varStatus="status">
								<tr>
									<td class="center"><input class="icheck" type="checkbox" value="${goods.id}">${goods.status}</td>
									<td class="center"><fmt:formatDate value='${goods.shippingDate}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
									<td class="center">${goods.name}</td>
									<td class="center">${goods.baseHits}</td>
									<td class="center">${goods.hits}</td>
									<td class="center">${goods.image}</td>
									<td class="center">${goods.salesPrice}</td>
									<td class="center">${goods.marketPrice}</td>
									<td class="center">${goods.cost}</td>
									<td class="center">${goods.brand}</td>
									<td class="center">${goods.star}</td>
									<td class="center">${goods.weight}</td>
									<td class="center">${goods.unit}</td>
									<td class="center">${goods.description}</td>
									<td class="center">${goods.property}</td>
									<td class="center">${goods.category}</td>
									<td class="center">${goods.comments}</td>
									<td class="center"><fmt:formatDate value='${goods.onlineTime}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
									<td class="center">${goods.active}</td>
									<td class="center"><fmt:formatDate value='${goods.created}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
									<td class="center"><fmt:formatDate value='${goods.modified}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
									<td class="center "><shiro:hasPermission name="sku:goods:edit">
											<a href="#modal_form" action="${ctx}/sku/goods/update/${goods.id}" title="编辑" data-toggle="modal"
												data-target="#modal_form"><i class="fa fa-edit"></i> </a>
										</shiro:hasPermission> <shiro:hasPermission name="sku:goods:delete">
											<a href="${ctx}/sku/goods/delete/${goods.id}" title="删除"><i class="fa fa-trash-o"></i> </a>
										</shiro:hasPermission></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<tags:pagination page="${page}" paginationSize="5" action="${ctx}/sku/goods" />

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
