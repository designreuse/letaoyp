<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<form id="form" class="form-horizontal" form-validate action="${ctx}/admin/dict/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">${dict.id == null ? '新增' : '编辑'}</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
			<input type="hidden" id="id" name="id" value="${dict.id}" />

			<div class="form-group">
				<label class="col-sm-4 control-label" for="label">标签名</label>
				<div class="col-sm-6">
					<input class="form-control" id="label" name="label" type="text" value="${dict.label}" data-rule-required="true"
						data-msg-required="请输入标签名" /> <span class="help-inline"><form:errors path="label" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="value">数据值</label>
				<div class="col-sm-6">
					<input class="form-control" id="value" name="value" type="text" value="${dict.value}" data-rule-required="true"
						data-msg-required="请输入数据值" /> <span class="help-inline"><form:errors path="value" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="type">类型</label>
				<div class="col-sm-6">
					<input class="form-control" id="type" name="type" type="text" value="${dict.type}" data-rule-required="true"
						data-msg-required="请输入类型" /> <span class="help-inline"><form:errors path="type" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="description">描述</label>
				<div class="col-sm-6">
					<input class="form-control" id="description" name="description" type="text" value="${dict.description}"
						data-rule-required="true" data-msg-required="请输入描述" /> <span class="help-inline"><form:errors
							path="description" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="sort">排序（升序）</label>
				<div class="col-sm-6">
					<input class="form-control" id="sort" name="sort" type="text" value="${dict.sort}" data-rule-required="true"
						data-msg-required="请输入排序（升序）" /> <span class="help-inline"><form:errors path="sort" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="remarks">备注信息</label>
				<div class="col-sm-6">
					<input class="form-control" id="remarks" name="remarks" type="text" value="${dict.remarks}" /> <span
						class="help-inline"><form:errors path="remarks" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="active">active</label>
				<div class="col-sm-6">
					<input type="radio" name="active" class="minimal icheck" <c:if test="${dict.active}">checked</c:if> value="1">
					<span class="label label-success">Active</span> &nbsp;&nbsp; <input type="radio" name="active"
						class="minimal icheck" <c:if test="${!dict.active}">checked</c:if> value="0"> <span
						class="label label-danger">Banned</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="created">created</label>
				<div class="col-sm-6">
					<input class="form-control" id="created" name="created" type="text"
						value="<fmt:formatDate value='${dict.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="modified">modified</label>
				<div class="col-sm-6">
					<input class="form-control" id="modified" name="modified" type="text"
						value="<fmt:formatDate value='${dict.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
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
