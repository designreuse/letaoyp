<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<form id="form" class="form-horizontal" form-validate action="${ctx}/sku/brand/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">${brand.id == null ? '新增' : '编辑'}</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
			<input type="hidden" id="id" name="id" value="${brand.id}" />

			<div class="form-group">
				<label class="col-sm-4 control-label" for="order">降序 越大越靠前</label>
				<div class="col-sm-6">
					<input class="form-control" id="order" name="order" type="text" value="${brand.order}" /> <span
						class="help-inline"><form:errors path="order" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="introduction">introduction</label>
				<div class="col-sm-6">
					<input class="form-control" id="introduction" name="introduction" type="text" value="${brand.introduction}" /> <span
						class="help-inline"><form:errors path="introduction" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="logo">logo</label>
				<div class="col-sm-6">
					<input class="form-control" id="logo" name="logo" type="text" value="${brand.logo}" /> <span class="help-inline"><form:errors
							path="logo" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="name">name</label>
				<div class="col-sm-6">
					<input class="form-control" id="name" name="name" type="text" value="${brand.name}" data-rule-required="true"
						data-msg-required="请输入name" /> <span class="help-inline"><form:errors path="name" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="type">type</label>
				<div class="col-sm-6">
					<input class="form-control" id="type" name="type" type="text" value="${brand.type}" data-rule-required="true"
						data-msg-required="请输入type" /> <span class="help-inline"><form:errors path="type" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="url">url</label>
				<div class="col-sm-6">
					<input class="form-control" id="url" name="url" type="text" value="${brand.url}" /> <span class="help-inline"><form:errors
							path="url" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="active">active</label>
				<div class="col-sm-6">
					<input type="radio" name="active" class="minimal icheck" <c:if test="${brand.active}">checked</c:if> value="1">
					<span class="label label-success">Active</span> &nbsp;&nbsp; <input type="radio" name="active"
						class="minimal icheck" <c:if test="${!brand.active}">checked</c:if> value="0"> <span
						class="label label-danger">Banned</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="created">created</label>
				<div class="col-sm-6">
					<input class="form-control" id="created" name="created" type="text"
						value="<fmt:formatDate value='${brand.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="modified">modified</label>
				<div class="col-sm-6">
					<input class="form-control" id="modified" name="modified" type="text"
						value="<fmt:formatDate value='${brand.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
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