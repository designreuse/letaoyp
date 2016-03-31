<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<section class="content-header">
	<h1>
		user <small>Order</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="${ctx}/admin"><i class="fa fa-dashboard"></i> Home</a></li>
		<li>user</li>
		<li class="active">Order</li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">
						<form id="searchForm" action="${ctx}/user/order">
							<button type="button" class="btn btn-default btn-sm checkbox-toggle" data-toggle-for="checkbox-toggled">
								<i class="fa fa-square-o"></i>
							</button>
							<div class="btn-group">
								<shiro:hasPermission name="user:order:edit">
									<a action="${ctx}/user/order/create" class="btn btn-default btn-sm" title="新增" data-toggle="modal"
										data-target="#modal_form"> <i class="fa fa-plus-square"></i>
									</a>
									<button type="button" class="btn btn-default btn-sm" title="失效" ajax data-data='{"active": "0"}'
										data-confirm="确认失效选中记录？" data-url="${ctx}/user/order/settings" data-method="post">
										<i class="fa fa-ban"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm" title="激活" ajax data-data='{"active": "1"}'
										data-url="${ctx}/user/order/settings" data-method="post">
										<i class="fa fa-toggle-on"></i>
									</button>
								</shiro:hasPermission>

								<shiro:hasPermission name="user:order:delete">
									<button type="button" class="btn btn-default btn-sm" title="删除" ajax data-confirm="该操作将永久删除记录，确认删除？"
										data-url="${ctx}/user/order/delete" data-method="post">
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
								<th sortColumn="address" >address</th>
								<th sortColumn="area" >area</th>
								<th sortColumn="consignee" >收货人</th>
								<th sortColumn="expire" >expire</th>
								<th sortColumn="amount" >货品金额</th>
								<th sortColumn="freight" >运费</th>
								<th sortColumn="tax" >税金</th>
								<th sortColumn="offset_amount" >调整金额</th>
								<th sortColumn="fee" >支付金额</th>
								<th sortColumn="is_invoice" >是否开具发票</th>
								<th sortColumn="invoice_title" >发票抬头</th>
								<th sortColumn="is_allocated_stock" >是否已分配库存</th>
								<th sortColumn="memo" >附言</th>
								<th sortColumn="status" >订单状态</th>
								<th sortColumn="channel" >支付渠道</th>
								<th sortColumn="mobile" >mobile</th>
								<th sortColumn="trade_no" >交易编号</th>
								<th sortColumn="out_trade_no" >外部（支付系统）交易标号</th>
								<th sortColumn="coupon_code" >couponCode</th>
								<th sortColumn="member" >member</th>
								<th sortColumn="operator" >operator</th>
								<th sortColumn="active" >active</th>
								<th sortColumn="created" >created</th>
								<th sortColumn="modified" >modified</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="checkbox-toggled">
							<c:forEach items="${page.content}" var="order" varStatus="status">
							<tr>
								<td class="center">
									<input class="icheck" type="checkbox" value="${order.id}">
${order.address}								</td>
								<td class="center">
${order.area}								</td>
								<td class="center">
${order.consignee}								</td>
								<td class="center">
									<fmt:formatDate value='${order.expire}' pattern='yyyy-MM-dd HH:mm:ss'/>
								</td>
								<td class="center">
${order.amount}								</td>
								<td class="center">
${order.freight}								</td>
								<td class="center">
${order.tax}								</td>
								<td class="center">
${order.offsetAmount}								</td>
								<td class="center">
${order.fee}								</td>
								<td class="center">
${order.isInvoice}								</td>
								<td class="center">
${order.invoiceTitle}								</td>
								<td class="center">
${order.isAllocatedStock}								</td>
								<td class="center">
${order.memo}								</td>
								<td class="center">
${order.status}								</td>
								<td class="center">
${order.channel}								</td>
								<td class="center">
${order.mobile}								</td>
								<td class="center">
${order.tradeNo}								</td>
								<td class="center">
${order.outTradeNo}								</td>
								<td class="center">
${order.couponCode}								</td>
								<td class="center">
${order.member}								</td>
								<td class="center">
${order.operator}								</td>
								<td class="center">
${order.active}								</td>
								<td class="center">
									<fmt:formatDate value='${order.created}' pattern='yyyy-MM-dd HH:mm:ss'/>
								</td>
								<td class="center">
									<fmt:formatDate value='${order.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>
								</td>
								<td class="center ">
									<shiro:hasPermission name="user:order:edit">
										<a href="#modal_form" action="${ctx}/user/order/update/${order.id}" title="编辑" data-toggle="modal"
											data-target="#modal_form"><i class="fa fa-edit"></i> </a>
									</shiro:hasPermission> 
									<shiro:hasPermission name="user:order:delete">
										<a href="${ctx}/user/order/delete/${order.id}" single-delete title="删除"><i class="fa fa-trash-o"></i> </a>
									</shiro:hasPermission>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<tags:pagination page="${page}" paginationSize="5" action="${ctx}/user/order" />

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
