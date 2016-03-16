<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ user / 订单物品</span>
		</li>
	</ul>
</div>

<div class="row-fluid">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-edit"></i> Form Elements</h2>
		</div>
		<div class="box-content">
			<form action="${ctx}/user/orderitem/update" modelAttribute="orderItem" method="post" class="form-horizontal">
				<fieldset>					
					<input type="hidden" id="id" name="id" value="${orderItem.id}"/>

					<div class="control-group">
						<label class="control-label" for="created">created</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="created" name="created" readonly="readonly"
								type="text" value="<fmt:formatDate value='${orderItem.created}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="modified">modified</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="modified" name="modified" readonly="readonly"
								type="text" value="<fmt:formatDate value='${orderItem.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="active">active</label>
						<div class="controls">
							<input class="input-large required" id="active" name="active" type="text" value="${orderItem.active}">
							<span class="help-inline"><form:errors path="active"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="isGift">isGift</label>
						<div class="controls">
							<input class="input-large required" id="isGift" name="isGift" type="text" value="${orderItem.isGift}">
							<span class="help-inline"><form:errors path="isGift"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="name">商品名称</label>
						<div class="controls">
							<input class="input-large required" id="name" name="name" type="text" value="${orderItem.name}">
							<span class="help-inline"><form:errors path="name"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="price">价格</label>
						<div class="controls">
							<input class="input-large required" id="price" name="price" type="text" value="${orderItem.price}">
							<span class="help-inline"><form:errors path="price"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="quantity">数量</label>
						<div class="controls">
							<input class="input-large required" id="quantity" name="quantity" type="text" value="${orderItem.quantity}">
							<span class="help-inline"><form:errors path="quantity"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="returnQuantity">returnQuantity</label>
						<div class="controls">
							<input class="input-large required" id="returnQuantity" name="returnQuantity" type="text" value="${orderItem.returnQuantity}">
							<span class="help-inline"><form:errors path="returnQuantity"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="shippedQuantity">shippedQuantity</label>
						<div class="controls">
							<input class="input-large required" id="shippedQuantity" name="shippedQuantity" type="text" value="${orderItem.shippedQuantity}">
							<span class="help-inline"><form:errors path="shippedQuantity"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="sn">商品编号</label>
						<div class="controls">
							<input class="input-large required" id="sn" name="sn" type="text" value="${orderItem.sn}">
							<span class="help-inline"><form:errors path="sn"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="thumbnail">商品缩略图</label>
						<div class="controls">
							<input class="input-large" id="thumbnail" name="thumbnail" type="text" value="${orderItem.thumbnail}">
							<span class="help-inline"><form:errors path="thumbnail"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="weight">重量</label>
						<div class="controls">
							<input class="input-large" id="weight" name="weight" type="text" value="${orderItem.weight}">
							<span class="help-inline"><form:errors path="weight"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="order">订单</label>
						<div class="controls">
							<input class="input-large required" id="order" name="order" type="text" value="${orderItem.order}">
							<span class="help-inline"><form:errors path="order"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="goods">商品</label>
						<div class="controls">
							<input class="input-large" id="goods" name="goods" type="text" value="${orderItem.goods}">
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
