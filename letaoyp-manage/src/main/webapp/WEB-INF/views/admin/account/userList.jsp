<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
	<div>
		<ul class="breadcrumb">
			<li>
				<a href="#">Home</a> <span class="divider">/ 系统管理 / 账户</span>
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
					<a class="ajax-link" href="#" action="${ctx}/admin/user/create"><i class="icon-plus"></i> Members</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="ajax-link" href="#"><i class="icon-search"></i>Search</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</h2>
				<input placeholder="输入用户名" class="input-small" name="search_LIKE_name" value="${param.search_LIKE_name}" type="text">&nbsp;&nbsp;&nbsp;&nbsp;
				<input placeholder="输入登录名" class="input-small" name="search_LIKE_loginName" value="${param.search_LIKE_loginName}" type="text">&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div class="box-content">
			<table class="table table-bordered table-striped table-condensed">
				<thead>
					<tr role="row">
						<th>用户</th>
						<th>登录帐号</th>
						<th>状态</th>
						<th>创建时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${users.content}" var="user" varStatus="status">
						<tr <c:if test="${status.index % 2 == 0}">class="even"</c:if>
							<c:if test="${status.index % 2 == 1}">class="odd"</c:if>>
							<td class=" sorting_1">${user.name}</td>
							<td class="center ">${user.loginName}</td>
							<td class="center ">
								<c:if test="${user.active}"><span class="label label-success">Active</span></c:if>
								<c:if test="${!user.active}"><span class="label label-important">Banned</span></c:if>
							</td>
							<td class="center "><fmt:formatDate value="${user.created}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td class="center ">
								<shiro:hasPermission name="user:edit">
									<a class="btn btn-info" style="padding: 0;"
										href="${ctx}/admin/user/update/${user.id}" title="编辑"><i
										class="icon-edit icon-white"></i> </a>
									<a class="btn btn-danger" style="padding: 0;"
										href="${ctx}/admin/user/delete/${user.id}" title="删除"><i
										class="icon-trash icon-white"></i> </a>
								</shiro:hasPermission>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<tags:pagination page="${users}" paginationSize="5" action="${ctx}/admin/user" />
			
		</div>
		</div><!--/span-->
	</div>
	
	<!-- public common.js -->
	<script src="${ctx}/static/js/common.js"></script>