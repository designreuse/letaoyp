<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ user / 订单物品</span>
		</li>
	</ul>
</div>
<c:if test="${not empty message}">
	<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
</c:if>

<div class="row-fluid sortable ui-sortable">	
	<div class="box span12">
		<div class="box-header well" data-original-title="">
			<form action="${ctx}/user/orderitem" method="post">
			<h2>
				<span class="ajax-link btn btn-primary" action="${ctx}/user/orderitem/create"><i class="icon-plus"></i> 订单物品</span>
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
					<th sortColumn="is_gift" >isGift</th>
					<th sortColumn="name" >商品名称</th>
					<th sortColumn="price" >价格</th>
					<th sortColumn="quantity" >数量</th>
					<th sortColumn="return_quantity" >returnQuantity</th>
					<th sortColumn="shipped_quantity" >shippedQuantity</th>
					<th sortColumn="sn" >商品编号</th>
					<th sortColumn="thumbnail" >商品缩略图</th>
					<th sortColumn="weight" >重量</th>
					<th sortColumn="order" >订单</th>
					<th sortColumn="goods" >商品</th>
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
					<td class="center">${item.isGift}</td>
					<td class="center">${item.name}</td>
					<td class="center">${item.price}</td>
					<td class="center">${item.quantity}</td>
					<td class="center">${item.returnQuantity}</td>
					<td class="center">${item.shippedQuantity}</td>
					<td class="center">${item.sn}</td>
					<td class="center">${item.thumbnail}</td>
					<td class="center">${item.weight}</td>
					<td class="center">${item.order}</td>
					<td class="center">${item.goods}</td>
					<td class="center ">
						<shiro:hasPermission name="orderitem:edit">
							<a class="btn btn-info ajax-link" style="padding: 0;"
								action="${ctx}/user/orderitem/update/${item.id}" title="编辑">
								<i class="icon-edit icon-white"></i> </a>
							<a class="btn btn-danger ajax-link" style="padding: 0;"
								action="${ctx}/user/orderitem/delete/${item.id}" title="删除">
								<i class="icon-trash icon-white"></i> </a>
						</shiro:hasPermission>
					</td>
				</tr>
			</c:forEach>
			</tbody>
	   </table>
	   <tags:pagination page="${page}" paginationSize="5" action="${ctx}/user/orderitem" />
	</div>
	</div><!--/span-->
</div>

<!-- public common.js -->
<script src="${ctx}/static/js/charisma.js"></script>