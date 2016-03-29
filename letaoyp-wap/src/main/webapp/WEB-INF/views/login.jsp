<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>登录页</title>
	<link href="${ctx}/static/css/style.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/login_reg.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/ec11.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="reg_top">
        <a href="${ctx}/" name="top"><img src="${ctx}/static/images/redegsin/reg_logo.jpg"></a>
    </div>
    <div class="clear0"></div>
    <div class="blank"></div>
    <div class="container">
        <div id="body">
            <div class="loginWrap">
                <div class="loginPic"> <img class="pic" src="${ctx}/static/images/redegsin/loginPic.jpg" alt="">
                    <a href="http://www.hzltyp.com/index.php" class="piclink"></a>
                    <div class="loginBord">
                        <div class="loginTit"> <span class="fl">会员登录</span> 
                        	<span class="fr"> <i class="grey">还没有注册账号？</i> 
                        		<a href="${ctx}/user/register">立即注册</a></span> 
                        </div>
                        <form name="login" action="${ctx}/user/login" method="post">
                            <div class="inputGroup noticWrap">
                                <div class="inputWrap">
                                    <div class="user-icon"></div>
                                    <input class="inputborder" id="username" name="username" autocomplete="off" placeholder="用户名" type="text" style="border:0">
                                </div>
                            </div>
                            <div class="inputGroup noticWrap">
                                <div class="inputWrap">
                                    <div class="pass-icon"></div>
                                    <input class="inputborder" id="password" name="password" placeholder="密码" type="password">
                                </div>
                            </div>
                            <div class="formLine clearfix">
                                <div class="check_radio fl">
                                    <input type="checkbox" value="1" name="remember" id="remember">
                                    <label for="remember"> 请保存我这次的登录信息。</label>
                                </div>
                                <a href="http://www.hzltyp.com/user.php?act=get_password" class="fr"> 忘记密码?</a> </div>
                            <input type="hidden" name="act" value="act_login">
                            <input type="hidden" name="back_act" value="http://www.hzltyp.com/index.php">
                            <input class="loginbtn" name="submit" value="登 录" type="submit">
                            <c:if test="${not empty message}"><span style="color:red">${message}</span></c:if>
                        </form>
                    </div>
                    <div class="shadow_l"></div>
                    <div class="shadow_r"></div>
                </div>
            </div>
            <div class="blank"></div>
        </div>
    </div>
    <div class="blank"></div>
    <jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>
    
    <script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/lib/jquery.cookie.js"></script>
    <script type="text/javascript">
    	$(function() {
    		var account_cookie_key = 'login_account';
    		$('#username').val($.cookie(account_cookie_key));
    	})
    </script>
</body>
</html>
