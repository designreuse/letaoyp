<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ sku / 商品图库</span>
		</li>
	</ul>
</div>

<div class="row-fluid">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-edit"></i> Form Elements</h2>
		</div>
		<div class="box-content">
			<form action="${ctx}/sku/goodsimage/update" modelAttribute="goodsImage" method="post" class="form-horizontal">
				<fieldset>					
					<input type="hidden" id="id" name="id" value="${goodsImage.id}"/>

					<div class="control-group">
						<label class="control-label" for="created">created</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="created" name="created" readonly="readonly"
								type="text" value="<fmt:formatDate value='${goodsImage.created}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="modified">modified</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="modified" name="modified" readonly="readonly"
								type="text" value="<fmt:formatDate value='${goodsImage.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="active">active</label>
						<div class="controls">
							<input class="input-large" id="active" name="active" type="text" value="${goodsImage.active}">
							<span class="help-inline"><form:errors path="active"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="order">降序排列</label>
						<div class="controls">
							<input class="input-large" id="order" name="order" type="text" value="${goodsImage.order}">
							<span class="help-inline"><form:errors path="order"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="src">src</label>
						<div class="controls">
							<input class="input-large required" id="src" name="src" type="text" value="${goodsImage.src}">
							<span class="help-inline"><form:errors path="src"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="goods">goods</label>
						<div class="controls">
							<input class="input-large required" id="goods" name="goods" type="text" value="${goodsImage.goods}">
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
