<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<form id="form" class="form-horizontal" form-validate action="${ctx}/sku/goodschoosen/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">${goodsChoosen.id == null ? '新增' : '编辑'}</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
			<input type="hidden" id="id" name="id" value="${goodsChoosen.id}" />

			<div class="form-group">
				<label class="col-sm-4 control-label" for="goods">goods</label>
				<div class="col-sm-6">
					<input class="form-control" id="goods" name="goods" type="text" value="${goodsChoosen.goods}" /> <span
						class="help-inline"><form:errors path="goods" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="name">选择条件名称 eg: 尺码</label>
				<div class="col-sm-6">
					<input class="form-control" id="name" name="name" type="text" value="${goodsChoosen.name}" /> <span
						class="help-inline"><form:errors path="name" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="value">选择条件值 eg: S M L XL</label>
				<div class="col-sm-6">
					<input class="form-control" id="value" name="value" type="text" value="${goodsChoosen.value}" /> <span
						class="help-inline"><form:errors path="value" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="cost">选择该条件后 额外需要支付价格</label>
				<div class="col-sm-6">
					<input class="form-control" id="cost" name="cost" type="text" value="${goodsChoosen.cost}" /> <span
						class="help-inline"><form:errors path="cost" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="active">active</label>
				<div class="col-sm-6">
					<input type="radio" name="active" class="minimal icheck" <c:if test="${goodsChoosen.active}">checked</c:if>
						value="1"> <span class="label label-success">Active</span> &nbsp;&nbsp; <input type="radio" name="active"
						class="minimal icheck" <c:if test="${!goodsChoosen.active}">checked</c:if> value="0"> <span
						class="label label-danger">Banned</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="created">created</label>
				<div class="col-sm-6">
					<input class="form-control" id="created" name="created" type="text"
						value="<fmt:formatDate value='${goodsChoosen.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="modified">modified</label>
				<div class="col-sm-6">
					<input class="form-control" id="modified" name="modified" type="text"
						value="<fmt:formatDate value='${goodsChoosen.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
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