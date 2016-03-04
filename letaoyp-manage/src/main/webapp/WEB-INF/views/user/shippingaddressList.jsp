<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ user / 收货地址</span>
		</li>
	</ul>
</div>
<c:if test="${not empty message}">
	<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
</c:if>

<div class="row-fluid sortable ui-sortable">	
	<div class="box span12">
		<div class="box-header well" data-original-title="">
			<form action="${ctx}/user/shippingaddress" method="post">
			<h2>
				<span class="ajax-link btn btn-primary" action="${ctx}/user/shippingaddress/create"><i class="icon-plus"></i> 收货地址</span>
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
					<th sortColumn="member" >member</th>
					<th sortColumn="area" >area</th>
					<th sortColumn="receiver" >收货人</th>
					<th sortColumn="address" >详细地址</th>
					<th sortColumn="mobile" >电话</th>
					<th sortColumn="phone" >手机</th>
					<th sortColumn="buliding_flag" >标志建筑</th>
					<th sortColumn="email" >email</th>
					<th sortColumn="zip_code" >zipCode</th>
					<th sortColumn="receive_time" >预约送货时间</th>
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
					<td class="center">${item.member}</td>
					<td class="center">${item.area}</td>
					<td class="center">${item.receiver}</td>
					<td class="center">${item.address}</td>
					<td class="center">${item.mobile}</td>
					<td class="center">${item.phone}</td>
					<td class="center">${item.bulidingFlag}</td>
					<td class="center">${item.email}</td>
					<td class="center">${item.zipCode}</td>
					<td class="center">${item.receiveTime}</td>
					<td class="center ">
						<shiro:hasPermission name="shippingaddress:edit">
							<a class="btn btn-info ajax-link" style="padding: 0;"
								action="${ctx}/user/shippingaddress/update/${item.id}" title="编辑">
								<i class="icon-edit icon-white"></i> </a>
							<a class="btn btn-danger ajax-link" style="padding: 0;"
								action="${ctx}/user/shippingaddress/delete/${item.id}" title="删除">
								<i class="icon-trash icon-white"></i> </a>
						</shiro:hasPermission>
					</td>
				</tr>
			</c:forEach>
			</tbody>
	   </table>
	   <tags:pagination page="${page}" paginationSize="5" action="${ctx}/user/shippingaddress" />
	</div>
	</div><!--/span-->
</div>

<!-- public common.js -->
<script src="${ctx}/static/js/charisma.js"></script>