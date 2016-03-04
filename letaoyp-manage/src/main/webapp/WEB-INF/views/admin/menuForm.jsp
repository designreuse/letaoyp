<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
	<div>
		<ul class="breadcrumb">
			<li>
				<a href="${ctx}/">Home</a> <span class="divider">/ 系统管理 / 菜单</span>
			</li>
		</ul>
	</div>

	<div class="row-fluid sortable">
		<div class="box span12">
			<div class="box-header well" data-original-title>
				<h2><i class="icon-edit"></i> Form Elements</h2>
			</div>
			<div class="box-content">
				<form id="menuForm" action="${ctx}/admin/menu/update" method="post" class="form-horizontal">
				  <fieldset>
					<input type="hidden" name="id" value="${menu.id}"/>
						<div class="control-group">
							<label class="control-label" for="description">菜单</label>
							<div class="controls">
								<input class="input-xlarge focused" id="description" name="description" type="text" value="${menu.description}">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="focusedInput">菜单项</label>
							<div class="controls">
								<input class="input-xlarge focused" id="name" name="name" type="text" value="${menu.name}">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="icon">图标</label>
							<div class="controls">
								<input class="input-xlarge" id="icon" name="icon" type="text" value="${menu.icon}">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="parent">父菜单</label>
							<div class="controls">
								<input class="input-xlarge" id="parent" name="parent" type="text" value="${menu.parent}">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="parent">排序</label>
							<div class="controls">
								<input class="input-xlarge" id="sort" name="sort" type="text" value="${menu.sort}">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="link">链接</label>
							<div class="controls">
								<input class="input-xlarge" id="link" name="link" type="text" value="${menu.link}">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="permission">权限</label>
							<div class="controls">
								<input class="input-xlarge" id="permission" name="permission" type="text" value="${menu.permission}">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="permission">状态</label>
							<div class="controls">
								<c:if test="${menu.active}"><span class="label label-success">Active</span></c:if>
								<c:if test="${!menu.active}"><span class="label label-important">Banned</span></c:if>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="disabledInput">创建时间</label>
							<div class="controls">
								<input class="input-xlarge disabled" id="disabledInput"
									type="text" value="<fmt:formatDate value="${menu.created}" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled="">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="disabledInput">修改时间</label>
							<div class="controls">
								<input class="input-xlarge disabled" id="disabledInput"
									type="text" value="<fmt:formatDate value="${menu.modified}" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled="">
							</div>
						</div>

						<div class="form-actions">
					  	<span id="form_submit" class="btn btn-primary">Save changes</span>
					  	<button type="reset" class="btn">Cancel</button>
					</div>
				  </fieldset>
				</form>   
			</div>
		</div><!--/span-->

	</div><!--/row-->
	
	<!-- public common.js -->
	<script src="${ctx}/static/js/common.js"></script>
