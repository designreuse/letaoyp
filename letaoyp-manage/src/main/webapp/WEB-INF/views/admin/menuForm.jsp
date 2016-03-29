<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<form id="form" class="form-horizontal" form-validate action="${ctx}/admin/menu/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">${menu.id == null ? '新增' : '编辑'}</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
			<input type="hidden" id="id" name="id" value="${menu.id}" />

			<div class="form-group">
				<label class="col-sm-4 control-label" for="name">name</label>
				<div class="col-sm-6">
					<input class="form-control" id="name" name="name" type="text" value="${menu.name}" data-rule-required="true"
						data-msg-required="请输入name" /> <span class="help-inline"><form:errors path="name" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="description">description</label>
				<div class="col-sm-6">
					<input class="form-control" id="description" name="description" type="text" value="${menu.description}"
						data-rule-required="true" data-msg-required="请输入description" /> <span class="help-inline"><form:errors
							path="description" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="icon">icon</label>
				<div class="col-sm-6">
					<input class="form-control" id="icon" name="icon" type="text" value="${menu.icon}" /> <span class="help-inline"><form:errors
							path="icon" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="parent">父ID</label>
				<div class="col-sm-6">
					<input class="form-control" id="parent" name="parent" type="text" value="${menu.parent}" data-rule-required="true"
						data-msg-required="请输入父ID" /> <span class="help-inline"><form:errors path="parent" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="sort">排序 desc</label>
				<div class="col-sm-6">
					<input class="form-control" id="sort" name="sort" type="text" value="${menu.sort}" /> <span class="help-inline"><form:errors
							path="sort" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="link">link</label>
				<div class="col-sm-6">
					<input class="form-control" id="link" name="link" type="text" value="${menu.link}" data-rule-required="true"
						data-msg-required="请输入link" /> <span class="help-inline"><form:errors path="link" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="permission">permission</label>
				<div class="col-sm-6">
					<input class="form-control" id="permission" name="permission" type="text" value="${menu.permission}"
						data-rule-required="true" data-msg-required="请输入permission" /> <span class="help-inline"><form:errors
							path="permission" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="active">active</label>
				<div class="col-sm-6">
					<input type="radio" name="active" class="minimal icheck" <c:if test="${menu.active}">checked</c:if> value="1">
					<span class="label label-success">Active</span> &nbsp;&nbsp; <input type="radio" name="active"
						class="minimal icheck" <c:if test="${!menu.active}">checked</c:if> value="0"> <span
						class="label label-danger">Banned</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="created">created</label>
				<div class="col-sm-6">
					<input class="form-control" id="created" name="created" type="text"
						value="<fmt:formatDate value='${menu.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="modified">modified</label>
				<div class="col-sm-6">
					<input class="form-control" id="modified" name="modified" type="text"
						value="<fmt:formatDate value='${menu.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
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
