<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<form id="form" class="form-horizontal" form-validate action="${ctx}/user/cart/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">
${cart.id == null ? '新增' : '编辑'}		</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
      <input type="hidden" id="id" name="id" value="${cart.id}"/>

	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="cartKey">购物车唯一编码 未注册用户也可体验购物车功能</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="cartKey" name="cartKey" type="text" value="${cart.cartKey}"  />
	        <span class="help-inline"><form:errors path="cartKey"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="member">member</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="member" name="member" type="text" value="${cart.member}"  />
	        <span class="help-inline"><form:errors path="member"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="active">active</label>
	      <div class="col-sm-6">
	      	<input type="radio" name="active" class="minimal icheck" <c:if test="${cart.active}">checked</c:if> value="1">
					<span class="label label-success">Active</span> &nbsp;&nbsp; 
					<input type="radio" name="active" class="minimal icheck" <c:if test="${!cart.active}">checked</c:if> value="0"> 
					<span class="label label-danger">Banned</span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="created">created</label>
	      <div class="col-sm-6">
	      		<input class="form-control" id="created" name="created"
		          type="text" value="<fmt:formatDate value='${cart.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="modified">modified</label>
	      <div class="col-sm-6">
	      		<input class="form-control" id="modified" name="modified"
		          type="text" value="<fmt:formatDate value='${cart.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
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