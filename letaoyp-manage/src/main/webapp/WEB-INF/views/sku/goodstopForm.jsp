<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ sku / GoodsTop</span>
		</li>
	</ul>
</div>

<div class="row-fluid">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-edit"></i> Form Elements</h2>
		</div>
		<div class="box-content">
			<form action="${ctx}/sku/goodstop/update" modelAttribute="goodsTop" method="post" class="form-horizontal">
				<fieldset>					
					<input type="hidden" id="id" name="id" value="${goodsTop.id}"/>

					<div class="control-group">
						<label class="control-label" for="created">created</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="created" name="created" readonly="readonly"
								type="text" value="<fmt:formatDate value='${goodsTop.created}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="modified">modified</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="modified" name="modified" readonly="readonly"
								type="text" value="<fmt:formatDate value='${goodsTop.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="active">active</label>
						<div class="controls">
							<input class="input-large" id="active" name="active" type="text" value="${goodsTop.active}">
							<span class="help-inline"><form:errors path="active"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="goods">goods</label>
						<div class="controls">
							<input class="input-large" id="goods" name="goods" type="text" value="${goodsTop.goods}">
							<span class="help-inline"><form:errors path="goods"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="goodsName">goodsName</label>
						<div class="controls">
							<input class="input-large" id="goodsName" name="goodsName" type="text" value="${goodsTop.goodsName}">
							<span class="help-inline"><form:errors path="goodsName"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="salesPrice">销售价</label>
						<div class="controls">
							<input class="input-large" id="salesPrice" name="salesPrice" type="text" value="${goodsTop.salesPrice}">
							<span class="help-inline"><form:errors path="salesPrice"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="marketPrice">市场价</label>
						<div class="controls">
							<input class="input-large" id="marketPrice" name="marketPrice" type="text" value="${goodsTop.marketPrice}">
							<span class="help-inline"><form:errors path="marketPrice"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="comments">评论数</label>
						<div class="controls">
							<input class="input-large" id="comments" name="comments" type="text" value="${goodsTop.comments}">
							<span class="help-inline"><form:errors path="comments"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="topImage">topImage</label>
						<div class="controls">
							<input class="input-large required" id="topImage" name="topImage" type="text" value="${goodsTop.topImage}">
							<span class="help-inline"><form:errors path="topImage"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="position">置顶位置 HOME_1 首页置顶位置1(785*368); HOME_2 首页置顶位置2(242*184)</label>
						<div class="controls">
							<input class="input-large" id="position" name="position" type="text" value="${goodsTop.position}">
							<span class="help-inline"><form:errors path="position"/></span>
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
