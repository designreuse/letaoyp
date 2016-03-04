<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ user / 收货地址</span>
		</li>
	</ul>
</div>

<div class="row-fluid">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-edit"></i> Form Elements</h2>
		</div>
		<div class="box-content">
			<form action="${ctx}/user/shippingaddress/update" modelAttribute="shippingAddress" method="post" class="form-horizontal">
				<fieldset>					
					<input type="hidden" id="id" name="id" value="${shippingAddress.id}"/>

					<div class="control-group">
						<label class="control-label" for="created">created</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="created" name="created" readonly="readonly"
								type="text" value="<fmt:formatDate value='${shippingAddress.created}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="modified">modified</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="modified" name="modified" readonly="readonly"
								type="text" value="<fmt:formatDate value='${shippingAddress.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="active">active</label>
						<div class="controls">
							<input class="input-large" id="active" name="active" type="text" value="${shippingAddress.active}">
							<span class="help-inline"><form:errors path="active"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="member">member</label>
						<div class="controls">
							<input class="input-large" id="member" name="member" type="text" value="${shippingAddress.member}">
							<span class="help-inline"><form:errors path="member"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="area">area</label>
						<div class="controls">
							<input class="input-large" id="area" name="area" type="text" value="${shippingAddress.area}">
							<span class="help-inline"><form:errors path="area"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="receiver">收货人</label>
						<div class="controls">
							<input class="input-large" id="receiver" name="receiver" type="text" value="${shippingAddress.receiver}">
							<span class="help-inline"><form:errors path="receiver"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="address">详细地址</label>
						<div class="controls">
							<input class="input-large" id="address" name="address" type="text" value="${shippingAddress.address}">
							<span class="help-inline"><form:errors path="address"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="mobile">电话</label>
						<div class="controls">
							<input class="input-large required" id="mobile" name="mobile" type="text" value="${shippingAddress.mobile}">
							<span class="help-inline"><form:errors path="mobile"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="phone">手机</label>
						<div class="controls">
							<input class="input-large" id="phone" name="phone" type="text" value="${shippingAddress.phone}">
							<span class="help-inline"><form:errors path="phone"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="bulidingFlag">标志建筑</label>
						<div class="controls">
							<input class="input-large" id="bulidingFlag" name="bulidingFlag" type="text" value="${shippingAddress.bulidingFlag}">
							<span class="help-inline"><form:errors path="bulidingFlag"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="email">email</label>
						<div class="controls">
							<input class="input-large" id="email" name="email" type="text" value="${shippingAddress.email}">
							<span class="help-inline"><form:errors path="email"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="zipCode">zipCode</label>
						<div class="controls">
							<input class="input-large" id="zipCode" name="zipCode" type="text" value="${shippingAddress.zipCode}">
							<span class="help-inline"><form:errors path="zipCode"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="receiveTime">预约送货时间</label>
						<div class="controls">
							<input class="input-large" id="receiveTime" name="receiveTime" type="text" value="${shippingAddress.receiveTime}">
							<span class="help-inline"><form:errors path="receiveTime"/></span>
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
