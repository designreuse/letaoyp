<%@ page language="java" pageEncoding="UTF-8" %>
<div class="AreaL">
    <div class="box">
        <div class="box_1">
            <div class="userCenterBox">
                <div class="userMenu">
                    <h2><b></b><a href="">会员中心</a> </h2>
                    <dl class="curr">
                        <dt><b></b>账户中心
                        </dt>
                        <dd style="DISPLAY: block">
                        	<a href="${ctx}/user"> 欢迎页</a> 
                        	<a href="${ctx}/user/profile">用户信息</a>
                        </dd>
                    </dl>
                    <!-- 
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
                    </dl> -->
                    <dl class="curr">
                        <dt><b></b>订单中心
                        </dt>
                        <dd style="DISPLAY: block">
                            <a href="${ctx}/user/order">我的订单</a>
                            <!--
                            <a href="http://www.hzltyp.com/user.php?act=address_list">收货地址</a>
                            <a href="http://www.hzltyp.com/user.php?act=booking_list">缺货登记</a>
                            <a href="http://www.hzltyp.com/user.php?act=comment_list">我的评论</a>
                            <a href="user.php?act=group_buy">我的团购</a>
                            <a href="http://www.hzltyp.com/user.php?act=track_packages"> 跟踪包裹</a> <a href="http://www.hzltyp.com/user.php?act=account_log">资金管理</a>
                            -->
                        </dd>
                    </dl><a href="http://www.hzltyp.com/user.php?act=logout" title="安全退出" class="fd30_logout">安全退出</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
	$(function() {
		$('a[href="' + String(location.pathname) + '"]').addClass('curs');
	})
</script>