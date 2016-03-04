<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ goods / 品牌</span>
		</li>
	</ul>
</div>

<div class="row-fluid">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-edit"></i> Form Elements</h2>
		</div>
		<div class="box-content">
			<form action="${ctx}/goods/brand/update" modelAttribute="brand" method="post" class="form-horizontal">
				<fieldset>					
					<input type="hidden" id="id" name="id" value="${brand.id}"/>

					<div class="control-group">
						<label class="control-label" for="created">created</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="created" name="created" readonly="readonly"
								type="text" value="<fmt:formatDate value='${brand.created}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="modified">modified</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="modified" name="modified" readonly="readonly"
								type="text" value="<fmt:formatDate value='${brand.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="active">active</label>
						<div class="controls">
							<input class="input-large" id="active" name="active" type="text" value="${brand.active}">
							<span class="help-inline"><form:errors path="active"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="order">降序 越大越靠前</label>
						<div class="controls">
							<input class="input-large" id="order" name="order" type="text" value="${brand.order}">
							<span class="help-inline"><form:errors path="order"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="introduction">introduction</label>
						<div class="controls">
							<input class="input-large" id="introduction" name="introduction" type="text" value="${brand.introduction}">
							<span class="help-inline"><form:errors path="introduction"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="logo">logo</label>
						<div class="controls">
							<input class="input-large" id="logo" name="logo" type="text" value="${brand.logo}">
							<span class="help-inline"><form:errors path="logo"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="name">name</label>
						<div class="controls">
							<input class="input-large required" id="name" name="name" type="text" value="${brand.name}">
							<span class="help-inline"><form:errors path="name"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="type">type</label>
						<div class="controls">
							<input class="input-large required" id="type" name="type" type="text" value="${brand.type}">
							<span class="help-inline"><form:errors path="type"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="url">url</label>
						<div class="controls">
							<input class="input-large" id="url" name="url" type="text" value="${brand.url}">
							<span class="help-inline"><form:errors path="url"/></span>
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
