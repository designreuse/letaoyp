<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div>
	<ul class="breadcrumb">
		<li>
			<a href="${ctx}/">Home</a> <span class="divider">/ user / 人员表</span>
		</li>
	</ul>
</div>

<div class="row-fluid">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-edit"></i> Form Elements</h2>
		</div>
		<div class="box-content">
			<form action="${ctx}/user/member/update" modelAttribute="member" method="post" class="form-horizontal">
				<fieldset>					
					<input type="hidden" id="id" name="id" value="${member.id}"/>

					<div class="control-group">
						<label class="control-label" for="created">created</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="created" name="created" readonly="readonly"
								type="text" value="<fmt:formatDate value='${member.created}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="modified">modified</label>
						<div class="controls">
							<input class="input-large datepicker  required" id="modified" name="modified" readonly="readonly"
								type="text" value="<fmt:formatDate value='${member.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="active">active</label>
						<div class="controls">
							<input class="input-large" id="active" name="active" type="text" value="${member.active}">
							<span class="help-inline"><form:errors path="active"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="username">username</label>
						<div class="controls">
							<input class="input-large required" id="username" name="username" type="text" value="${member.username}">
							<span class="help-inline"><form:errors path="username"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">password</label>
						<div class="controls">
							<input class="input-large required" id="password" name="password" type="text" value="${member.password}">
							<span class="help-inline"><form:errors path="password"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="salt">加密salt</label>
						<div class="controls">
							<input class="input-large" id="salt" name="salt" type="text" value="${member.salt}">
							<span class="help-inline"><form:errors path="salt"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="area">area</label>
						<div class="controls">
							<input class="input-large" id="area" name="area" type="text" value="${member.area}">
							<span class="help-inline"><form:errors path="area"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="address">详细地址</label>
						<div class="controls">
							<input class="input-large" id="address" name="address" type="text" value="${member.address}">
							<span class="help-inline"><form:errors path="address"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="birth">birth</label>
						<div class="controls">
							<input class="input-large datepicker " id="birth" name="birth" readonly="readonly"
								type="text" value="<fmt:formatDate value='${member.birth}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="email">email</label>
						<div class="controls">
							<input class="input-large required" id="email" name="email" type="text" value="${member.email}">
							<span class="help-inline"><form:errors path="email"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="gender">gender</label>
						<div class="controls">
							<input class="input-large" id="gender" name="gender" type="text" value="${member.gender}">
							<span class="help-inline"><form:errors path="gender"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="isLocked">isLocked</label>
						<div class="controls">
							<input class="input-large required" id="isLocked" name="isLocked" type="text" value="${member.isLocked}">
							<span class="help-inline"><form:errors path="isLocked"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="lockedDate">lockedDate</label>
						<div class="controls">
							<input class="input-large datepicker " id="lockedDate" name="lockedDate" readonly="readonly"
								type="text" value="<fmt:formatDate value='${member.lockedDate}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="loginDate">loginDate</label>
						<div class="controls">
							<input class="input-large datepicker " id="loginDate" name="loginDate" readonly="readonly"
								type="text" value="<fmt:formatDate value='${member.loginDate}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="loginFailureCount">loginFailureCount</label>
						<div class="controls">
							<input class="input-large required" id="loginFailureCount" name="loginFailureCount" type="text" value="${member.loginFailureCount}">
							<span class="help-inline"><form:errors path="loginFailureCount"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="loginIp">loginIp</label>
						<div class="controls">
							<input class="input-large" id="loginIp" name="loginIp" type="text" value="${member.loginIp}">
							<span class="help-inline"><form:errors path="loginIp"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="mobile">电话</label>
						<div class="controls">
							<input class="input-large required" id="mobile" name="mobile" type="text" value="${member.mobile}">
							<span class="help-inline"><form:errors path="mobile"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="phone">手机</label>
						<div class="controls">
							<input class="input-large" id="phone" name="phone" type="text" value="${member.phone}">
							<span class="help-inline"><form:errors path="phone"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="nick">nick</label>
						<div class="controls">
							<input class="input-large" id="nick" name="nick" type="text" value="${member.nick}">
							<span class="help-inline"><form:errors path="nick"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="registerIp">registerIp</label>
						<div class="controls">
							<input class="input-large required" id="registerIp" name="registerIp" type="text" value="${member.registerIp}">
							<span class="help-inline"><form:errors path="registerIp"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="zipCode">zipCode</label>
						<div class="controls">
							<input class="input-large" id="zipCode" name="zipCode" type="text" value="${member.zipCode}">
							<span class="help-inline"><form:errors path="zipCode"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="attributeValue0">attributeValue0</label>
						<div class="controls">
							<input class="input-large" id="attributeValue0" name="attributeValue0" type="text" value="${member.attributeValue0}">
							<span class="help-inline"><form:errors path="attributeValue0"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="attributeValue1">attributeValue1</label>
						<div class="controls">
							<input class="input-large" id="attributeValue1" name="attributeValue1" type="text" value="${member.attributeValue1}">
							<span class="help-inline"><form:errors path="attributeValue1"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="attributeValue2">attributeValue2</label>
						<div class="controls">
							<input class="input-large" id="attributeValue2" name="attributeValue2" type="text" value="${member.attributeValue2}">
							<span class="help-inline"><form:errors path="attributeValue2"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="attributeValue3">attributeValue3</label>
						<div class="controls">
							<input class="input-large" id="attributeValue3" name="attributeValue3" type="text" value="${member.attributeValue3}">
							<span class="help-inline"><form:errors path="attributeValue3"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="attributeValue4">attributeValue4</label>
						<div class="controls">
							<input class="input-large" id="attributeValue4" name="attributeValue4" type="text" value="${member.attributeValue4}">
							<span class="help-inline"><form:errors path="attributeValue4"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="attributeValue5">attributeValue5</label>
						<div class="controls">
							<input class="input-large" id="attributeValue5" name="attributeValue5" type="text" value="${member.attributeValue5}">
							<span class="help-inline"><form:errors path="attributeValue5"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="attributeValue6">attributeValue6</label>
						<div class="controls">
							<input class="input-large" id="attributeValue6" name="attributeValue6" type="text" value="${member.attributeValue6}">
							<span class="help-inline"><form:errors path="attributeValue6"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="attributeValue7">attributeValue7</label>
						<div class="controls">
							<input class="input-large" id="attributeValue7" name="attributeValue7" type="text" value="${member.attributeValue7}">
							<span class="help-inline"><form:errors path="attributeValue7"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="attributeValue8">attributeValue8</label>
						<div class="controls">
							<input class="input-large" id="attributeValue8" name="attributeValue8" type="text" value="${member.attributeValue8}">
							<span class="help-inline"><form:errors path="attributeValue8"/></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="attributeValue9">attributeValue9</label>
						<div class="controls">
							<input class="input-large" id="attributeValue9" name="attributeValue9" type="text" value="${member.attributeValue9}">
							<span class="help-inline"><form:errors path="attributeValue9"/></span>
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
