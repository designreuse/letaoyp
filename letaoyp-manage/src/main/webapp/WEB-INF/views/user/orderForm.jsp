<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<form id="form" class="form-horizontal" form-validate action="${ctx}/user/order/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">
${order.id == null ? '新增' : '编辑'}		</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
      <input type="hidden" id="id" name="id" value="${order.id}"/>

	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="address">address</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="address" name="address" type="text" value="${order.address}" data-rule-required="true" data-msg-required="请输入address" />
	        <span class="help-inline"><form:errors path="address"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="area">area</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="area" name="area" type="text" value="${order.area}"  />
	        <span class="help-inline"><form:errors path="area"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="consignee">收货人</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="consignee" name="consignee" type="text" value="${order.consignee}" data-rule-required="true" data-msg-required="请输入收货人" />
	        <span class="help-inline"><form:errors path="consignee"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="expire">expire</label>
	      <div class="col-sm-6">
		      	<input class="form-control" id="expire" name="expire"
		          type="text" value="<fmt:formatDate value='${order.expire}' pattern='yyyy-MM-dd HH:mm:ss'/>" >
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="amount">货品金额</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="amount" name="amount" type="text" value="${order.amount}" data-rule-required="true" data-msg-required="请输入货品金额" />
	        <span class="help-inline"><form:errors path="amount"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="freight">运费</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="freight" name="freight" type="text" value="${order.freight}" data-rule-required="true" data-msg-required="请输入运费" />
	        <span class="help-inline"><form:errors path="freight"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="tax">税金</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="tax" name="tax" type="text" value="${order.tax}" data-rule-required="true" data-msg-required="请输入税金" />
	        <span class="help-inline"><form:errors path="tax"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="offsetAmount">调整金额</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="offsetAmount" name="offsetAmount" type="text" value="${order.offsetAmount}" data-rule-required="true" data-msg-required="请输入调整金额" />
	        <span class="help-inline"><form:errors path="offsetAmount"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="fee">支付金额</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="fee" name="fee" type="text" value="${order.fee}" data-rule-required="true" data-msg-required="请输入支付金额" />
	        <span class="help-inline"><form:errors path="fee"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="isInvoice">是否开具发票</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="isInvoice" name="isInvoice" type="text" value="${order.isInvoice}" data-rule-required="true" data-msg-required="请输入是否开具发票" />
	        <span class="help-inline"><form:errors path="isInvoice"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="invoiceTitle">发票抬头</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="invoiceTitle" name="invoiceTitle" type="text" value="${order.invoiceTitle}"  />
	        <span class="help-inline"><form:errors path="invoiceTitle"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="isAllocatedStock">是否已分配库存</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="isAllocatedStock" name="isAllocatedStock" type="text" value="${order.isAllocatedStock}" data-rule-required="true" data-msg-required="请输入是否已分配库存" />
	        <span class="help-inline"><form:errors path="isAllocatedStock"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="memo">附言</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="memo" name="memo" type="text" value="${order.memo}"  />
	        <span class="help-inline"><form:errors path="memo"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="status">订单状态</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="status" name="status" type="text" value="${order.status}"  />
	        <span class="help-inline"><form:errors path="status"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="channel">支付渠道</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="channel" name="channel" type="text" value="${order.channel}"  />
	        <span class="help-inline"><form:errors path="channel"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="mobile">mobile</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="mobile" name="mobile" type="text" value="${order.mobile}" data-rule-required="true" data-msg-required="请输入mobile" />
	        <span class="help-inline"><form:errors path="mobile"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="tradeNo">交易编号</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="tradeNo" name="tradeNo" type="text" value="${order.tradeNo}" data-rule-required="true" data-msg-required="请输入交易编号" />
	        <span class="help-inline"><form:errors path="tradeNo"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="outTradeNo">外部（支付系统）交易标号</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="outTradeNo" name="outTradeNo" type="text" value="${order.outTradeNo}"  />
	        <span class="help-inline"><form:errors path="outTradeNo"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="couponCode">couponCode</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="couponCode" name="couponCode" type="text" value="${order.couponCode}"  />
	        <span class="help-inline"><form:errors path="couponCode"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="member">member</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="member" name="member" type="text" value="${order.member}" data-rule-required="true" data-msg-required="请输入member" />
	        <span class="help-inline"><form:errors path="member"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="operator">operator</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="operator" name="operator" type="text" value="${order.operator}"  />
	        <span class="help-inline"><form:errors path="operator"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="active">active</label>
	      <div class="col-sm-6">
	      	<input type="radio" name="active" class="minimal icheck" <c:if test="${order.active}">checked</c:if> value="1">
					<span class="label label-success">Active</span> &nbsp;&nbsp; 
					<input type="radio" name="active" class="minimal icheck" <c:if test="${!order.active}">checked</c:if> value="0"> 
					<span class="label label-danger">Banned</span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="created">created</label>
	      <div class="col-sm-6">
	      		<input class="form-control" id="created" name="created"
		          type="text" value="<fmt:formatDate value='${order.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="modified">modified</label>
	      <div class="col-sm-6">
	      		<input class="form-control" id="modified" name="modified"
		          type="text" value="<fmt:formatDate value='${order.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
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