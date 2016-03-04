<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ admin / 权限表</span>
		</li>
	</ul>
</div>
<c:if test="${not empty message}">
	<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
</c:if>

<div class="row-fluid sortable ui-sortable">	
	<div class="box span12">
		<div class="box-header well" data-original-title="">
			<h2>
				<a class="ajax-link" href="#" action="${ctx}/admin/permission/create"><i class="icon-plus"></i> 权限表</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="ajax-link" href="#"><i class="icon-search"></i>Search</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</h2>
			<input placeholder="创建开始时间" class="input-small" name="search_GT_created" value="${param.search_GT_created}" type="text">&nbsp;&nbsp;&nbsp;&nbsp;
			<input placeholder="创建结束时间" class="input-small" name="search_LT_created" value="${param.search_LT_created}" type="text">&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div class="box-content">
		<table class="table table-bordered table-striped table-condensed">
			<thead>
				<tr role="row">
					<!-- 排序时为th增加sortColumn即可 -->
					<th sortColumn="name" >name</th>
					<th sortColumn="description" >description</th>
					<th sortColumn="menu" >menu</th>
					<th sortColumn="active" >active</th>
					<th sortColumn="created" >created</th>
					<th sortColumn="modified" >modified</th>
					<th>操作</th>
				</tr>
			</thead>   
			<tbody>
			<c:forEach items="${page.content}" var="item" varStatus="status">
				<tr <c:if test="${status.index % 2 == 0}">class="even"</c:if>
					<c:if test="${status.index % 2 == 1}">class="odd"</c:if>>
					
					
					<td class="center">${item.name}</td>
					<td class="center">${item.description}</td>
					<td class="center">${item.menu}</td>
					<td class="center">${item.active}</td>
					<td class="center"><fmt:formatDate value="${item.created}"
pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td class="center"><fmt:formatDate value="${item.modified}"
pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td class="center ">
						<shiro:hasPermission name="user:edit">
							<a class="btn btn-info" style="padding: 0;"
								href="${ctx}/admin/permission/update/${item.id}" title="编辑">
								<i class="icon-edit icon-white"></i> </a>
							<a class="btn btn-danger" style="padding: 0;"
								href="${ctx}/admin/permission/delete/${item.id}" title="删除">
								<i class="icon-trash icon-white"></i> </a>
						</shiro:hasPermission>
					</td>
				</tr>
			</c:forEach>
			</tbody>
	   </table>
	</div>
	</div><!--/span-->
</div>

<!-- public common.js -->
<script src="${ctx}/static/js/common.js"></script>