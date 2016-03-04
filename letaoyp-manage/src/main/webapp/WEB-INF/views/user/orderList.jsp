<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ user / Order</span>
		</li>
	</ul>
</div>
<c:if test="${not empty message}">
	<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
</c:if>

<div class="row-fluid sortable ui-sortable">	
	<div class="box span12">
		<div class="box-header well" data-original-title="">
			<form action="${ctx}/user/order" method="post">
			<h2>
				<span class="ajax-link btn btn-primary" action="${ctx}/user/order/create"><i class="icon-plus"></i> Order</span>
				<span id="form_submit" class="btn btn-primary"><i class="icon-search"></i> Search</span>&nbsp;
			</h2>
			<input placeholder="创建开始时间" class="input-small datepicker" name="search_GT_created" value="${param.search_GT_created}" type="text">
			<input placeholder="创建结束时间" class="input-small datepicker" name="search_LT_created" value="${param.search_LT_created}" type="text">
			</form>
		</div>
		<div class="box-content">
		<table class="table table-bordered table-striped table-condensed">
			<thead>
				<tr role="row">
					<!-- 排序时为th增加sortColumn即可 -->
					<th sortColumn="created" >created</th>
					<th sortColumn="modified" >modified</th>
					<th sortColumn="active" >active</th>
					<th sortColumn="address" >address</th>
					<th sortColumn="area" >area</th>
					<th sortColumn="consignee" >收货人</th>
					<th sortColumn="expire" >expire</th>
					<th sortColumn="amount" >货品金额</th>
					<th sortColumn="freight" >运费</th>
					<th sortColumn="tax" >税金</th>
					<th sortColumn="fee" >支付金额</th>
					<th sortColumn="is_invoice" >是否开具发票</th>
					<th sortColumn="invoice_title" >发票抬头</th>
					<th sortColumn="is_allocated_stock" >是否已分配库存</th>
					<th sortColumn="memo" >附言</th>
					<th sortColumn="offset_amount" >调整金额</th>
					<th sortColumn="status" >订单状态</th>
					<th sortColumn="channel" >支付渠道</th>
					<th sortColumn="phone" >phone</th>
					<th sortColumn="point" >point</th>
					<th sortColumn="trade_no" >交易编号</th>
					<th sortColumn="out_trade_no" >外部（支付系统）交易标号</th>
					<th sortColumn="zip_code" >zipCode</th>
					<th sortColumn="coupon_code" >couponCode</th>
					<th sortColumn="member" >member</th>
					<th sortColumn="operator" >operator</th>
					<th>操作</th>
				</tr>
			</thead>   
			<tbody>
			<c:forEach items="${page.content}" var="item" varStatus="status">
				<tr <c:if test="${status.index % 2 == 0}">class="even"</c:if>
					<c:if test="${status.index % 2 == 1}">class="odd"</c:if>>
					
					
					<td class="center"><fmt:formatDate value="${item.created}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td class="center"><fmt:formatDate value="${item.modified}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td class="center">${item.active}</td>
					<td class="center">${item.address}</td>
					<td class="center">${item.area}</td>
					<td class="center">${item.consignee}</td>
					<td class="center"><fmt:formatDate value="${item.expire}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td class="center">${item.amount}</td>
					<td class="center">${item.freight}</td>
					<td class="center">${item.tax}</td>
					<td class="center">${item.fee}</td>
					<td class="center">${item.isInvoice}</td>
					<td class="center">${item.invoiceTitle}</td>
					<td class="center">${item.isAllocatedStock}</td>
					<td class="center">${item.memo}</td>
					<td class="center">${item.offsetAmount}</td>
					<td class="center">${item.status}</td>
					<td class="center">${item.channel}</td>
					<td class="center">${item.phone}</td>
					<td class="center">${item.point}</td>
					<td class="center">${item.tradeNo}</td>
					<td class="center">${item.outTradeNo}</td>
					<td class="center">${item.zipCode}</td>
					<td class="center">${item.couponCode}</td>
					<td class="center">${item.member}</td>
					<td class="center">${item.operator}</td>
					<td class="center ">
						<shiro:hasPermission name="order:edit">
							<a class="btn btn-info ajax-link" style="padding: 0;"
								action="${ctx}/user/order/update/${item.id}" title="编辑">
								<i class="icon-edit icon-white"></i> </a>
							<a class="btn btn-danger ajax-link" style="padding: 0;"
								action="${ctx}/user/order/delete/${item.id}" title="删除">
								<i class="icon-trash icon-white"></i> </a>
						</shiro:hasPermission>
					</td>
				</tr>
			</c:forEach>
			</tbody>
	   </table>
	   <tags:pagination page="${page}" paginationSize="5" action="${ctx}/user/order" />
	</div>
	</div><!--/span-->
</div>

<!-- public common.js -->
<script src="${ctx}/static/js/charisma.js"></script>