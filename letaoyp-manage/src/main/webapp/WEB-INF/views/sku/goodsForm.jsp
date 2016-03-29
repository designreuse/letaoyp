<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<form id="form" class="form-horizontal" form-validate action="${ctx}/sku/goods/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">${goods.id == null ? '新增' : '编辑'}</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
			<input type="hidden" id="id" name="id" value="${goods.id}" />

			<div class="form-group">
				<label class="col-sm-4 control-label" for="status">上架 下架</label>
				<div class="col-sm-6">
					<input class="form-control" id="status" name="status" type="text" value="${goods.status}" data-rule-required="true"
						data-msg-required="请输入上架 下架" /> <span class="help-inline"><form:errors path="status" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="shippingDate">上架时间</label>
				<div class="col-sm-6">
					<input class="form-control" id="shippingDate" name="shippingDate" type="text"
						value="<fmt:formatDate value='${goods.shippingDate}' pattern='yyyy-MM-dd HH:mm:ss'/>" data-rule-required="true"
						data-msg-required="请输入上架时间">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="name">name</label>
				<div class="col-sm-6">
					<input class="form-control" id="name" name="name" type="text" value="${goods.name}" data-rule-required="true"
						data-msg-required="请输入name" /> <span class="help-inline"><form:errors path="name" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="baseHits">baseHits</label>
				<div class="col-sm-6">
					<input class="form-control" id="baseHits" name="baseHits" type="text" value="${goods.baseHits}"
						data-rule-required="true" data-msg-required="请输入baseHits" /> <span class="help-inline"><form:errors
							path="baseHits" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="hits">点击数</label>
				<div class="col-sm-6">
					<input class="form-control" id="hits" name="hits" type="text" value="${goods.hits}" data-rule-required="true"
						data-msg-required="请输入点击数" /> <span class="help-inline"><form:errors path="hits" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="image">商品图标 取上传图片的第一张</label>
				<div class="col-sm-6">
					<input class="form-control" id="image" name="image" type="text" value="${goods.image}" data-rule-required="true"
						data-msg-required="请输入商品图标 取上传图片的第一张" /> <span class="help-inline"><form:errors path="image" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="salesPrice">销售价</label>
				<div class="col-sm-6">
					<input class="form-control" id="salesPrice" name="salesPrice" type="text" value="${goods.salesPrice}"
						data-rule-required="true" data-msg-required="请输入销售价" /> <span class="help-inline"><form:errors
							path="salesPrice" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="marketPrice">市场价</label>
				<div class="col-sm-6">
					<input class="form-control" id="marketPrice" name="marketPrice" type="text" value="${goods.marketPrice}"
						data-rule-required="true" data-msg-required="请输入市场价" /> <span class="help-inline"><form:errors
							path="marketPrice" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="cost">成本价</label>
				<div class="col-sm-6">
					<input class="form-control" id="cost" name="cost" type="text" value="${goods.cost}" data-rule-required="true"
						data-msg-required="请输入成本价" /> <span class="help-inline"><form:errors path="cost" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="brand">品牌</label>
				<div class="col-sm-6">
					<input class="form-control" id="brand" name="brand" type="text" value="${goods.brand}" /> <span
						class="help-inline"><form:errors path="brand" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="star">星级</label>
				<div class="col-sm-6">
					<input class="form-control" id="star" name="star" type="text" value="${goods.star}" data-rule-required="true"
						data-msg-required="请输入星级" /> <span class="help-inline"><form:errors path="star" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="weight">重量</label>
				<div class="col-sm-6">
					<input class="form-control" id="weight" name="weight" type="text" value="${goods.weight}" /> <span
						class="help-inline"><form:errors path="weight" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="unit">unit描述</label>
				<div class="col-sm-6">
					<input class="form-control" id="unit" name="unit" type="text" value="${goods.unit}" /> <span class="help-inline"><form:errors
							path="unit" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="description">description</label>
				<div class="col-sm-6">
					<input class="form-control" id="description" name="description" type="text" value="${goods.description}" /> <span
						class="help-inline"><form:errors path="description" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="property">键值对属性</label>
				<div class="col-sm-6">
					<input class="form-control" id="property" name="property" type="text" value="${goods.property}" /> <span
						class="help-inline"><form:errors path="property" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="category">category</label>
				<div class="col-sm-6">
					<input class="form-control" id="category" name="category" type="text" value="${goods.category}"
						data-rule-required="true" data-msg-required="请输入category" /> <span class="help-inline"><form:errors
							path="category" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="comments">评论数</label>
				<div class="col-sm-6">
					<input class="form-control" id="comments" name="comments" type="text" value="${goods.comments}"
						data-rule-required="true" data-msg-required="请输入评论数" /> <span class="help-inline"><form:errors
							path="comments" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="onlineTime">onlineTime</label>
				<div class="col-sm-6">
					<input class="form-control" id="onlineTime" name="onlineTime" type="text"
						value="<fmt:formatDate value='${goods.onlineTime}' pattern='yyyy-MM-dd HH:mm:ss'/>">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="active">active</label>
				<div class="col-sm-6">
					<input type="radio" name="active" class="minimal icheck" <c:if test="${goods.active}">checked</c:if> value="1">
					<span class="label label-success">Active</span> &nbsp;&nbsp; <input type="radio" name="active"
						class="minimal icheck" <c:if test="${!goods.active}">checked</c:if> value="0"> <span
						class="label label-danger">Banned</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="created">created</label>
				<div class="col-sm-6">
					<input class="form-control" id="created" name="created" type="text"
						value="<fmt:formatDate value='${goods.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="modified">modified</label>
				<div class="col-sm-6">
					<input class="form-control" id="modified" name="modified" type="text"
						value="<fmt:formatDate value='${goods.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
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