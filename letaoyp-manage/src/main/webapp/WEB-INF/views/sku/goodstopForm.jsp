<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<form id="form" class="form-horizontal" form-validate action="${ctx}/sku/goodstop/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">${goodsTop.id == null ? '新增' : '编辑'}</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
			<input type="hidden" id="id" name="id" value="${goodsTop.id}" />

			<div class="form-group">
				<label class="col-sm-4 control-label" for="goods">goods</label>
				<div class="col-sm-6">
					<input class="form-control" id="goods" name="goods" type="text" value="${goodsTop.goods}" data-rule-required="true"
						data-msg-required="请输入goods" /> <span class="help-inline"><form:errors path="goods" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="category">goods一级类目</label>
				<div class="col-sm-6">
					<input class="form-control" id="category" name="category" type="text" value="${goodsTop.category}"
						data-rule-required="true" data-msg-required="请输入goods一级类目" /> <span class="help-inline"><form:errors
							path="category" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="goodsName">goodsName</label>
				<div class="col-sm-6">
					<input class="form-control" id="goodsName" name="goodsName" type="text" value="${goodsTop.goodsName}"
						data-rule-required="true" data-msg-required="请输入goodsName" /> <span class="help-inline"><form:errors
							path="goodsName" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="salesPrice">销售价</label>
				<div class="col-sm-6">
					<input class="form-control" id="salesPrice" name="salesPrice" type="text" value="${goodsTop.salesPrice}" /> <span
						class="help-inline"><form:errors path="salesPrice" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="marketPrice">市场价</label>
				<div class="col-sm-6">
					<input class="form-control" id="marketPrice" name="marketPrice" type="text" value="${goodsTop.marketPrice}" /> <span
						class="help-inline"><form:errors path="marketPrice" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="comments">评论数</label>
				<div class="col-sm-6">
					<input class="form-control" id="comments" name="comments" type="text" value="${goodsTop.comments}"
						data-rule-required="true" data-msg-required="请输入评论数" /> <span class="help-inline"><form:errors
							path="comments" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="topImage">topImage</label>
				<div class="col-sm-6">
					<input class="form-control" id="topImage" name="topImage" type="text" value="${goodsTop.topImage}"
						data-rule-required="true" data-msg-required="请输入topImage" /> <span class="help-inline"><form:errors
							path="topImage" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="position">置顶位置 HOME_SLIDE首页滑动大图(785*368);
					HOME_VERTICAL首页垂直中图(242*184);HOME_HORIZONTAL首页水平平铺商品图(310*310)</label>
				<div class="col-sm-6">
					<input class="form-control" id="position" name="position" type="text" value="${goodsTop.position}"
						data-rule-required="true"
						data-msg-required="请输入置顶位置 HOME_SLIDE首页滑动大图(785*368); HOME_VERTICAL首页垂直中图(242*184);HOME_HORIZONTAL首页水平平铺商品图(310*310)" />
					<span class="help-inline"><form:errors path="position" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="active">active</label>
				<div class="col-sm-6">
					<input type="radio" name="active" class="minimal icheck" <c:if test="${goodsTop.active}">checked</c:if> value="1">
					<span class="label label-success">Active</span> &nbsp;&nbsp; <input type="radio" name="active"
						class="minimal icheck" <c:if test="${!goodsTop.active}">checked</c:if> value="0"> <span
						class="label label-danger">Banned</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="created">created</label>
				<div class="col-sm-6">
					<input class="form-control" id="created" name="created" type="text"
						value="<fmt:formatDate value='${goodsTop.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="modified">modified</label>
				<div class="col-sm-6">
					<input class="form-control" id="modified" name="modified" type="text"
						value="<fmt:formatDate value='${goodsTop.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
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