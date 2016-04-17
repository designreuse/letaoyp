<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<form id="form" class="form-horizontal" action="${ctx}/admin/account/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">${user.id == null ? '新增' : '编辑'}</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
			<input type="hidden" name="id" value="${user.id}" />
			<div class="form-group">
				<label class="col-sm-4 control-label" for="exampleInputEmail1">姓名</label>
				<div class="col-sm-6">
					<input class="form-control" id="name" name="name" type="text" value="${user.name}" placeholder="name"
						data-rule-required="true" data-msg-required="请输入姓名">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="loginName">登录账号</label>
				<div class="col-sm-6">
					<input class="form-control" id="original_loginName" type="hidden" value="${user.loginName}" /> <input
						class="form-control" id="loginName" name="loginName" type="text" value="${user.loginName}"
						placeholder="login name" required data-rule-pattern="[a-z|0-9]{2,20}" data-msg-pattern="2-20位字母与数字组合" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="plainPassword">登录密码</label>
				<div class="col-sm-6">
					<input class="form-control" type="password" id="plainPassword" name="plainPassword" placeholder="password" <c:if test="${user.id == null}">required</c:if>
						data-rule-pattern="[a-z|A-Z|0-9]{6,20}" data-msg-pattern="6-20位字母与数字组合" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="confirmPassword">确认密码</label>
				<div class="col-sm-6">
					<input class="form-control" type="password" id="confirmPassword" name="confirmPassword" equalTo="#plainPassword"
						placeholder="confirm password" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="confirmPassword" style="padding-top: 0;">状态</label>
				<div class="col-sm-6">

					<input type="radio" name="active" class="minimal icheck" <c:if test="${user.active}">checked</c:if> value="1">
					<span class="label label-success">Active</span> &nbsp;&nbsp; 
					<input type="radio" name="active" class="minimal icheck" <c:if test="${!user.active}">checked</c:if> value="0"> 
					<span class="label label-danger">Banned</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="confirmPassword">创建时间</label>
				<div class="col-sm-6">
					<input class="form-control datepicker" type="text"
						value="<fmt:formatDate value="${user.created}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="confirmPassword">修改时间</label>
				<div class="col-sm-6">
					<input class="form-control datepicker" type="text"
						value="<fmt:formatDate value="${user.modified}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly">
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
<script>
  $(document).ready(
      function() {
        //聚焦第一个输入框
        $("#name").focus();
        //为inputForm注册validate函数
        $("#form").validate({
          rules : {
            loginName : {
              remote : {
                param : {
                  url : '${ctx}/admin/account/check/loginname',
                },
                depends : function(element) {
                  return $(element).val() !== $(
                      '#original_' + $(element).attr('id')).val();
                }
              },
            }
          },
          messages: {
            loginName : {
              remote: "账号名已存在"
            }
          },
          submitHandler: function(form) {
            ajax({
              url: $(form).attr('action'),
              type: $(form).attr('method') || 'GET',
              data: $(form).serialize(),
              success: function(data) {
                notice.information('save successful');
                $('#modal_form').modal('hide');
                $('.modal-backdrop').hide();
                $('#button_search').click();
              }
            })
          }
        });
      });
</script>