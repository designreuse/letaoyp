<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="visit_history" value="${sessionScope._key_visit_history.list}"/>
<html>
<head>
<title>我的资产</title>
<link href="${ctx}/static/css/category.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="block box">
        <div id="ur_here">
            <div class="Navigation">当前位置: <a href="http://www.hzltyp.com/">首页</a> <code>&gt;</code> 用户中心</div>
        </div>
    </div>
    <div class="blank"></div>
    <div class="block clearfix userpage">
        <div class="AreaL">
            <div class="box">
                <div class="box_1">
                    <div class="userCenterBox">
                        <div class="userMenu">
                            <div style="display:none"><a href="http://www.hzltyp.com/user.php"> 欢迎页</a> <a href="http://www.hzltyp.com/user.php?act=profile">用户信息</a>
                                <a href="http://www.hzltyp.com/user.php?act=order_list">我的订单</a>
                                <a href="http://www.hzltyp.com/user.php?act=address_list">收货地址</a>
                                <a href="http://www.hzltyp.com/user.php?act=collection_list"> 我的收藏</a>
                                <a href="http://www.hzltyp.com/user.php?act=message_list">我的留言</a>
                                <a href="http://www.hzltyp.com/user.php?act=tag_list">我的标签</a>
                                <a href="http://www.hzltyp.com/user.php?act=booking_list">缺货登记</a>
                                <a href="http://www.hzltyp.com/user.php?act=bonus">我的红包</a>
                                <a href="http://www.hzltyp.com/user.php?act=affiliate"><img src="images/u10.gif"> 我的推荐</a>
                                <a href="http://www.hzltyp.com/user.php?act=comment_list"><img src="images/u11.gif"> 我的评论</a>
                                <!--<a href="user.php?act=group_buy">我的团购</a>-->
                                <a href="http://www.hzltyp.com/user.php?act=track_packages"><img src="images/u12.gif"> 跟踪包裹</a>
                                <a href="http://www.hzltyp.com/user.php?act=account_log" class="curs"><img src="images/u13.gif"> 资金管理</a>
                            </div>
                            <h2><b></b><a href="">会员中心</a> </h2>
                            <dl class="curr">
                                <dt><b></b>账户中心
                                </dt>
                                <dd style="DISPLAY: block"><a href="http://www.hzltyp.com/user.php"> 欢迎页</a> <a href="http://www.hzltyp.com/user.php?act=profile">用户信息</a></dd>
                            </dl>
                            <dl class="curr">
                                <dt><b></b>客户服务
                                </dt>
                                <dd style="DISPLAY: block">
                                    <a href="http://www.hzltyp.com/user.php?act=collection_list"> 我的收藏</a>
                                    <a href="http://www.hzltyp.com/user.php?act=message_list">我的留言</a>
                                    <a href="http://www.hzltyp.com/user.php?act=tag_list">我的标签</a>
                                    <a href="http://www.hzltyp.com/user.php?act=bonus">我的红包</a>
                                    <a href="http://www.hzltyp.com/user.php?act=affiliate">我的推荐</a>
                                </dd>
                            </dl>
                            <dl class="curr">
                                <dt><b></b>订单中心
                                </dt>
                                <dd style="DISPLAY: block">
                                    <a href="http://www.hzltyp.com/user.php?act=order_list">我的订单</a>
                                    <a href="http://www.hzltyp.com/user.php?act=address_list">收货地址</a>
                                    <a href="http://www.hzltyp.com/user.php?act=booking_list">缺货登记</a>
                                    <a href="http://www.hzltyp.com/user.php?act=comment_list">我的评论</a>
                                    <!--<a href="user.php?act=group_buy">我的团购</a>-->
                                    <a href="http://www.hzltyp.com/user.php?act=track_packages"> 跟踪包裹</a> <a href="http://www.hzltyp.com/user.php?act=account_log" class="curs">资金管理</a>
                                </dd>
                            </dl><a href="http://www.hzltyp.com/user.php?act=logout" title="安全退出" class="fd30_logout">安全退出</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="AreaR">
            <div class="box">
                <div class="box_1">
                    <div class="userCenterBox boxCenterList clearfix" style="_height:1%;">
                        <h5><span>会员余额</span></h5>
                        <div class="blank"></div>
                        <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                            <tbody>
                                <tr>
                                    <td align="right" bgcolor="#ffffff"><a href="http://www.hzltyp.com/user.php?act=account_deposit" class="f6">充值</a> | <a href="http://www.hzltyp.com/user.php?act=account_raply" class="f6">提现</a> | <a href="http://www.hzltyp.com/user.php?act=account_detail" class="f6">查看帐户明细</a> | <a href="http://www.hzltyp.com/user.php?act=account_log" class="f6">查看申请记录</a> </td>
                                </tr>
                            </tbody>
                        </table>
                        <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                            <tbody>
                                <tr align="center">
                                    <td bgcolor="#ffffff">操作时间</td>
                                    <td bgcolor="#ffffff">类型</td>
                                    <td bgcolor="#ffffff">金额</td>
                                    <td bgcolor="#ffffff">会员备注</td>
                                    <td bgcolor="#ffffff">管理员备注</td>
                                    <td bgcolor="#ffffff">状态</td>
                                    <td bgcolor="#ffffff">操作</td>
                                </tr>
                                <tr>
                                    <td colspan="7" align="right" bgcolor="#ffffff">您当前的可用资金为：￥0.00</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="fd_pager">
                            <form name="selectPageForm" action="http://www.hzltyp.com/user.php" method="get">
                                <div id="pager" class="pagebar"> <span class="f_l f6">总计 <b>0</b>  个记录</span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>