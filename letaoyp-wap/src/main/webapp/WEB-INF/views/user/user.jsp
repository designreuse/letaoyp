<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="member" value="${sessionScope._letaoyp_u_.member}" />

<html>
<head>
<title>用户中心</title>
</head>
<body>
	<div class="block box">
        <div id="ur_here">
            <div class="Navigation">当前位置: <a href="${ctx}/">首页</a> <code>&gt;</code> 用户中心</div>
        </div>
    </div>
    <div class="blank"></div>
    <div class="block clearfix userpage">
        <jsp:include page="navigation.jsp"></jsp:include>
        <div class="AreaR">
            <div class="box">
                <div class="box_1">
                    <div class="userCenterBox boxCenterList clearfix" style="_height:1%;">
                        <font class="f5"><b class="f4">${member.username}</b> 欢迎您回到 友橙优品！</font>
                        <br>
                        <div class="blank"></div>
                        您的上一次登录时间: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${member.loginDate}" />
                        <br>
                        <div class="blank5"></div>
                        <br>
                        <div style="margin:5px 0; border:1px solid #a1675a;padding:10px 20px; background-color:#e8d1c9;"> <img src="${ctx}/static/images/note.gif" alt="note">&nbsp;欢迎您的加盟~~~ </div>
                        <br>
                        <br>
                        <div class="f_l" style="width:350px;">
                            <h5><span>您的账户</span></h5>
                            <div class="blank"></div>
                            余额:<a href="javascript:;" style="color:#006bd0;">￥0.00</a>
                            <br> 红包:
                            <a href="javascript:;" style="color:#006bd0;">共计 0 个,价值 ￥0.00</a>
                            <br> 积分:0积分
                            <br>
                        </div>
                        <div class="f_r" style="width:350px;">
                            <h5><span>用户提醒</span></h5>
                            <div class="blank"></div>
                            您最近30天内提交了${orderCount}个订单
                            <br>
                        </div>
                        <div class="blank5"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>