<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ info / 公告|帮助</span>
		</li>
	</ul>
</div>

<div class="row-fluid">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-edit"></i> Form Elements</h2>
		</div>
		<div class="box-content">
			<form action="${ctx}/info/information/update" modelAttribute="information" method="post" class="form-horizontal">
				<fieldset>					
					<input type="hidden" id="id" name="id" value="${information.id}"/>

					<div class="control-group">
						<label class="control-label" for="created">created</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="created" name="created" readonly="readonly"
								type="text" value="<fmt:formatDate value='${information.created}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="modified">modified</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="modified" name="modified" readonly="readonly"
								type="text" value="<fmt:formatDate value='${information.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="active">active</label>
						<div class="controls">
							<input class="input-large" id="active" name="active" type="text" value="${information.active}">
							<span class="help-inline"><form:errors path="active"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="title">title</label>
						<div class="controls">
							<input class="input-large" id="title" name="title" type="text" value="${information.title}">
							<span class="help-inline"><form:errors path="title"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="description">description</label>
						<div class="controls">
							<input class="input-large" id="description" name="description" type="text" value="${information.description}">
							<span class="help-inline"><form:errors path="description"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="detail">detail</label>
						<div class="controls">
							<input class="input-large" id="detail" name="detail" type="text" value="${information.detail}">
							<span class="help-inline"><form:errors path="detail"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="model">ANNOUNCEMENT 公告; HELP 帮助</label>
						<div class="controls">
							<input class="input-large" id="model" name="model" type="text" value="${information.model}">
							<span class="help-inline"><form:errors path="model"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="top">top</label>
						<div class="controls">
							<input class="input-large" id="top" name="top" type="text" value="${information.top}">
							<span class="help-inline"><form:errors path="top"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="topImage">topImage</label>
						<div class="controls">
							<input class="input-large" id="topImage" name="topImage" type="text" value="${information.topImage}">
							<span class="help-inline"><form:errors path="topImage"/></span>
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
