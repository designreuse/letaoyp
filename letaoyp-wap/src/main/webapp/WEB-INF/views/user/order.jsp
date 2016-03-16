<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="member" value="${sessionScope._letaoyp_u_.member}" />

<html>
<head>
<title>我的订单</title>
</head>
<body>
	<div class="block box">
        <div id="ur_here">
            <div class="Navigation">当前位置: <a href="${ctx}/">首页</a> <code>&gt;</code> 用户中心 <code>&gt;</code> 我的订单 </div>
        </div>
    </div>
    <div class="blank"></div>
    <div class="block clearfix userpage">
       	<jsp:include page="navigation.jsp"></jsp:include>
        <div class="AreaR">
            <div class="box">
                <div class="box_1">
                    <div class="userCenterBox boxCenterList clearfix" style="_height:1%;">
                        <h5><span>我的订单</span></h5>
                        <div class="blank"></div>
                        <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                            <tbody>
                                <tr align="center">
                                    <td bgcolor="#ffffff">订单号</td>
                                    <td bgcolor="#ffffff">下单时间</td>
                                    <td bgcolor="#ffffff">订单总金额</td>
                                    <td bgcolor="#ffffff">订单状态</td>
                                    <td bgcolor="#ffffff">操作</td>
                                </tr>
                                <c:forEach items="${page.content}" var="order">
	                                <tr>
	                                    <td align="center" bgcolor="#ffffff"><a href="javascript:;" class="f6">${order.tradeNo}</a></td>
	                                    <td align="center" bgcolor="#ffffff"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.created}" /></td>
	                                    <td align="right" bgcolor="#ffffff">￥${order.fee / 100}</td>
	                                    <td align="center" bgcolor="#ffffff">${order.status.description}</td>
	                                    <td align="center" bgcolor="#ffffff">
	                                        <font class="f6"><a href="javascript:;" data-id="${order.id}">删除订单</a></font>
	                                    </td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="blank5"></div>
                        <div class="fd_pager">
                            <tags:pagination page="${page}" paginationSize="10"/>
                        </div>
                        <div class="blank5"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>