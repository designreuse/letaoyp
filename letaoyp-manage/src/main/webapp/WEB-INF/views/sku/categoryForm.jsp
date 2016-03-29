<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<form id="form" class="form-horizontal" form-validate action="${ctx}/sku/category/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">${category.id == null ? '新增' : '编辑'}</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
			<input type="hidden" id="id" name="id" value="${category.id}" />

			<div class="form-group">
				<label class="col-sm-4 control-label" for="order">降序排列</label>
				<div class="col-sm-6">
					<input class="form-control" id="order" name="order" type="text" value="${category.order}" /> <span
						class="help-inline"><form:errors path="order" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="name">name</label>
				<div class="col-sm-6">
					<input class="form-control" id="name" name="name" type="text" value="${category.name}" data-rule-required="true"
						data-msg-required="请输入name" /> <span class="help-inline"><form:errors path="name" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="seoDescription">seoDescription</label>
				<div class="col-sm-6">
					<input class="form-control" id="seoDescription" name="seoDescription" type="text"
						value="${category.seoDescription}" /> <span class="help-inline"><form:errors path="seoDescription" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="seoKeywords">seoKeywords</label>
				<div class="col-sm-6">
					<input class="form-control" id="seoKeywords" name="seoKeywords" type="text" value="${category.seoKeywords}" /> <span
						class="help-inline"><form:errors path="seoKeywords" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="seoTitle">seoTitle</label>
				<div class="col-sm-6">
					<input class="form-control" id="seoTitle" name="seoTitle" type="text" value="${category.seoTitle}" /> <span
						class="help-inline"><form:errors path="seoTitle" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="treePath">treePath</label>
				<div class="col-sm-6">
					<input class="form-control" id="treePath" name="treePath" type="text" value="${category.treePath}"
						data-rule-required="true" data-msg-required="请输入treePath" /> <span class="help-inline"><form:errors
							path="treePath" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="treeName">treeName</label>
				<div class="col-sm-6">
					<input class="form-control" id="treeName" name="treeName" type="text" value="${category.treeName}"
						data-rule-required="true" data-msg-required="请输入treeName" /> <span class="help-inline"><form:errors
							path="treeName" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="parent">parent</label>
				<div class="col-sm-6">
					<input class="form-control" id="parent" name="parent" type="text" value="${category.parent}" /> <span
						class="help-inline"><form:errors path="parent" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="isLeaf">isLeaf</label>
				<div class="col-sm-6">
					<input class="form-control" id="isLeaf" name="isLeaf" type="text" value="${category.isLeaf}" /> <span
						class="help-inline"><form:errors path="isLeaf" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="level">层级</label>
				<div class="col-sm-6">
					<input class="form-control" id="level" name="level" type="text" value="${category.level}" /> <span
						class="help-inline"><form:errors path="level" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="icon">图标</label>
				<div class="col-sm-6">
					<input class="form-control" id="icon" name="icon" type="text" value="${category.icon}" /> <span
						class="help-inline"><form:errors path="icon" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="top">是否置顶至首页</label>
				<div class="col-sm-6">
					<input class="form-control" id="top" name="top" type="text" value="${category.top}" /> <span class="help-inline"><form:errors
							path="top" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="logo">类目logo</label>
				<div class="col-sm-6">
					<input class="form-control" id="logo" name="logo" type="text" value="${category.logo}" /> <span
						class="help-inline"><form:errors path="logo" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="active">active</label>
				<div class="col-sm-6">
					<input type="radio" name="active" class="minimal icheck" <c:if test="${category.active}">checked</c:if> value="1">
					<span class="label label-success">Active</span> &nbsp;&nbsp; <input type="radio" name="active"
						class="minimal icheck" <c:if test="${!category.active}">checked</c:if> value="0"> <span
						class="label label-danger">Banned</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="created">created</label>
				<div class="col-sm-6">
					<input class="form-control" id="created" name="created" type="text"
						value="<fmt:formatDate value='${category.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="modified">modified</label>
				<div class="col-sm-6">
					<input class="form-control" id="modified" name="modified" type="text"
						value="<fmt:formatDate value='${category.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
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