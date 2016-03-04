<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ goods / 商品</span>
		</li>
	</ul>
</div>
<c:if test="${not empty message}">
	<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
</c:if>

<div class="row-fluid sortable ui-sortable">	
	<div class="box span12">
		<div class="box-header well" data-original-title="">
			<form action="${ctx}/goods/goods" method="post">
			<h2>
				<span class="ajax-link btn btn-primary" action="${ctx}/goods/goods/create"><i class="icon-plus"></i> 商品</span>
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
					<th sortColumn="status" >未上架 已上架 已下架</th>
					<th sortColumn="shipping_date" >上架时间</th>
					<th sortColumn="name" >name</th>
					<th sortColumn="base_hits" >baseHits</th>
					<th sortColumn="hits" >点击数</th>
					<th sortColumn="image" >商品图标 取上传图片的第一张</th>
					<th sortColumn="sales_price" >销售价</th>
					<th sortColumn="market_price" >市场价</th>
					<th sortColumn="cost" >成本价</th>
					<th sortColumn="brand" >品牌</th>
					<th sortColumn="star" >星级</th>
					<th sortColumn="weight" >重量</th>
					<th sortColumn="unit" >unit描述</th>
					<th sortColumn="description" >description</th>
					<th sortColumn="property" >键值对属性</th>
					<th sortColumn="category" >category</th>
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
					<td class="center">${item.status}</td>
					<td class="center"><fmt:formatDate value="${item.shippingDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td class="center">${item.name}</td>
					<td class="center">${item.baseHits}</td>
					<td class="center">${item.hits}</td>
					<td class="center">${item.image}</td>
					<td class="center">${item.salesPrice}</td>
					<td class="center">${item.marketPrice}</td>
					<td class="center">${item.cost}</td>
					<td class="center">${item.brand}</td>
					<td class="center">${item.star}</td>
					<td class="center">${item.weight}</td>
					<td class="center">${item.unit}</td>
					<td class="center">${item.description}</td>
					<td class="center">${item.property}</td>
					<td class="center">${item.category}</td>
					<td class="center ">
						<shiro:hasPermission name="goods:edit">
							<a class="btn btn-info ajax-link" style="padding: 0;"
								action="${ctx}/goods/goods/update/${item.id}" title="编辑">
								<i class="icon-edit icon-white"></i> </a>
							<a class="btn btn-danger ajax-link" style="padding: 0;"
								action="${ctx}/goods/goods/delete/${item.id}" title="删除">
								<i class="icon-trash icon-white"></i> </a>
						</shiro:hasPermission>
					</td>
				</tr>
			</c:forEach>
			</tbody>
	   </table>
	   <tags:pagination page="${page}" paginationSize="5" action="${ctx}/goods/goods" />
	</div>
	</div><!--/span-->
</div>

<!-- public common.js -->
<script src="${ctx}/static/js/charisma.js"></script>