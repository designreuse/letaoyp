<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<form id="form" class="form-horizontal" form-validate action="${ctx}/admin/log/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">${log.id == null ? '新增' : '编辑'}</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
			<input type="hidden" id="id" name="id" value="${log.id}" />

			<div class="form-group">
				<label class="col-sm-4 control-label" for="type">日志类型</label>
				<div class="col-sm-6">
					<input class="form-control" id="type" name="type" type="text" value="${log.type}" /> <span class="help-inline"><form:errors
							path="type" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="content">日志内容</label>
				<div class="col-sm-6">
					<input class="form-control" id="content" name="content" type="text" value="${log.content}" /> <span
						class="help-inline"><form:errors path="content" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="remoteAddr">操作IP地址</label>
				<div class="col-sm-6">
					<input class="form-control" id="remoteAddr" name="remoteAddr" type="text" value="${log.remoteAddr}" /> <span
						class="help-inline"><form:errors path="remoteAddr" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="userAgent">用户代理</label>
				<div class="col-sm-6">
					<input class="form-control" id="userAgent" name="userAgent" type="text" value="${log.userAgent}" /> <span
						class="help-inline"><form:errors path="userAgent" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="requestUri">请求URI</label>
				<div class="col-sm-6">
					<input class="form-control" id="requestUri" name="requestUri" type="text" value="${log.requestUri}" /> <span
						class="help-inline"><form:errors path="requestUri" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="method">操作方式</label>
				<div class="col-sm-6">
					<input class="form-control" id="method" name="method" type="text" value="${log.method}" /> <span
						class="help-inline"><form:errors path="method" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="params">参数</label>
				<div class="col-sm-6">
					<input class="form-control" id="params" name="params" type="text" value="${log.params}" /> <span
						class="help-inline"><form:errors path="params" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="exception">异常信息</label>
				<div class="col-sm-6">
					<input class="form-control" id="exception" name="exception" type="text" value="${log.exception}" /> <span
						class="help-inline"><form:errors path="exception" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="creator">创建者</label>
				<div class="col-sm-6">
					<input class="form-control" id="creator" name="creator" type="text" value="${log.creator}" /> <span
						class="help-inline"><form:errors path="creator" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="active">active</label>
				<div class="col-sm-6">
					<input type="radio" name="active" class="minimal icheck" <c:if test="${log.active}">checked</c:if> value="1">
					<span class="label label-success">Active</span> &nbsp;&nbsp; <input type="radio" name="active"
						class="minimal icheck" <c:if test="${!log.active}">checked</c:if> value="0"> <span
						class="label label-danger">Banned</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="created">created</label>
				<div class="col-sm-6">
					<input class="form-control" id="created" name="created" type="text"
						value="<fmt:formatDate value='${log.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="modified">modified</label>
				<div class="col-sm-6">
					<input class="form-control" id="modified" name="modified" type="text"
						value="<fmt:formatDate value='${log.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
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
