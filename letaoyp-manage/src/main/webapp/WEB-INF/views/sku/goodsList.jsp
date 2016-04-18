<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ page import="com.iac.letaoyp.entity.sku.Goods.Status"%>
<%@ page import="com.iac.letaoyp.entity.sku.GoodsTop.Position"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
  request.setAttribute("statuses", Status.values());
  request.setAttribute("positions", Position.values());
%>
<div class="box">
	<div class="box-header with-border">
		<h3 class="box-title">
			<form id="searchForm" action="${ctx}/sku/goods">
				<button type="button" class="btn btn-default btn-sm checkbox-toggle" data-toggle-for="checkbox-toggled">
					<i class="fa fa-square-o"></i>
				</button>
				<div class="btn-group">
					<shiro:hasPermission name="sku:goods:edit">
						<a action="${ctx}/sku/goods/create" class="btn btn-default btn-sm" title="新增" data-toggle="modal"
							data-target="#modal_form"> <i class="fa fa-plus-square"></i>
						</a>
						<button type="button" class="btn btn-default btn-sm" title="失效" ajax data-data='{"active": "0"}'
							data-confirm="确认失效选中记录？" data-url="${ctx}/sku/goods/settings" data-method="post">
							<i class="fa fa-ban"></i>
						</button>
						<button type="button" class="btn btn-default btn-sm" title="激活" ajax data-data='{"active": "1"}'
							data-url="${ctx}/sku/goods/settings" data-method="post">
							<i class="fa fa-toggle-on"></i>
						</button>
					</shiro:hasPermission>

					<shiro:hasPermission name="sku:goods:delete">
						<button type="button" class="btn btn-default btn-sm" title="删除" ajax data-confirm="该操作将永久删除记录，确认删除？"
							data-url="${ctx}/sku/goods/delete" data-method="post">
							<i class="fa fa-trash-o"></i>
						</button>
					</shiro:hasPermission>
				</div>


				<button type="button" id="button_search" class="btn btn-default btn-sm ajax_link" data-override="#loading">
					<i class="fa fa-search"></i>
				</button>
				<div class="box-tools pull-right" style="margin-left: 10px;">
					<input placeholder="start time" class="datepicker input-sm" name="search_GT_created"
						value="${param.search_GT_created}" type="text"> 
					<input placeholder="end time" class="datepicker input-sm"
						name="search_LT_created" value="${param.search_LT_created}" type="text"> 
					<input id="page" name="page"
						value="${param.page == null ? 1 : param.page}" type="hidden">
					<input id="input_search_category" name="search_EQ_category"
						value="${param.search_EQ_category}" type="hidden">
					<select id="select_status" name="search_EQ_status" class="input-sm input-medium">
					  <option value="">选择状态</option>
					  <c:forEach items="${statuses}" var="status">
					    <option value="${status}" <c:if test="${param.search_EQ_status == status}">selected="selected"</c:if>>${status.description}</option>
					  </c:forEach>
					</select>
					<select id="select_topPostion" name="search_EQ_topPosition" class="input-sm input-medium">
					  <option value="">选择置顶状态</option>
					  <c:forEach items="${positions}" var="position">
					    <option value="${position}" <c:if test="${param.search_EQ_topPosition == position}">selected="selected"</c:if>>${position.desc}</option>
					  </c:forEach>
					</select>
				</div>
			</form>
		</h3>
	</div>
	<!-- /.box-header -->
	<div class="box-body">
		<table class="table table-bordered table-hover">
			<thead>
				<tr role="row">
					<th sortColumn="name">商品名</th>
					<th sortColumn="hits">点击数</th>
					<th sortColumn="sales_price">销售价</th>
					<th sortColumn="market_price">市场价</th>
					<th sortColumn="cost">成本价</th>
					<th sortColumn="star">星级</th>
					<th sortColumn="comments">评论数</th>
					<th sortColumn="status">状态</th>
					<th sortColumn="online_time">上架时间</th>
					<th sortColumn="active">active</th>
					<th sortColumn="active" title="首页长图，首页右侧图，首页上新图">置顶位置</th>
					<th sortColumn="created">创建时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="checkbox-toggled">
				<c:forEach items="${page.content}" var="goods" varStatus="status">
					<tr>
						<td class="center"><input class="icheck" type="checkbox" value="${goods.id}">${goods.name}</td>
						<td class="center">${goods.hits}</td>
						<td class="center">${goods.salesPrice}</td>
						<td class="center">${goods.marketPrice}</td>
						<td class="center">${goods.cost}</td>
						<td class="center">${goods.star}</td>
						<td class="center">${goods.comments}</td>
						<td class="center">${goods.status.description}</td>
						<td class="center"><fmt:formatDate value='${goods.onlineTime}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
						<td class="center">${goods.active}</td>
						<td class="center">${goods.topPosition.desc}</td>
						<td class="center"><fmt:formatDate value='${goods.created}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
						<td class="center "><shiro:hasPermission name="sku:goods:edit">
								<a href="#modal_form" action="${ctx}/sku/goods/update/${goods.id}" title="编辑" data-toggle="modal"
									data-target="#modal_form"><i class="fa fa-edit"></i> </a>
								<c:if test="${goods.status == 'ONLINE'}">
								  <a href="${ctx}/sku/goods/offline/${goods.id}" class="ajax_link" type="post" data-data='{"status" : "OFFLINE"}' title="下架"><i class="fa fa-lock"></i> </a>
								</c:if>
								<c:if test="${goods.status == 'OFFLINE'}">
								  <a href="${ctx}/sku/goods/online/${goods.id}" class="ajax_link" type="post" title="上架"><i class="fa fa-unlock"></i> </a>
								</c:if>
								
								<c:if test="${goods.status == 'ONLINE' && goods.active}">
									<c:if test="${goods.topPosition != null}">
	                  <a href="${ctx}/sku/goods/untop/${goods.id}" class="ajax_link" type="post" title="取消置顶"><i class="fa fa-sort-down"></i> </a>
	                </c:if>
	                <c:if test="${goods.topPosition == null}">
	                  <a href="#modal_form" action="${ctx}/sku/goodstop/from/${goods.id}?position=HOME_HORIZONTAL" title="设置置顶" data-toggle="modal"
	                    data-target="#modal_form"><i class="fa fa-sort-up"></i> </a>
	                </c:if>
                </c:if>
							</shiro:hasPermission> 
							<shiro:hasPermission name="sku:goods:delete">
								<a href="${ctx}/sku/goods/delete/${goods.id}" single-delete title="删除"><i class="fa fa-trash-o"></i> </a>
							</shiro:hasPermission></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<tags:pagination page="${page}" paginationSize="5" action="${ctx}/sku/goods" />

	<!-- /.box-body -->
</div>
<!-- /.box -->


<div id="modal_form" class="modal fade" role="dialog" aria-labelledby="...">
	<div class="modal-dialog modal-lg">
		<div class="modal-content"></div>
	</div>
</div>
<!-- /.modal -->

<script type="text/javascript" src="${ctx}/static/js/app_single.js" />

<script>
  $(function() {
    $('.content-header h1 small').text('商品');
    $('.content-header ol li.active').text('商品');
  })
</script>