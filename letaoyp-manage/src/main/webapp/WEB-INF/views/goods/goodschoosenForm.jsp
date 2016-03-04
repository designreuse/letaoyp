<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ goods / 商品选择条件</span>
		</li>
	</ul>
</div>

<div class="row-fluid">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-edit"></i> Form Elements</h2>
		</div>
		<div class="box-content">
			<form action="${ctx}/goods/goodschoosen/update" modelAttribute="goodsChoosen" method="post" class="form-horizontal">
				<fieldset>					
					<input type="hidden" id="id" name="id" value="${goodsChoosen.id}"/>

					<div class="control-group">
						<label class="control-label" for="created">created</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="created" name="created" readonly="readonly"
								type="text" value="<fmt:formatDate value='${goodsChoosen.created}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="modified">modified</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="modified" name="modified" readonly="readonly"
								type="text" value="<fmt:formatDate value='${goodsChoosen.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="active">active</label>
						<div class="controls">
							<input class="input-large" id="active" name="active" type="text" value="${goodsChoosen.active}">
							<span class="help-inline"><form:errors path="active"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="goods">goods</label>
						<div class="controls">
							<input class="input-large" id="goods" name="goods" type="text" value="${goodsChoosen.goods}">
							<span class="help-inline"><form:errors path="goods"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="name">选择条件名称 eg: 尺码</label>
						<div class="controls">
							<input class="input-large" id="name" name="name" type="text" value="${goodsChoosen.name}">
							<span class="help-inline"><form:errors path="name"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="value">选择条件值 eg: S M L XL</label>
						<div class="controls">
							<input class="input-large" id="value" name="value" type="text" value="${goodsChoosen.value}">
							<span class="help-inline"><form:errors path="value"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="cost">选择该条件后 额外需要支付价格</label>
						<div class="controls">
							<input class="input-large" id="cost" name="cost" type="text" value="${goodsChoosen.cost}">
							<span class="help-inline"><form:errors path="cost"/></span>
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
