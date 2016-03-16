<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ sku / 商品图库</span>
		</li>
	</ul>
</div>
<c:if test="${not empty message}">
	<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
</c:if>

<div class="row-fluid sortable ui-sortable">	
	<div class="box span12">
		<div class="box-header well" data-original-title="">
			<form action="${ctx}/sku/goodsimage" method="post">
			<h2>
				<span class="ajax-link btn btn-primary" action="${ctx}/sku/goodsimage/create"><i class="icon-plus"></i> 商品图库</span>
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
					<th sortColumn="order" >降序排列</th>
					<th sortColumn="src" >src</th>
					<th sortColumn="goods" >goods</th>
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
					<td class="center">${item.order}</td>
					<td class="center">${item.src}</td>
					<td class="center">${item.goods}</td>
					<td class="center ">
						<shiro:hasPermission name="goodsimage:edit">
							<a class="btn btn-info ajax-link" style="padding: 0;"
								action="${ctx}/sku/goodsimage/update/${item.id}" title="编辑">
								<i class="icon-edit icon-white"></i> </a>
							<a class="btn btn-danger ajax-link" style="padding: 0;"
								action="${ctx}/sku/goodsimage/delete/${item.id}" title="删除">
								<i class="icon-trash icon-white"></i> </a>
						</shiro:hasPermission>
					</td>
				</tr>
			</c:forEach>
			</tbody>
	   </table>
	   <tags:pagination page="${page}" paginationSize="5" action="${ctx}/sku/goodsimage" />
	</div>
	</div><!--/span-->
</div>

<!-- public common.js -->
<script src="${ctx}/static/js/charisma.js"></script>