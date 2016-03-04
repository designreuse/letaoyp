<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ infor / Advertise</span>
		</li>
	</ul>
</div>

<div class="row-fluid">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-edit"></i> Form Elements</h2>
		</div>
		<div class="box-content">
			<form action="${ctx}/infor/advertise/update" modelAttribute="advertise" method="post" class="form-horizontal">
				<fieldset>					
					<input type="hidden" id="id" name="id" value="${advertise.id}"/>

					<div class="control-group">
						<label class="control-label" for="created">created</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="created" name="created" readonly="readonly"
								type="text" value="<fmt:formatDate value='${advertise.created}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="modified">modified</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="modified" name="modified" readonly="readonly"
								type="text" value="<fmt:formatDate value='${advertise.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="active">active</label>
						<div class="controls">
							<input class="input-large" id="active" name="active" type="text" value="${advertise.active}">
							<span class="help-inline"><form:errors path="active"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="model">HOME</label>
						<div class="controls">
							<input class="input-large" id="model" name="model" type="text" value="${advertise.model}">
							<span class="help-inline"><form:errors path="model"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="image">image</label>
						<div class="controls">
							<input class="input-large required" id="image" name="image" type="text" value="${advertise.image}">
							<span class="help-inline"><form:errors path="image"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="text">text</label>
						<div class="controls">
							<input class="input-large" id="text" name="text" type="text" value="${advertise.text}">
							<span class="help-inline"><form:errors path="text"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="link">link</label>
						<div class="controls">
							<input class="input-large" id="link" name="link" type="text" value="${advertise.link}">
							<span class="help-inline"><form:errors path="link"/></span>
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
