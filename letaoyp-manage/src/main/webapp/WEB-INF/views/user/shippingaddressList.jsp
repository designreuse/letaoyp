<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<section class="content-header">
	<h1>
		user <small>收货地址</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="${ctx}/admin"><i class="fa fa-dashboard"></i> Home</a></li>
		<li>user</li>
		<li class="active">收货地址</li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">
						<form id="searchForm" action="${ctx}/user/shippingaddress">
							<button type="button" class="btn btn-default btn-sm checkbox-toggle" data-toggle-for="checkbox-toggled">
								<i class="fa fa-square-o"></i>
							</button>
							<div class="btn-group">
								<shiro:hasPermission name="user:shippingaddress:edit">
									<a action="${ctx}/user/shippingaddress/create" class="btn btn-default btn-sm" title="新增" data-toggle="modal"
										data-target="#modal_form"> <i class="fa fa-plus-square"></i>
									</a>
									<button type="button" class="btn btn-default btn-sm" title="失效" ajax data-data='{"active": "0"}'
										data-confirm="确认失效选中记录？" data-url="${ctx}/user/shippingaddress/settings" data-method="post">
										<i class="fa fa-ban"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm" title="激活" ajax data-data='{"active": "1"}'
										data-url="${ctx}/user/shippingaddress/settings" data-method="post">
										<i class="fa fa-toggle-on"></i>
									</button>
								</shiro:hasPermission>

								<shiro:hasPermission name="user:shippingaddress:delete">
									<button type="button" class="btn btn-default btn-sm" title="删除" ajax data-confirm="该操作将永久删除记录，确认删除？"
										data-url="${ctx}/user/shippingaddress/delete" data-method="post">
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
								<th sortColumn="member" >member</th>
								<th sortColumn="area" >area</th>
								<th sortColumn="receiver" >收货人</th>
								<th sortColumn="address" >详细地址</th>
								<th sortColumn="mobile" >电话</th>
								<th sortColumn="phone" >手机</th>
								<th sortColumn="buliding_flag" >标志建筑</th>
								<th sortColumn="email" >email</th>
								<th sortColumn="zip_code" >zipCode</th>
								<th sortColumn="receive_time" >预约送货时间</th>
								<th sortColumn="active" >active</th>
								<th sortColumn="created" >created</th>
								<th sortColumn="modified" >modified</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="checkbox-toggled">
							<c:forEach items="${page.content}" var="shippingAddress" varStatus="status">
							<tr>
								<td class="center">
									<input class="icheck" type="checkbox" value="${shippingAddress.id}">
${shippingAddress.member}								</td>
								<td class="center">
${shippingAddress.area}								</td>
								<td class="center">
${shippingAddress.receiver}								</td>
								<td class="center">
${shippingAddress.address}								</td>
								<td class="center">
${shippingAddress.mobile}								</td>
								<td class="center">
${shippingAddress.phone}								</td>
								<td class="center">
${shippingAddress.bulidingFlag}								</td>
								<td class="center">
${shippingAddress.email}								</td>
								<td class="center">
${shippingAddress.zipCode}								</td>
								<td class="center">
${shippingAddress.receiveTime}								</td>
								<td class="center">
${shippingAddress.active}								</td>
								<td class="center">
									<fmt:formatDate value='${shippingAddress.created}' pattern='yyyy-MM-dd HH:mm:ss'/>
								</td>
								<td class="center">
									<fmt:formatDate value='${shippingAddress.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>
								</td>
								<td class="center ">
									<shiro:hasPermission name="user:shippingaddress:edit">
										<a href="#modal_form" action="${ctx}/user/shippingaddress/update/${shippingAddress.id}" title="编辑" data-toggle="modal"
											data-target="#modal_form"><i class="fa fa-edit"></i> </a>
									</shiro:hasPermission> 
									<shiro:hasPermission name="user:shippingaddress:delete">
										<a href="${ctx}/user/shippingaddress/delete/${shippingAddress.id}" single-delete title="删除"><i class="fa fa-trash-o"></i> </a>
									</shiro:hasPermission>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<tags:pagination page="${page}" paginationSize="5" action="${ctx}/user/shippingaddress" />

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
