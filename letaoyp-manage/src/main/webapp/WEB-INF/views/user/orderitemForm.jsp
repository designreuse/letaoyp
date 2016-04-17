<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<form id="form" class="form-horizontal" form-validate action="${ctx}/user/orderitem/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">
${orderItem.id == null ? '新增' : '编辑'}		</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
      <input type="hidden" id="id" name="id" value="${orderItem.id}"/>

	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="name">商品名称</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="name" name="name" type="text" value="${orderItem.name}" data-rule-required="true" data-msg-required="请输入商品名称" />
	        <span class="help-inline"><form:errors path="name"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="price">价格</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="price" name="price" type="text" value="${orderItem.price}" data-rule-required="true" data-msg-required="请输入价格" />
	        <span class="help-inline"><form:errors path="price"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="quantity">数量</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="quantity" name="quantity" type="text" value="${orderItem.quantity}" data-rule-required="true" data-msg-required="请输入数量" />
	        <span class="help-inline"><form:errors path="quantity"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="thumbnail">商品缩略图</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="thumbnail" name="thumbnail" type="text" value="${orderItem.thumbnail}"  />
	        <span class="help-inline"><form:errors path="thumbnail"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="weight">重量</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="weight" name="weight" type="text" value="${orderItem.weight}"  />
	        <span class="help-inline"><form:errors path="weight"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="order">订单</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="order" name="order" type="text" value="${orderItem.order}" data-rule-required="true" data-msg-required="请输入订单" />
	        <span class="help-inline"><form:errors path="order"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="goods">商品</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="goods" name="goods" type="text" value="${orderItem.goods}" data-rule-required="true" data-msg-required="请输入商品" />
	        <span class="help-inline"><form:errors path="goods"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="active">active</label>
	      <div class="col-sm-6">
	      	<input type="radio" name="active" class="minimal icheck" <c:if test="${orderItem.active}">checked</c:if> value="1">
					<span class="label label-success">Active</span> &nbsp;&nbsp; 
					<input type="radio" name="active" class="minimal icheck" <c:if test="${!orderItem.active}">checked</c:if> value="0"> 
					<span class="label label-danger">Banned</span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="created">created</label>
	      <div class="col-sm-6">
	      		<input class="form-control" id="created" name="created"
		          type="text" value="<fmt:formatDate value='${orderItem.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="modified">modified</label>
	      <div class="col-sm-6">
	      		<input class="form-control" id="modified" name="modified"
		          type="text" value="<fmt:formatDate value='${orderItem.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
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