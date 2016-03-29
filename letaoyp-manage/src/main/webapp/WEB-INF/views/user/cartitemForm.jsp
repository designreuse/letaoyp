<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<form id="form" class="form-horizontal" form-validate action="${ctx}/user/cartitem/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">
${cartItem.id == null ? '新增' : '编辑'}		</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
      <input type="hidden" id="id" name="id" value="${cartItem.id}"/>

	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="quantity">数量</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="quantity" name="quantity" type="text" value="${cartItem.quantity}" data-rule-required="true" data-msg-required="请输入数量" />
	        <span class="help-inline"><form:errors path="quantity"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="cart">cart</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="cart" name="cart" type="text" value="${cartItem.cart}" data-rule-required="true" data-msg-required="请输入cart" />
	        <span class="help-inline"><form:errors path="cart"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="goods">goods</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="goods" name="goods" type="text" value="${cartItem.goods}" data-rule-required="true" data-msg-required="请输入goods" />
	        <span class="help-inline"><form:errors path="goods"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="choosen">选择条件ID集合</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="choosen" name="choosen" type="text" value="${cartItem.choosen}"  />
	        <span class="help-inline"><form:errors path="choosen"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="choosenDescription">选择条件描述 name:value json串</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="choosenDescription" name="choosenDescription" type="text" value="${cartItem.choosenDescription}"  />
	        <span class="help-inline"><form:errors path="choosenDescription"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="price">goods.salesPrice + choosen.cost</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="price" name="price" type="text" value="${cartItem.price}" data-rule-required="true" data-msg-required="请输入goods.salesPrice + choosen.cost" />
	        <span class="help-inline"><form:errors path="price"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="active">是否有效，可恢复购物车物件</label>
	      <div class="col-sm-6">
	      	<input type="radio" name="active" class="minimal icheck" <c:if test="${cartItem.active}">checked</c:if> value="1">
					<span class="label label-success">Active</span> &nbsp;&nbsp; 
					<input type="radio" name="active" class="minimal icheck" <c:if test="${!cartItem.active}">checked</c:if> value="0"> 
					<span class="label label-danger">Banned</span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="created">created</label>
	      <div class="col-sm-6">
	      		<input class="form-control" id="created" name="created"
		          type="text" value="<fmt:formatDate value='${cartItem.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="modified">modified</label>
	      <div class="col-sm-6">
	      		<input class="form-control" id="modified" name="modified"
		          type="text" value="<fmt:formatDate value='${cartItem.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
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