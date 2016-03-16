<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="visit_history" value="${sessionScope._key_visit_history.list}"/>
<html>
<head>
<title>确认订单</title>
<link href="${ctx}/static/css/style.css" rel="stylesheet" type="text/css">
<link href="${ctx}/static/css/ec11.css" rel="stylesheet" type="text/css">
<link href="${ctx}/static/css/category.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="reg_top">
        <a href="${ctx}/" name="top"><img src="${ctx}/static/images/redegsin/reg_logo.jpg"></a>
    </div>
    <div class="clear0"></div>
    <div class="blank"></div>
    <div class="block">
        <div class="step_all step_3"></div>
        <div class="flowBox" style="margin:30px auto 70px auto;">
            <h6 style="text-align:center; height:30px; line-height:30px;">感谢您在本店购物！您的订单已提交成功，订单号: <font style="color:red">${order.tradeNo}</font></h6>
            <table width="100%" align="center" border="0" cellpadding="15" cellspacing="0" bgcolor="#fff" style="border:1px solid #ddd; margin:20px auto;">
                <tbody>
                    <tr>
                        <td align="center">
                            您的应付款金额为: <strong>￥${order.fee / 100}</strong>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <div style="text-align:center">
                                <input type="button" onclick="window.open(&#39;https://mapi.alipay.com/gateway.do?_input_charset=utf-8&amp;extend_param=isv%5Esh22&amp;logistics_fee=0&amp;logistics_payment=BUYER_PAY_AFTER_RECEIVE&amp;logistics_type=EXPRESS&amp;notify_url=http%3A%2F%2Fwww.hzltyp.com%2Frespond.php%3Fcode%3Dalipay&amp;out_trade_no=201603069827254&amp;partner=&amp;payment_type=1&amp;price=129.00&amp;quantity=1&amp;return_url=http%3A%2F%2Fwww.hzltyp.com%2Frespond.php%3Fcode%3Dalipay&amp;seller_email=&amp;service=trade_create_by_buyer&amp;subject=2016030698272&amp;sign=87ee5442928ea30863f8a45da06f23cf&amp;sign_type=MD5&#39;)" value="立即使用支付宝支付">
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <p style="text-align:center; margin-bottom:20px;">您可以 <a href="${ctx}/">返回首页</a> 或去 <a href="${ctx}/user">用户中心</a></p>
        </div>
    </div>
    
    <jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>
</body>
</html>