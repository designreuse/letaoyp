<%@ page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>注册</title>
<link href="${ctx}/static/css/style.css" rel="stylesheet" type="text/css">
<link href="${ctx}/static/css/login_reg.css" rel="stylesheet" type="text/css">
<link href="${ctx}/static/css/ec11.css" rel="stylesheet" type="text/css">
<link href="${ctx}/static/lib/jquery-validation/1.11.1/validate.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="reg_top">
		<a href="${ctx}/" name="top"><img
			src="${ctx}/static/images/redegsin/reg_logo.jpg"></a>
	</div>
	<div class="clear0"></div>
	<div class="blank"></div>
	<div class="clear0"></div>
	<div class="blank"></div>
	<div class="container">
		<div id="body">
			<div class="login_main">
				<div class="l_bar"></div>
				<div id="main" class="login_page">
					<div class="content_head">
						<h1>注册会员</h1>
					</div>
					<div class="content_body">
						<form id="form_reg" action="${ctx}/user/register" method="post" class="signup-user-form">
							<div class="input_container username">
                                <label>用户名</label>
                                <label class="input_field" for="username">
                                    <input class="f_input" minlength="6" maxlength="30" name="username" id="username" type="text"
                                    		data-rule-required="true" data-msg-required="用户名不能为空" data-msg-minlength="不少于{0}个字符">
                                </label>
                            </div>
                            <div class="input_container email">
                                <label>email</label>
                                <label class="input_field" for="email">
                                    <input class="f_input" maxlength="30" name="email" id="email" type="text" 
                                    		data-rule-required="true" data-rule-email="true" data-msg-required="请填写您的邮箱" data-msg-email="邮箱不合法">
                                </label>
                            </div>
                            <div class="input_container plain_password">
                                <label>密码</label>
                                <label class="input_field" for="plainPassword">
                                    <input class="f_input" name="plainPassword" id="plainPassword" type="password" onkeyup="checkIntensity(this.value)" minlength="6"
                                    	data-rule-required="true" data-msg-required="请输入密码" data-msg-minlength="密码长度至少{0}位">
                                </label>
                                <div style="clear: both;"></div>
                                <p class="safe-tip">
                                    <label id="pwd_lower" class="">弱</label>
                                    <label id="pwd_middle" class="">中</label>
                                    <label id="pwd_high" class="">强</label>
                                </p>
                            </div>
                            <div class="input_container confirm_password">
                                <label>确认密码</label>
                                <label class="input_field" for="confirm_password">
                                    <input class="f_input" name="confirm_password" id="confirm_password" type="password"
                                    		data-rule-equalTo="#plainPassword" data-msg-equalTo="两次输入密码不一致">
                                </label>
                            </div>
                            <div class="input_container phone">
                                <label>手机号</label>
                                <label class="input_field" for="mobile">
                                    <input class="f_input" name="mobile" id="mobile" type="text" minLength="11"
                                    		data-rule-required="true" data-msg-required="请输入手机号" data-msg-minLength="请输入正确的手机号" 
                                    		data-rule-digits="true" data-msg-digits="请输入正确的手机号">
                                </label>
                            </div>
                            
                            <div class="email_subscribe check_radio">
                                <label>
                                    <input name="agree" type="checkbox" value="1" checked="checked"> 我已看过并接受《
                                    <a href="javascript:;" style="color:blue">用户协议</a>》
                                </label>
                            </div>
                            
                            <div class="act">
                                <input name="act" type="hidden" value="act_register">
                                <input type="hidden" name="back_act" value="">
                                <input value="同意协议并注册" name="Submit" class="signup_button" type="submit">
                            </div>
                            <!-- 
                            <div id="sidebar" class="login_page">
                                <div class="siderbar_head"> 我已有账号，我要登录？ </div>
                                <div class="loginup_button"><a href="http://www.hzltyp.com/user.php" rel="nofollow">立即登录</a></div>
                                <div class="loginup_button"> <a href="http://www.hzltyp.com/user.php?act=get_password">您忘记密码了吗？</a></div>
                            </div>
                            <div class="r_bar"></div>
                             -->
                        </form>
                        <div style="display:none;color:"></div>
                        <div class="blank"></div>
                    </div>
                </div>
                <div class="blank"></div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>
    
    <script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/lib/jquery-validation/1.11.1/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/lib/jquery-validation/1.11.1/messages_bs_zh.js"></script>
	<script type="text/javascript" src="${ctx}/static/lib/layer/layer.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/user.js"></script>
    <script type="text/javascript">
    $(function() {
   
	    $("#form_reg").validate({
	    	errorPlacement: function(error, element) {
				// Append error within linked label
				$( element )
					.closest( "form" )
						.find( "label[for='" + element.attr( "id" ) + "']" )
							.after( error );
			},
			errorElement: "span",
			rules: {
				mobile: {
					synchronousRemote: '${ctx}/user/check/mobile'
				},
				username: {
					remote: '${ctx}/user/check/username'
				}
			},
			messages: {
				mobile: {
					synchronousRemote: '手机号已注册'
				},
				username: {remote: '用户名已存在'}
			},
			submitHandler: function(form) {
				if(!$('input[name=agree]').is(':checked')) {
					layer.msg('请查看并接受本协议');
					return false;
				}
				
				form.submit();
			}
		});
	    
    })
    	
    </script>
</body>
</html>
