<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<form id="form" class="form-horizontal" form-validate action="${ctx}/sku/brandcategory/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">${brandCategory.id == null ? '新增' : '编辑'}</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
			<input type="hidden" id="id" name="id" value="${brandCategory.id}" />

			<div class="form-group">
				<label class="col-sm-4 control-label" for="brand">brand</label>
				<div class="col-sm-6">
					<input class="form-control" id="brand" name="brand" type="text" value="${brandCategory.brand}"
						data-rule-required="true" data-msg-required="请输入brand" /> <span class="help-inline"><form:errors
							path="brand" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="brandName">brandName</label>
				<div class="col-sm-6">
					<input class="form-control" id="brandName" name="brandName" type="text" value="${brandCategory.brandName}"
						data-rule-required="true" data-msg-required="请输入brandName" /> <span class="help-inline"><form:errors
							path="brandName" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="category">category</label>
				<div class="col-sm-6">
					<input class="form-control" id="category" name="category" type="text" value="${brandCategory.category}"
						data-rule-required="true" data-msg-required="请输入category" /> <span class="help-inline"><form:errors
							path="category" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="active">active</label>
				<div class="col-sm-6">
					<input type="radio" name="active" class="minimal icheck" <c:if test="${brandCategory.active}">checked</c:if>
						value="1"> <span class="label label-success">Active</span> &nbsp;&nbsp; <input type="radio" name="active"
						class="minimal icheck" <c:if test="${!brandCategory.active}">checked</c:if> value="0"> <span
						class="label label-danger">Banned</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="created">created</label>
				<div class="col-sm-6">
					<input class="form-control" id="created" name="created" type="text"
						value="<fmt:formatDate value='${brandCategory.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="modified">modified</label>
				<div class="col-sm-6">
					<input class="form-control" id="modified" name="modified" type="text"
						value="<fmt:formatDate value='${brandCategory.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
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