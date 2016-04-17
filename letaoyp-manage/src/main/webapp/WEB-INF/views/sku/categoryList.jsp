<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctx}/static/plugins/ztree/metroStyle/metroStyle.css">

<div class="box">
	<div class="box-header with-border">
		<h3 class="box-title">
			<form id="searchForm" action="${ctx}/sku/category">
				<button type="button" class="btn btn-default btn-sm checkbox-toggle" data-toggle-for="checkbox-toggled">
					<i class="fa fa-square-o"></i>
				</button>
				<div class="btn-group">
					<shiro:hasPermission name="sku:category:edit">
						<a action="${ctx}/sku/category/create" class="btn btn-default btn-sm" title="新增" data-toggle="modal"
							data-target="#modal_form"> <i class="fa fa-plus-square"></i>
						</a>
						<button type="button" class="btn btn-default btn-sm" title="失效" ajax data-data='{"active": "0"}'
							data-confirm="确认失效选中记录？" data-url="${ctx}/sku/category/settings" data-method="post"
							data-before="before">
							<i class="fa fa-ban"></i>
						</button>
						<button type="button" class="btn btn-default btn-sm" title="激活" ajax data-data='{"active": "1"}'
							data-url="${ctx}/sku/category/settings" data-method="post">
							<i class="fa fa-toggle-on"></i>
						</button>
					</shiro:hasPermission>

					<shiro:hasPermission name="sku:category:delete">
						<button type="button" class="btn btn-default btn-sm" title="删除" ajax data-confirm="该操作将永久删除记录，确认删除？"
							data-url="${ctx}/sku/category/delete" data-method="post">
							<i class="fa fa-trash-o"></i>
						</button>
					</shiro:hasPermission>
				</div>

				<button type="button" id="button_search" class="btn btn-default btn-sm ajax_link" data-override="#loading">
					<i class="fa fa-search"></i>
				</button>
				<div class="box-tools pull-right" style="margin-left: 10px;">
					<input placeholder="start time" class="datepicker input-sm" name="search_GT_created" value="${param.search_GT_created}" type="text"> 
					<input placeholder="end time" class="datepicker input-sm" name="search_LT_created" value="${param.search_LT_created}" type="text"> 
					<input placeholder="名称" class="input-sm" name="search_LIKE_name" value="${param.search_LIKE_name}" type="text">
					<select class="input-sm" name="search_EQ_top">
               <option>是否置顶</option>
               <option value="true">是</option>
               <option value="false">否</option>
             </select>
					<input id="input_search_category" name="search_EQ_parent" value="${param.search_EQ_parent}" type="hidden">
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
					<th sortColumn="name">名称</th>
					<th sortColumn="sort">排序</th>
					<th sortColumn="icon">图标</th>
					<th sortColumn="top">置顶首页</th>
					<th sortColumn="logo">类目logo</th>
					<th sortColumn="active">状态</th>
					<th sortColumn="created">创建时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="checkbox-toggled">
				<c:forEach items="${page.content}" var="category" varStatus="status">
					<tr>
						<td class="center"><input class="icheck" type="checkbox" value="${category.id}">${category.name}</td>
						<td class="center">${category.sort}</td>
						<td class="center"><img src="${category.icon}" width="40px" height="40px" /></td>
						<td class="center">${category.top ? '是' : '否'}</td>
						<td class="center"><img src="${category.logo}" width="150px" height="60px" /></td>
						<td class="center">${category.active}</td>
						<td class="center"><fmt:formatDate value='${category.created}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
						<td class="center ">
						  <shiro:hasPermission name="sku:category:edit">
								<a href="#modal_form" action="${ctx}/sku/category/update/${category.id}" title="编辑" data-toggle="modal"
									data-target="#modal_form"><i class="fa fa-edit"></i> </a>
							</shiro:hasPermission>
							<shiro:hasPermission name="info:advertise:edit">
                <a href="#modal_form" action="${ctx}/info/advertise/create/from?sequence=${category.id}&model=HOME_CATEGORY" title="设定置顶图片" data-toggle="modal"
                  data-target="#modal_form"><i class="fa fa-upload"></i> </a>
                <a href="${ctx}/sku/catagory/top/${category.id}?top=${category.top ? 0 : 1}" class="ajax_link" title="${category.top ? '取消置顶':'置顶首页'}">
                  <i class="fa ${category.top ? 'fa-sort-down' : 'fa-sort-up'}"></i> 
                </a>
              </shiro:hasPermission> 
							<shiro:hasPermission name="sku:category:delete">
								<a href="${ctx}/sku/category/delete/${category.id}" single-delete title="删除"><i class="fa fa-trash-o"></i> </a>
							</shiro:hasPermission></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<tags:pagination page="${page}" paginationSize="5" action="${ctx}/sku/category" />

	<!-- /.box-body -->
</div>
<!-- /.box -->

<script type="text/javascript" src="${ctx}/static/js/app_single.js" />