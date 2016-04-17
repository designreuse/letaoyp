<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<form id="form" class="form-horizontal" form-validate action="${ctx}/user/shippingaddress/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">
${shippingAddress.id == null ? '新增' : '编辑'}		</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
      <input type="hidden" id="id" name="id" value="${shippingAddress.id}"/>

	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="member">member</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="member" name="member" type="text" value="${shippingAddress.member}"  />
	        <span class="help-inline"><form:errors path="member"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="area">area</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="area" name="area" type="text" value="${shippingAddress.area}"  />
	        <span class="help-inline"><form:errors path="area"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="receiver">收货人</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="receiver" name="receiver" type="text" value="${shippingAddress.receiver}"  />
	        <span class="help-inline"><form:errors path="receiver"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="address">详细地址</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="address" name="address" type="text" value="${shippingAddress.address}"  />
	        <span class="help-inline"><form:errors path="address"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="mobile">电话</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="mobile" name="mobile" type="text" value="${shippingAddress.mobile}" data-rule-required="true" data-msg-required="请输入电话" />
	        <span class="help-inline"><form:errors path="mobile"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="phone">手机</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="phone" name="phone" type="text" value="${shippingAddress.phone}"  />
	        <span class="help-inline"><form:errors path="phone"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="bulidingFlag">标志建筑</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="bulidingFlag" name="bulidingFlag" type="text" value="${shippingAddress.bulidingFlag}"  />
	        <span class="help-inline"><form:errors path="bulidingFlag"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="email">email</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="email" name="email" type="text" value="${shippingAddress.email}"  />
	        <span class="help-inline"><form:errors path="email"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="zipCode">zipCode</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="zipCode" name="zipCode" type="text" value="${shippingAddress.zipCode}"  />
	        <span class="help-inline"><form:errors path="zipCode"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="receiveTime">预约送货时间</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="receiveTime" name="receiveTime" type="text" value="${shippingAddress.receiveTime}"  />
	        <span class="help-inline"><form:errors path="receiveTime"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="active">active</label>
	      <div class="col-sm-6">
	      	<input type="radio" name="active" class="minimal icheck" <c:if test="${shippingAddress.active}">checked</c:if> value="1">
					<span class="label label-success">Active</span> &nbsp;&nbsp; 
					<input type="radio" name="active" class="minimal icheck" <c:if test="${!shippingAddress.active}">checked</c:if> value="0"> 
					<span class="label label-danger">Banned</span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="created">created</label>
	      <div class="col-sm-6">
	      		<input class="form-control" id="created" name="created"
		          type="text" value="<fmt:formatDate value='${shippingAddress.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="modified">modified</label>
	      <div class="col-sm-6">
	      		<input class="form-control" id="modified" name="modified"
		          type="text" value="<fmt:formatDate value='${shippingAddress.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
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