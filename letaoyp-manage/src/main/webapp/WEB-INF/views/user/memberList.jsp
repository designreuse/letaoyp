<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ user / 人员表</span>
		</li>
	</ul>
</div>
<c:if test="${not empty message}">
	<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
</c:if>

<div class="row-fluid sortable ui-sortable">	
	<div class="box span12">
		<div class="box-header well" data-original-title="">
			<form action="${ctx}/user/member" method="post">
			<h2>
				<span class="ajax-link btn btn-primary" action="${ctx}/user/member/create"><i class="icon-plus"></i> 人员表</span>
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
					<th sortColumn="username" >username</th>
					<th sortColumn="password" >password</th>
					<th sortColumn="salt" >加密salt</th>
					<th sortColumn="area" >area</th>
					<th sortColumn="address" >详细地址</th>
					<th sortColumn="birth" >birth</th>
					<th sortColumn="email" >email</th>
					<th sortColumn="gender" >gender</th>
					<th sortColumn="is_locked" >isLocked</th>
					<th sortColumn="locked_date" >lockedDate</th>
					<th sortColumn="login_date" >loginDate</th>
					<th sortColumn="login_failure_count" >loginFailureCount</th>
					<th sortColumn="login_ip" >loginIp</th>
					<th sortColumn="mobile" >电话</th>
					<th sortColumn="phone" >手机</th>
					<th sortColumn="nick" >nick</th>
					<th sortColumn="register_ip" >registerIp</th>
					<th sortColumn="zip_code" >zipCode</th>
					<th sortColumn="attribute_value0" >attributeValue0</th>
					<th sortColumn="attribute_value1" >attributeValue1</th>
					<th sortColumn="attribute_value2" >attributeValue2</th>
					<th sortColumn="attribute_value3" >attributeValue3</th>
					<th sortColumn="attribute_value4" >attributeValue4</th>
					<th sortColumn="attribute_value5" >attributeValue5</th>
					<th sortColumn="attribute_value6" >attributeValue6</th>
					<th sortColumn="attribute_value7" >attributeValue7</th>
					<th sortColumn="attribute_value8" >attributeValue8</th>
					<th sortColumn="attribute_value9" >attributeValue9</th>
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
					<td class="center">${item.username}</td>
					<td class="center">${item.password}</td>
					<td class="center">${item.salt}</td>
					<td class="center">${item.area}</td>
					<td class="center">${item.address}</td>
					<td class="center"><fmt:formatDate value="${item.birth}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td class="center">${item.email}</td>
					<td class="center">${item.gender}</td>
					<td class="center">${item.isLocked}</td>
					<td class="center"><fmt:formatDate value="${item.lockedDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td class="center"><fmt:formatDate value="${item.loginDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td class="center">${item.loginFailureCount}</td>
					<td class="center">${item.loginIp}</td>
					<td class="center">${item.mobile}</td>
					<td class="center">${item.phone}</td>
					<td class="center">${item.nick}</td>
					<td class="center">${item.registerIp}</td>
					<td class="center">${item.zipCode}</td>
					<td class="center">${item.attributeValue0}</td>
					<td class="center">${item.attributeValue1}</td>
					<td class="center">${item.attributeValue2}</td>
					<td class="center">${item.attributeValue3}</td>
					<td class="center">${item.attributeValue4}</td>
					<td class="center">${item.attributeValue5}</td>
					<td class="center">${item.attributeValue6}</td>
					<td class="center">${item.attributeValue7}</td>
					<td class="center">${item.attributeValue8}</td>
					<td class="center">${item.attributeValue9}</td>
					<td class="center ">
						<shiro:hasPermission name="member:edit">
							<a class="btn btn-info ajax-link" style="padding: 0;"
								action="${ctx}/user/member/update/${item.id}" title="编辑">
								<i class="icon-edit icon-white"></i> </a>
							<a class="btn btn-danger ajax-link" style="padding: 0;"
								action="${ctx}/user/member/delete/${item.id}" title="删除">
								<i class="icon-trash icon-white"></i> </a>
						</shiro:hasPermission>
					</td>
				</tr>
			</c:forEach>
			</tbody>
	   </table>
	   <tags:pagination page="${page}" paginationSize="5" action="${ctx}/user/member" />
	</div>
	</div><!--/span-->
</div>

<!-- public common.js -->
<script src="${ctx}/static/js/charisma.js"></script>