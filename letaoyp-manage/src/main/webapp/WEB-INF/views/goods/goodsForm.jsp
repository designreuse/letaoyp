<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ goods / 商品</span>
		</li>
	</ul>
</div>

<div class="row-fluid">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-edit"></i> Form Elements</h2>
		</div>
		<div class="box-content">
			<form action="${ctx}/goods/goods/update" modelAttribute="goods" method="post" class="form-horizontal">
				<fieldset>					
					<input type="hidden" id="id" name="id" value="${goods.id}"/>

					<div class="control-group">
						<label class="control-label" for="created">created</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="created" name="created" readonly="readonly"
								type="text" value="<fmt:formatDate value='${goods.created}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="modified">modified</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="modified" name="modified" readonly="readonly"
								type="text" value="<fmt:formatDate value='${goods.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="active">active</label>
						<div class="controls">
							<input class="input-large" id="active" name="active" type="text" value="${goods.active}">
							<span class="help-inline"><form:errors path="active"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="status">未上架 已上架 已下架</label>
						<div class="controls">
							<input class="input-large" id="status" name="status" type="text" value="${goods.status}">
							<span class="help-inline"><form:errors path="status"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="shippingDate">上架时间</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="shippingDate" name="shippingDate" readonly="readonly"
								type="text" value="<fmt:formatDate value='${goods.shippingDate}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="name">name</label>
						<div class="controls">
							<input class="input-large required" id="name" name="name" type="text" value="${goods.name}">
							<span class="help-inline"><form:errors path="name"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="baseHits">baseHits</label>
						<div class="controls">
							<input class="input-large required" id="baseHits" name="baseHits" type="text" value="${goods.baseHits}">
							<span class="help-inline"><form:errors path="baseHits"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="hits">点击数</label>
						<div class="controls">
							<input class="input-large required" id="hits" name="hits" type="text" value="${goods.hits}">
							<span class="help-inline"><form:errors path="hits"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="image">商品图标 取上传图片的第一张</label>
						<div class="controls">
							<input class="input-large" id="image" name="image" type="text" value="${goods.image}">
							<span class="help-inline"><form:errors path="image"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="salesPrice">销售价</label>
						<div class="controls">
							<input class="input-large" id="salesPrice" name="salesPrice" type="text" value="${goods.salesPrice}">
							<span class="help-inline"><form:errors path="salesPrice"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="marketPrice">市场价</label>
						<div class="controls">
							<input class="input-large" id="marketPrice" name="marketPrice" type="text" value="${goods.marketPrice}">
							<span class="help-inline"><form:errors path="marketPrice"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="cost">成本价</label>
						<div class="controls">
							<input class="input-large" id="cost" name="cost" type="text" value="${goods.cost}">
							<span class="help-inline"><form:errors path="cost"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="brand">品牌</label>
						<div class="controls">
							<input class="input-large" id="brand" name="brand" type="text" value="${goods.brand}">
							<span class="help-inline"><form:errors path="brand"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="star">星级</label>
						<div class="controls">
							<input class="input-large" id="star" name="star" type="text" value="${goods.star}">
							<span class="help-inline"><form:errors path="star"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="weight">重量</label>
						<div class="controls">
							<input class="input-large" id="weight" name="weight" type="text" value="${goods.weight}">
							<span class="help-inline"><form:errors path="weight"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="unit">unit描述</label>
						<div class="controls">
							<input class="input-large" id="unit" name="unit" type="text" value="${goods.unit}">
							<span class="help-inline"><form:errors path="unit"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="description">description</label>
						<div class="controls">
							<input class="input-large" id="description" name="description" type="text" value="${goods.description}">
							<span class="help-inline"><form:errors path="description"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="property">键值对属性</label>
						<div class="controls">
							<input class="input-large" id="property" name="property" type="text" value="${goods.property}">
							<span class="help-inline"><form:errors path="property"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="category">category</label>
						<div class="controls">
							<input class="input-large required" id="category" name="category" type="text" value="${goods.category}">
							<span class="help-inline"><form:errors path="category"/></span>
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
