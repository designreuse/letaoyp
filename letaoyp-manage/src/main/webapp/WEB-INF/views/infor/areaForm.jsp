<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ infor / Area</span>
		</li>
	</ul>
</div>

<div class="row-fluid">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-edit"></i> Form Elements</h2>
		</div>
		<div class="box-content">
			<form action="${ctx}/infor/area/update" modelAttribute="area" method="post" class="form-horizontal">
				<fieldset>					
					<input type="hidden" id="id" name="id" value="${area.id}"/>

					<div class="control-group">
						<label class="control-label" for="created">created</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="created" name="created" readonly="readonly"
								type="text" value="<fmt:formatDate value='${area.created}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="modified">modified</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="modified" name="modified" readonly="readonly"
								type="text" value="<fmt:formatDate value='${area.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="active">active</label>
						<div class="controls">
							<input class="input-large" id="active" name="active" type="text" value="${area.active}">
							<span class="help-inline"><form:errors path="active"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="order">order</label>
						<div class="controls">
							<input class="input-large" id="order" name="order" type="text" value="${area.order}">
							<span class="help-inline"><form:errors path="order"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="fullName">fullName</label>
						<div class="controls">
							<input class="input-large required" id="fullName" name="fullName" type="text" value="${area.fullName}">
							<span class="help-inline"><form:errors path="fullName"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="name">name</label>
						<div class="controls">
							<input class="input-large required" id="name" name="name" type="text" value="${area.name}">
							<span class="help-inline"><form:errors path="name"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="treePath">treePath</label>
						<div class="controls">
							<input class="input-large required" id="treePath" name="treePath" type="text" value="${area.treePath}">
							<span class="help-inline"><form:errors path="treePath"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="parent">parent</label>
						<div class="controls">
							<input class="input-large" id="parent" name="parent" type="text" value="${area.parent}">
							<span class="help-inline"><form:errors path="parent"/></span>
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
