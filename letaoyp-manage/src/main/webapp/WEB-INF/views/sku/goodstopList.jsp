<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ sku / GoodsTop</span>
		</li>
	</ul>
</div>
<c:if test="${not empty message}">
	<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
</c:if>

<div class="row-fluid sortable ui-sortable">	
	<div class="box span12">
		<div class="box-header well" data-original-title="">
			<form action="${ctx}/sku/goodstop" method="post">
			<h2>
				<span class="ajax-link btn btn-primary" action="${ctx}/sku/goodstop/create"><i class="icon-plus"></i> GoodsTop</span>
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
					<th sortColumn="goods" >goods</th>
					<th sortColumn="goods_name" >goodsName</th>
					<th sortColumn="sales_price" >销售价</th>
					<th sortColumn="market_price" >市场价</th>
					<th sortColumn="comments" >评论数</th>
					<th sortColumn="top_image" >topImage</th>
					<th sortColumn="position" >置顶位置 HOME_1 首页置顶位置1(785*368); HOME_2 首页置顶位置2(242*184)</th>
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
					<td class="center">${item.goods}</td>
					<td class="center">${item.goodsName}</td>
					<td class="center">${item.salesPrice}</td>
					<td class="center">${item.marketPrice}</td>
					<td class="center">${item.comments}</td>
					<td class="center">${item.topImage}</td>
					<td class="center">${item.position}</td>
					<td class="center ">
						<shiro:hasPermission name="goodstop:edit">
							<a class="btn btn-info ajax-link" style="padding: 0;"
								action="${ctx}/sku/goodstop/update/${item.id}" title="编辑">
								<i class="icon-edit icon-white"></i> </a>
							<a class="btn btn-danger ajax-link" style="padding: 0;"
								action="${ctx}/sku/goodstop/delete/${item.id}" title="删除">
								<i class="icon-trash icon-white"></i> </a>
						</shiro:hasPermission>
					</td>
				</tr>
			</c:forEach>
			</tbody>
	   </table>
	   <tags:pagination page="${page}" paginationSize="5" action="${ctx}/sku/goodstop" />
	</div>
	</div><!--/span-->
</div>

<!-- public common.js -->
<script src="${ctx}/static/js/charisma.js"></script>