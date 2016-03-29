<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<form id="form" class="form-horizontal" form-validate action="${ctx}/user/member/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">
${member.id == null ? '新增' : '编辑'}		</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
      <input type="hidden" id="id" name="id" value="${member.id}"/>

	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="username">username</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="username" name="username" type="text" value="${member.username}" data-rule-required="true" data-msg-required="请输入username" />
	        <span class="help-inline"><form:errors path="username"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="password">password</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="password" name="password" type="text" value="${member.password}" data-rule-required="true" data-msg-required="请输入password" />
	        <span class="help-inline"><form:errors path="password"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="salt">加密salt</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="salt" name="salt" type="text" value="${member.salt}"  />
	        <span class="help-inline"><form:errors path="salt"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="area">area</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="area" name="area" type="text" value="${member.area}"  />
	        <span class="help-inline"><form:errors path="area"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="address">详细地址</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="address" name="address" type="text" value="${member.address}"  />
	        <span class="help-inline"><form:errors path="address"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="birth">birth</label>
	      <div class="col-sm-6">
		      	<input class="form-control" id="birth" name="birth"
		          type="text" value="<fmt:formatDate value='${member.birth}' pattern='yyyy-MM-dd HH:mm:ss'/>" >
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="email">email</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="email" name="email" type="text" value="${member.email}" data-rule-required="true" data-msg-required="请输入email" />
	        <span class="help-inline"><form:errors path="email"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="gender">gender</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="gender" name="gender" type="text" value="${member.gender}"  />
	        <span class="help-inline"><form:errors path="gender"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="isLocked">isLocked</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="isLocked" name="isLocked" type="text" value="${member.isLocked}" data-rule-required="true" data-msg-required="请输入isLocked" />
	        <span class="help-inline"><form:errors path="isLocked"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="lockedDate">lockedDate</label>
	      <div class="col-sm-6">
		      	<input class="form-control" id="lockedDate" name="lockedDate"
		          type="text" value="<fmt:formatDate value='${member.lockedDate}' pattern='yyyy-MM-dd HH:mm:ss'/>" >
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="loginDate">loginDate</label>
	      <div class="col-sm-6">
		      	<input class="form-control" id="loginDate" name="loginDate"
		          type="text" value="<fmt:formatDate value='${member.loginDate}' pattern='yyyy-MM-dd HH:mm:ss'/>" >
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="loginFailureCount">loginFailureCount</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="loginFailureCount" name="loginFailureCount" type="text" value="${member.loginFailureCount}" data-rule-required="true" data-msg-required="请输入loginFailureCount" />
	        <span class="help-inline"><form:errors path="loginFailureCount"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="loginIp">loginIp</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="loginIp" name="loginIp" type="text" value="${member.loginIp}"  />
	        <span class="help-inline"><form:errors path="loginIp"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="mobile">电话</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="mobile" name="mobile" type="text" value="${member.mobile}" data-rule-required="true" data-msg-required="请输入电话" />
	        <span class="help-inline"><form:errors path="mobile"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="phone">手机</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="phone" name="phone" type="text" value="${member.phone}"  />
	        <span class="help-inline"><form:errors path="phone"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="nick">nick</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="nick" name="nick" type="text" value="${member.nick}"  />
	        <span class="help-inline"><form:errors path="nick"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="registerIp">registerIp</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="registerIp" name="registerIp" type="text" value="${member.registerIp}" data-rule-required="true" data-msg-required="请输入registerIp" />
	        <span class="help-inline"><form:errors path="registerIp"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="zipCode">zipCode</label>
	      <div class="col-sm-6">
	        <input class="form-control" id="zipCode" name="zipCode" type="text" value="${member.zipCode}"  />
	        <span class="help-inline"><form:errors path="zipCode"/></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="active">active</label>
	      <div class="col-sm-6">
	      	<input type="radio" name="active" class="minimal icheck" <c:if test="${member.active}">checked</c:if> value="1">
					<span class="label label-success">Active</span> &nbsp;&nbsp; 
					<input type="radio" name="active" class="minimal icheck" <c:if test="${!member.active}">checked</c:if> value="0"> 
					<span class="label label-danger">Banned</span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="created">created</label>
	      <div class="col-sm-6">
	      		<input class="form-control" id="created" name="created"
		          type="text" value="<fmt:formatDate value='${member.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-4 control-label" for="modified">modified</label>
	      <div class="col-sm-6">
	      		<input class="form-control" id="modified" name="modified"
		          type="text" value="<fmt:formatDate value='${member.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
	      </div>
	    </div>

		</div>
	</div>
	<div class="modal-footer">
		<button type="reset" class="btn btn-default">重置</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		<button type="submit" class="btn btn-primary">提交</button>
	</div>
</form>

<script type="text/javascript" src="${ctx}/static/js/app_single.js" />