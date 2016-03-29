<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<form id="form" class="form-horizontal" form-validate action="${ctx}/info/area/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">${area.id == null ? '新增' : '编辑'}</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
			<input type="hidden" id="id" name="id" value="${area.id}" />

			<div class="form-group">
				<label class="col-sm-4 control-label" for="sort">排序</label>
				<div class="col-sm-6">
					<input class="form-control" id="sort" name="sort" type="text" value="${area.sort}" /> <span class="help-inline"><form:errors
							path="sort" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="fullName">全名</label>
				<div class="col-sm-6">
					<input class="form-control" id="fullName" name="fullName" type="text" value="${area.fullName}"
						data-rule-required="true" data-msg-required="请输入全名" /> <span class="help-inline"><form:errors
							path="fullName" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="name">地名</label>
				<div class="col-sm-6">
					<input class="form-control" id="name" name="name" type="text" value="${area.name}" data-rule-required="true"
						data-msg-required="请输入地名" /> <span class="help-inline"><form:errors path="name" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="treePath">树路径</label>
				<div class="col-sm-6">
					<input class="form-control" id="treePath" name="treePath" type="text" value="${area.treePath}"
						data-rule-required="true" data-msg-required="请输入树路径" /> <span class="help-inline"><form:errors
							path="treePath" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="parent">父节点</label>
				<div class="col-sm-6">
					<input class="form-control" id="parent" name="parent" type="text" value="${area.parent}" /> <span
						class="help-inline"><form:errors path="parent" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="active">active</label>
				<div class="col-sm-6">
					<input type="radio" name="active" class="minimal icheck" <c:if test="${area.active}">checked</c:if> value="1">
					<span class="label label-success">Active</span> &nbsp;&nbsp; <input type="radio" name="active"
						class="minimal icheck" <c:if test="${!area.active}">checked</c:if> value="0"> <span
						class="label label-danger">Banned</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="created">创建时间</label>
				<div class="col-sm-6">
					<input class="form-control" id="created" name="created" type="text"
						value="<fmt:formatDate value='${area.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="modified">更新时间</label>
				<div class="col-sm-6">
					<input class="form-control" id="modified" name="modified" type="text"
						value="<fmt:formatDate value='${area.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
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