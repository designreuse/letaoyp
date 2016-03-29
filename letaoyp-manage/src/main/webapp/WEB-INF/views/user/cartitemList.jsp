<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<section class="content-header">
	<h1>
		user <small>购物车item</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="${ctx}/admin"><i class="fa fa-dashboard"></i> Home</a></li>
		<li>user</li>
		<li class="active">购物车item</li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">
						<form id="searchForm" action="${ctx}/user/cartitem">
							<button type="button" class="btn btn-default btn-sm checkbox-toggle" data-toggle-for="checkbox-toggled">
								<i class="fa fa-square-o"></i>
							</button>
							<div class="btn-group">
								<shiro:hasPermission name="user:cartitem:edit">
									<a action="${ctx}/user/cartitem/create" class="btn btn-default btn-sm" title="新增" data-toggle="modal"
										data-target="#modal_form"> <i class="fa fa-plus-square"></i>
									</a>
									<button type="button" class="btn btn-default btn-sm" title="失效" ajax data-data='{"active": "0"}'
										data-confirm="确认失效选中记录？" data-url="${ctx}/user/cartitem/settings" data-method="post">
										<i class="fa fa-ban"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm" title="激活" ajax data-data='{"active": "1"}'
										data-url="${ctx}/user/cartitem/settings" data-method="post">
										<i class="fa fa-toggle-on"></i>
									</button>
								</shiro:hasPermission>

								<shiro:hasPermission name="user:cartitem:delete">
									<button type="button" class="btn btn-default btn-sm" title="删除" ajax data-confirm="该操作将永久删除记录，确认删除？"
										data-url="${ctx}/user/cartitem/delete" data-method="post">
										<i class="fa fa-trash-o"></i>
									</button>
								</shiro:hasPermission>
							</div>


							<button type="button" id="button_search" class="btn btn-default btn-sm ajax_link">
								<i class="fa fa-search"></i>
							</button>
							<div class="box-tools pull-right" style="margin-left: 10px;">
								<input placeholder="start time" class="datepicker input-sm" name="search_GT_created"
									value="${param.search_GT_created}" type="text"> 
								<input placeholder="end time" class="datepicker input-sm" name="search_LT_created" value="${param.search_LT_created}" type="text"> 
								<input id="page" name="page" value="${param.page == null ? 1 : param.page}" type="hidden">
							</div>
						</form>
					</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table class="table table-bordered table-hover">
						<thead>
							<tr role="row">
								<th sortColumn="quantity" >数量</th>
								<th sortColumn="cart" >cart</th>
								<th sortColumn="goods" >goods</th>
								<th sortColumn="choosen" >选择条件ID集合</th>
								<th sortColumn="choosen_description" >选择条件描述 name:value json串</th>
								<th sortColumn="price" >goods.salesPrice + choosen.cost</th>
								<th sortColumn="active" >是否有效，可恢复购物车物件</th>
								<th sortColumn="created" >created</th>
								<th sortColumn="modified" >modified</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="checkbox-toggled">
							<c:forEach items="${page.content}" var="cartItem" varStatus="status">
							<tr>
								<td class="center">
									<input class="icheck" type="checkbox" value="${cartItem.id}">
${cartItem.quantity}								</td>
								<td class="center">
${cartItem.cart}								</td>
								<td class="center">
${cartItem.goods}								</td>
								<td class="center">
${cartItem.choosen}								</td>
								<td class="center">
${cartItem.choosenDescription}								</td>
								<td class="center">
${cartItem.price}								</td>
								<td class="center">
${cartItem.active}								</td>
								<td class="center">
									<fmt:formatDate value='${cartItem.created}' pattern='yyyy-MM-dd HH:mm:ss'/>
								</td>
								<td class="center">
									<fmt:formatDate value='${cartItem.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>
								</td>
								<td class="center ">
									<shiro:hasPermission name="user:cartitem:edit">
										<a href="#modal_form" action="${ctx}/user/cartitem/update/${cartItem.id}" title="编辑" data-toggle="modal"
											data-target="#modal_form"><i class="fa fa-edit"></i> </a>
									</shiro:hasPermission> 
									<shiro:hasPermission name="user:cartitem:delete">
										<a href="${ctx}/user/cartitem/delete/${cartItem.id}" title="删除"><i class="fa fa-trash-o"></i> </a>
									</shiro:hasPermission>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<tags:pagination page="${page}" paginationSize="5" action="${ctx}/user/cartitem" />

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
