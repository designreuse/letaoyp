<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		系统账号 <small>列表</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="${ctx}/admin"><i class="fa fa-dashboard"></i> Home</a></li>
		<li>系统管理</li>
		<li class="active">账号</li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">
						<form id="searchForm" action="${ctx}/admin/account">
							<button type="button" class="btn btn-default btn-sm checkbox-toggle" data-toggle-for="checkbox-toggled">
								<i class="fa fa-square-o"></i>
							</button>
							<div class="btn-group">
								<shiro:hasPermission name="admin:account:edit">
									<a action="${ctx}/admin/account/create" class="btn btn-default btn-sm" title="新增" data-toggle="modal"
										data-target="#modal_user_form"> <i class="fa fa-plus-square"></i>
									</a>
									<button type="button" class="btn btn-default btn-sm" title="失效" ajax data-data='{"active": "0"}'
										data-confirm="请确认失效选中记录？" data-url="${ctx}/admin/account/settings" data-method="post">
										<i class="fa fa-ban"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm" title="激活" ajax data-data='{"active": "1"}'
										data-url="${ctx}/admin/account/settings" data-method="post">
										<i class="fa fa-toggle-on"></i>
									</button>
								</shiro:hasPermission>

								<shiro:hasPermission name="admin:account:delete">
									<button type="button" class="btn btn-default btn-sm" title="删除" ajax data-confirm="该操作将永久删除记录，确认删除？"
										data-url="${ctx}/admin/account/delete" data-method="post">
										<i class="fa fa-trash-o"></i>
									</button>
								</shiro:hasPermission>
							</div>


							<button type="button" id="button_search" class="btn btn-default btn-sm ajax_link">
								<i class="fa fa-search"></i>
							</button>
							<div class="box-tools pull-right" style="margin-left: 10px;">
								<input placeholder="start time" class="datepicker input-sm" name="search_GT_created"
									value="${param.search_GT_created}" type="text"> <input placeholder="end time"
									class="datepicker input-sm" name="search_LT_created" value="${param.search_LT_created}" type="text"> <input
									placeholder="输入用户名" class="input-sm" name="search_LIKE_name" value="${param.search_LIKE_name}" type="text">
								<input placeholder="输入登录名" class="input-sm" name="search_LIKE_loginName" value="${param.search_LIKE_loginName}"
									type="text"> <input id="page" name="page" value="${param.page == null ? 1 : param.page}" type="hidden">
							</div>
						</form>
					</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table class="table table-bordered table-hover">
						<thead>
							<tr role="row">
								<th>用户</th>
								<th>登录帐号</th>
								<th>状态</th>
								<th>创建时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="checkbox-toggled">
							<c:forEach items="${users.content}" var="user" varStatus="status">
								<tr <c:if test="${status.index % 2 == 0}">class="even"</c:if>
									<c:if test="${status.index % 2 == 1}">class="odd"</c:if>>
									<td class=" sorting_1"><input class="icheck" type="checkbox" value="${user.id}"> ${user.name}</td>
									<td class="center ">${user.loginName}</td>
									<td class="center "><c:if test="${user.active}">
											<span class="label label-success">Active</span>
										</c:if> <c:if test="${!user.active}">
											<span class="label label-danger">Banned</span>
										</c:if></td>
									<td class="center "><fmt:formatDate value="${user.created}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td class="center "><shiro:hasPermission name="admin:account:edit">
											<a action="${ctx}/admin/account/update/${user.id}" title="编辑" data-toggle="modal"
												data-target="#modal_user_form"><i class="fa fa-edit"></i> </a>
										</shiro:hasPermission> <shiro:hasPermission name="admin:account:delete">
											<a href="${ctx}/admin/account/delete/${user.id}" single-delete title="删除"><i class="fa fa-trash-o"></i> </a>
										</shiro:hasPermission></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<tags:pagination page="${users}" paginationSize="5" action="${ctx}/admin/account" />

				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>


<div id="modal_user_form" class="modal fade" role="dialog" aria-labelledby="...">
	<div class="modal-dialog">
		<div class="modal-content"></div>
	</div>
</div>
<!-- /.modal -->

<script type="text/javascript" src="${ctx}/static/js/app_single.js" />
