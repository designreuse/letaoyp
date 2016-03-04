<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ admin / 字典表</span>
		</li>
	</ul>
</div>

<div class="row-fluid">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-edit"></i> Form Elements</h2>
		</div>
		<div class="box-content">
			<form action="${ctx}/admin/dict/update" modelAttribute="dict" method="post" class="form-horizontal">
				<fieldset>					
					<input type="hidden" id="id" name="id" value="${dict.id}"/>

					<div class="control-group">
						<label class="control-label" for="label">标签名</label>
						<div class="controls">
							<input class="input-large required" id="label" name="label" type="text" value="${dict.label}">
							<span class="help-inline"><form:errors path="label"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="value">数据值</label>
						<div class="controls">
							<input class="input-large required" id="value" name="value" type="text" value="${dict.value}">
							<span class="help-inline"><form:errors path="value"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="type">类型</label>
						<div class="controls">
							<input class="input-large required" id="type" name="type" type="text" value="${dict.type}">
							<span class="help-inline"><form:errors path="type"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="description">描述</label>
						<div class="controls">
							<input class="input-large required" id="description" name="description" type="text" value="${dict.description}">
							<span class="help-inline"><form:errors path="description"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="sort">排序（升序）</label>
						<div class="controls">
							<input class="input-large required" id="sort" name="sort" type="text" value="${dict.sort}">
							<span class="help-inline"><form:errors path="sort"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="remarks">备注信息</label>
						<div class="controls">
							<input class="input-large" id="remarks" name="remarks" type="text" value="${dict.remarks}">
							<span class="help-inline"><form:errors path="remarks"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="active">active</label>
						<div class="controls">
							<input class="input-large" id="active" name="active" type="text" value="${dict.active}">
							<span class="help-inline"><form:errors path="active"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="created">created</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="created" name="created" readonly="readonly"
								type="text" value="<fmt:formatDate value='${dict.created}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="modified">modified</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="modified" name="modified" readonly="readonly"
								type="text" value="<fmt:formatDate value='${dict.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>">
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
