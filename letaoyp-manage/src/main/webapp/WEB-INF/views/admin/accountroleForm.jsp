<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<form id="form" class="form-horizontal" form-validate action="${ctx}/admin/accountrole/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">${accountRole.id == null ? '新增' : '编辑'}</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
			<input type="hidden" id="id" name="id" value="${accountRole.id}" />

			<div class="form-group">
				<label class="col-sm-4 control-label" for="role">role</label>
				<div class="col-sm-6">
					<input class="form-control" id="role" name="role" type="text" value="${accountRole.role}" data-rule-required="true"
						data-msg-required="请输入role" /> <span class="help-inline"><form:errors path="role" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="account">account</label>
				<div class="col-sm-6">
					<input class="form-control" id="account" name="account" type="text" value="${accountRole.account}"
						data-rule-required="true" data-msg-required="请输入account" /> <span class="help-inline"><form:errors
							path="account" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="active">active</label>
				<div class="col-sm-6">
					<input type="radio" name="active" class="minimal icheck" <c:if test="${accountRole.active}">checked</c:if>
						value="1"> <span class="label label-success">Active</span> &nbsp;&nbsp; <input type="radio" name="active"
						class="minimal icheck" <c:if test="${!accountRole.active}">checked</c:if> value="0"> <span
						class="label label-danger">Banned</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="created">created</label>
				<div class="col-sm-6">
					<input class="form-control" id="created" name="created" type="text"
						value="<fmt:formatDate value='${accountRole.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="modified">modified</label>
				<div class="col-sm-6">
					<input class="form-control" id="modified" name="modified" type="text"
						value="<fmt:formatDate value='${accountRole.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
				</div>
			</div>

		</div>
	</div>
	<div class="modal-footer">
		<button type="reset" class="btn btn-default">重置</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		<button type="submit" class="btn btn-primary">提交</button>
	</div>
</form>

<script type="text/javascript" src="${ctx}/static/js/app_single.js" />
