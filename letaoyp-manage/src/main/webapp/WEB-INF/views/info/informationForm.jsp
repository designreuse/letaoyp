<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<form id="form" class="form-horizontal" form-validate action="${ctx}/info/information/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">${information.id == null ? '新增' : '编辑'}</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
			<input type="hidden" id="id" name="id" value="${information.id}" />

			<div class="form-group">
				<label class="col-sm-4 control-label" for="title">title</label>
				<div class="col-sm-6">
					<input class="form-control" id="title" name="title" type="text" value="${information.title}" /> <span
						class="help-inline"><form:errors path="title" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="description">description</label>
				<div class="col-sm-6">
					<input class="form-control" id="description" name="description" type="text" value="${information.description}" />
					<span class="help-inline"><form:errors path="description" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="detail">detail</label>
				<div class="col-sm-6">
					<input class="form-control" id="detail" name="detail" type="text" value="${information.detail}" /> <span
						class="help-inline"><form:errors path="detail" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="model">ANNOUNCEMENT 公告; HELP 帮助</label>
				<div class="col-sm-6">
					<input class="form-control" id="model" name="model" type="text" value="${information.model}" /> <span
						class="help-inline"><form:errors path="model" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="top">top</label>
				<div class="col-sm-6">
					<input class="form-control" id="top" name="top" type="text" value="${information.top}" /> <span
						class="help-inline"><form:errors path="top" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="topImage">topImage</label>
				<div class="col-sm-6">
					<input class="form-control" id="topImage" name="topImage" type="text" value="${information.topImage}" /> <span
						class="help-inline"><form:errors path="topImage" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="active">active</label>
				<div class="col-sm-6">
					<input type="radio" name="active" class="minimal icheck" <c:if test="${information.active}">checked</c:if>
						value="1"> <span class="label label-success">Active</span> &nbsp;&nbsp; <input type="radio" name="active"
						class="minimal icheck" <c:if test="${!information.active}">checked</c:if> value="0"> <span
						class="label label-danger">Banned</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="created">created</label>
				<div class="col-sm-6">
					<input class="form-control" id="created" name="created" type="text"
						value="<fmt:formatDate value='${information.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="modified">modified</label>
				<div class="col-sm-6">
					<input class="form-control" id="modified" name="modified" type="text"
						value="<fmt:formatDate value='${information.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
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