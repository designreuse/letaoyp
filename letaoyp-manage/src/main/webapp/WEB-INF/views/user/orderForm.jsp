<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ user / Order</span>
		</li>
	</ul>
</div>

<div class="row-fluid">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-edit"></i> Form Elements</h2>
		</div>
		<div class="box-content">
			<form action="${ctx}/user/order/update" modelAttribute="order" method="post" class="form-horizontal">
				<fieldset>					
					<input type="hidden" id="id" name="id" value="${order.id}"/>

					<div class="control-group">
						<label class="control-label" for="created">created</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="created" name="created" readonly="readonly"
								type="text" value="<fmt:formatDate value='${order.created}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="modified">modified</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="modified" name="modified" readonly="readonly"
								type="text" value="<fmt:formatDate value='${order.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="active">active</label>
						<div class="controls">
							<input class="input-large" id="active" name="active" type="text" value="${order.active}">
							<span class="help-inline"><form:errors path="active"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="address">address</label>
						<div class="controls">
							<input class="input-large required" id="address" name="address" type="text" value="${order.address}">
							<span class="help-inline"><form:errors path="address"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="area">area</label>
						<div class="controls">
							<input class="input-large" id="area" name="area" type="text" value="${order.area}">
							<span class="help-inline"><form:errors path="area"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="consignee">收货人</label>
						<div class="controls">
							<input class="input-large required" id="consignee" name="consignee" type="text" value="${order.consignee}">
							<span class="help-inline"><form:errors path="consignee"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="expire">expire</label>
						<div class="controls">
							<input class="input-large datepicker " id="expire" name="expire" readonly="readonly"
								type="text" value="<fmt:formatDate value='${order.expire}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="amount">货品金额</label>
						<div class="controls">
							<input class="input-large required" id="amount" name="amount" type="text" value="${order.amount}">
							<span class="help-inline"><form:errors path="amount"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="freight">运费</label>
						<div class="controls">
							<input class="input-large required" id="freight" name="freight" type="text" value="${order.freight}">
							<span class="help-inline"><form:errors path="freight"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="tax">税金</label>
						<div class="controls">
							<input class="input-large required" id="tax" name="tax" type="text" value="${order.tax}">
							<span class="help-inline"><form:errors path="tax"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="fee">支付金额</label>
						<div class="controls">
							<input class="input-large required" id="fee" name="fee" type="text" value="${order.fee}">
							<span class="help-inline"><form:errors path="fee"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="isInvoice">是否开具发票</label>
						<div class="controls">
							<input class="input-large required" id="isInvoice" name="isInvoice" type="text" value="${order.isInvoice}">
							<span class="help-inline"><form:errors path="isInvoice"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="invoiceTitle">发票抬头</label>
						<div class="controls">
							<input class="input-large" id="invoiceTitle" name="invoiceTitle" type="text" value="${order.invoiceTitle}">
							<span class="help-inline"><form:errors path="invoiceTitle"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="isAllocatedStock">是否已分配库存</label>
						<div class="controls">
							<input class="input-large required" id="isAllocatedStock" name="isAllocatedStock" type="text" value="${order.isAllocatedStock}">
							<span class="help-inline"><form:errors path="isAllocatedStock"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="memo">附言</label>
						<div class="controls">
							<input class="input-large" id="memo" name="memo" type="text" value="${order.memo}">
							<span class="help-inline"><form:errors path="memo"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="offsetAmount">调整金额</label>
						<div class="controls">
							<input class="input-large required" id="offsetAmount" name="offsetAmount" type="text" value="${order.offsetAmount}">
							<span class="help-inline"><form:errors path="offsetAmount"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="status">订单状态</label>
						<div class="controls">
							<input class="input-large" id="status" name="status" type="text" value="${order.status}">
							<span class="help-inline"><form:errors path="status"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="channel">支付渠道</label>
						<div class="controls">
							<input class="input-large" id="channel" name="channel" type="text" value="${order.channel}">
							<span class="help-inline"><form:errors path="channel"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="phone">phone</label>
						<div class="controls">
							<input class="input-large required" id="phone" name="phone" type="text" value="${order.phone}">
							<span class="help-inline"><form:errors path="phone"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="point">point</label>
						<div class="controls">
							<input class="input-large required" id="point" name="point" type="text" value="${order.point}">
							<span class="help-inline"><form:errors path="point"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="tradeNo">交易编号</label>
						<div class="controls">
							<input class="input-large required" id="tradeNo" name="tradeNo" type="text" value="${order.tradeNo}">
							<span class="help-inline"><form:errors path="tradeNo"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="outTradeNo">外部（支付系统）交易标号</label>
						<div class="controls">
							<input class="input-large" id="outTradeNo" name="outTradeNo" type="text" value="${order.outTradeNo}">
							<span class="help-inline"><form:errors path="outTradeNo"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="zipCode">zipCode</label>
						<div class="controls">
							<input class="input-large required" id="zipCode" name="zipCode" type="text" value="${order.zipCode}">
							<span class="help-inline"><form:errors path="zipCode"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="couponCode">couponCode</label>
						<div class="controls">
							<input class="input-large" id="couponCode" name="couponCode" type="text" value="${order.couponCode}">
							<span class="help-inline"><form:errors path="couponCode"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="member">member</label>
						<div class="controls">
							<input class="input-large required" id="member" name="member" type="text" value="${order.member}">
							<span class="help-inline"><form:errors path="member"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="operator">operator</label>
						<div class="controls">
							<input class="input-large" id="operator" name="operator" type="text" value="${order.operator}">
							<span class="help-inline"><form:errors path="operator"/></span>
						</div>
					</div>
					<div class="form-actions">
						<span id="form_submit" class="btn btn-primary">Save changes</span>
						<input type="reset" class="btn" value="Reset" />
					</div>
				</fieldset>
			</form>   
		</div>
	</div><!--/span-->

</div><!--/row-->

<!-- public common.js -->
<script src="${ctx}/static/js/charisma.js"></script>
