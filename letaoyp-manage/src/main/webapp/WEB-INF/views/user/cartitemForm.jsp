<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ user / 购物车item</span>
		</li>
	</ul>
</div>

<div class="row-fluid">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-edit"></i> Form Elements</h2>
		</div>
		<div class="box-content">
			<form action="${ctx}/user/cartitem/update" modelAttribute="cartItem" method="post" class="form-horizontal">
				<fieldset>					
					<input type="hidden" id="id" name="id" value="${cartItem.id}"/>

					<div class="control-group">
						<label class="control-label" for="created">created</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="created" name="created" readonly="readonly"
								type="text" value="<fmt:formatDate value='${cartItem.created}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="modified">modified</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="modified" name="modified" readonly="readonly"
								type="text" value="<fmt:formatDate value='${cartItem.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="active">是否有效，可恢复购物车物件</label>
						<div class="controls">
							<input class="input-large" id="active" name="active" type="text" value="${cartItem.active}">
							<span class="help-inline"><form:errors path="active"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="quantity">数量</label>
						<div class="controls">
							<input class="input-large required" id="quantity" name="quantity" type="text" value="${cartItem.quantity}">
							<span class="help-inline"><form:errors path="quantity"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="cart">cart</label>
						<div class="controls">
							<input class="input-large required" id="cart" name="cart" type="text" value="${cartItem.cart}">
							<span class="help-inline"><form:errors path="cart"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="goods">goods</label>
						<div class="controls">
							<input class="input-large required" id="goods" name="goods" type="text" value="${cartItem.goods}">
							<span class="help-inline"><form:errors path="goods"/></span>
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
