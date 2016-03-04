<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
	<div>
		<ul class="breadcrumb">
			<li>
				<a href="${ctx}/">Home</a> <span class="divider">/ 系统管理 / 用户</span>
			</li>
		</ul>
	</div>

	<div class="row-fluid sortable">
		<div class="box span12">
			<div class="box-header well" data-original-title>
				<h2><i class="icon-edit"></i> Form Elements</h2>
			</div>
			<div class="box-content">
				<form id="userForm" action="${ctx}/admin/user/update" method="post" class="form-horizontal">
				  <fieldset>
				  	<input type="hidden" name="id" value="${user.id}"/>
						<div class="control-group">
							<label class="control-label" for="description">用户</label>
							<div class="controls">
								<input class="input-xlarge focused" id="name" name="name" type="text" value="${user.name}">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="focusedInput">登录帐号</label>
							<div class="controls">
								<input class="input-xlarge focused" id="loginName" name="loginName" type="text" value="${user.loginName}">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="plainPassword">密码</label>
							<div class="controls">
								<input type="password" id="plainPassword" name="plainPassword" class="input-large" placeholder="...Leave it blank if no change"/>
							</div>
						</div>
						<div class="control-group">
							<label for="confirmPassword" class="control-label">确认密码:</label>
							<div class="controls">
								<input type="password" id="confirmPassword" name="confirmPassword" class="input-large" equalTo="#plainPassword" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="permission">状态</label>
							<div class="controls">
								<c:if test="${user.active}"><span class="label label-success">Active</span></c:if>
								<c:if test="${!user.active}"><span class="label label-important">Banned</span></c:if>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="disabledInput">创建时间</label>
							<div class="controls">
								<input class="input-xlarge disabled" id="disabledInput"
									type="text" placeholder="<fmt:formatDate value="${user.created}" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled="">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="disabledInput">修改时间</label>
							<div class="controls">
								<input class="input-xlarge disabled" id="disabledInput"
									type="text" placeholder="<fmt:formatDate value="${user.modified}" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled="">
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
