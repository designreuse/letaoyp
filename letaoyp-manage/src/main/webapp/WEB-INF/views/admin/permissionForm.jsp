<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ admin / 权限表</span>
		</li>
	</ul>
</div>

<div class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-edit"></i> Form Elements</h2>
		</div>
		<div class="box-content">
			<form:form action="${ctx}/admin/permission/update" modelAttribute="permission" method="post" class="form-horizontal">
				<fieldset>					
					<input type="hidden" id="id" name="id" value="${permission.id}"/>

					<div class="control-group">
						<label class="control-label" for="name">name</label>
						<div class="controls">
							<input class="input-xlarge required" id="name" name="name" type="text" value="${permission.name}">
							<span class="help-inline"><form:errors path="name"/></span>
							
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="description">description</label>
						<div class="controls">
							<input class="input-xlarge required" id="description" name="description" type="text" value="${permission.description}">
							<span class="help-inline"><form:errors path="description"/></span>
							
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="menu">menu</label>
						<div class="controls">
							<input class="input-xlarge" id="menu" name="menu" type="text" value="${permission.menu}">
							<span class="help-inline"><form:errors path="menu"/></span>
							
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="active">active</label>
						<div class="controls">
							<input class="input-xlarge" id="active" name="active" type="text" value="${permission.active}">
							<span class="help-inline"><form:errors path="active"/></span>
							
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="created">created</label>
						<div class="controls">
							<input class="input-xlarge required" id="created" name="created" type="text" value="<fmt:formatDate value="${permission.created}" pattern="yyyy-MM-dd HH:mm:ss"/>">
							
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="modified">modified</label>
						<div class="controls">
							<input class="input-xlarge required" id="modified" name="modified" type="text" value="<fmt:formatDate value="${permission.modified}" pattern="yyyy-MM-dd HH:mm:ss"/>">
							
						</div>
					</div>
				</fieldset>
			</form:form>   
		</div>
	</div><!--/span-->

</div><!--/row-->

<!-- public common.js -->
<script src="${ctx}/static/js/common.js"></script>
