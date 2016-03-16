<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="visit_history" value="${sessionScope._key_visit_history.list}"/>
<html>
<head>
<title>收货地址</title>
<link href="${ctx}/static/css/category.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="block box">
        <div id="ur_here">
            <div class="Navigation">当前位置: <a href="${ctx}/">首页</a> <code>&gt;</code> 用户中心</div>
        </div>
    </div>
    <div class="blank"></div>
    <div class="block clearfix userpage">
        <div class="AreaL">
            <div class="box">
                <div class="box_1">
                    <div class="userCenterBox">
                        <div class="userMenu">
                            <h2><b></b><a href="">会员中心</a> </h2>
                            <dl class="curr">
                                <dt><b></b>账户中心
                                </dt>
                                <dd style="DISPLAY: block"><a href="http://www.hzltyp.com/user.php"> 欢迎页</a> 
                                <a href="http://www.hzltyp.com/user.php?act=profile">用户信息</a></dd>
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
                                    <a href="http://www.hzltyp.com/user.php?act=order_list">我的订单</a>
                                    <!--<a href="http://www.hzltyp.com/user.php?act=address_list" class="curs">收货地址</a>
                                    <a href="http://www.hzltyp.com/user.php?act=booking_list">缺货登记</a>
                                    <a href="http://www.hzltyp.com/user.php?act=comment_list">我的评论</a>
                                    <a href="user.php?act=group_buy">我的团购</a>
                                    <a href="http://www.hzltyp.com/user.php?act=track_packages"> 跟踪包裹</a> <a href="http://www.hzltyp.com/user.php?act=account_log">资金管理</a>-->
                                </dd>
                            </dl><a href="${ctx}/user/logout" title="安全退出" class="fd30_logout">安全退出</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="AreaR">
            <div class="box">
                <div class="box_1">
                    <div class="userCenterBox boxCenterList clearfix" style="_height:1%;">
                        <h5><span>收货人信息</span></h5>
                        <div class="blank"></div>
                        <form action="http://www.hzltyp.com/user.php" method="post" name="theForm" onsubmit="return checkConsignee(this)">
                            <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                                <tbody>
                                    <tr>
                                        <td align="right" bgcolor="#ffffff">配送区域：</td>
                                        <td colspan="3" align="left" bgcolor="#ffffff">
                                            <select name="country" id="selCountries_0" onchange="region.changed(this, 1, &#39;selProvinces_0&#39;)">
                                                <option value="0">请选择国家</option>
                                                <option value="1" selected="">中国</option>
                                            </select>
                                            <select name="province" id="selProvinces_0" onchange="region.changed(this, 2, &#39;selCities_0&#39;)">
                                                <option value="0">请选择省</option>
                                                <option value="2">北京</option>
                                                <option value="3">安徽</option>
                                                <option value="4">福建</option>
                                                <option value="5">甘肃</option>
                                                <option value="6">广东</option>
                                                <option value="7">广西</option>
                                                <option value="8">贵州</option>
                                                <option value="9">海南</option>
                                                <option value="10">河北</option>
                                                <option value="11">河南</option>
                                                <option value="12">黑龙江</option>
                                                <option value="13" selected="">湖北</option>
                                                <option value="14">湖南</option>
                                                <option value="15">吉林</option>
                                                <option value="16">江苏</option>
                                                <option value="17">江西</option>
                                                <option value="18">辽宁</option>
                                                <option value="19">内蒙古</option>
                                                <option value="20">宁夏</option>
                                                <option value="21">青海</option>
                                                <option value="22">山东</option>
                                                <option value="23">山西</option>
                                                <option value="24">陕西</option>
                                                <option value="25">上海</option>
                                                <option value="26">四川</option>
                                                <option value="27">天津</option>
                                                <option value="28">西藏</option>
                                                <option value="29">新疆</option>
                                                <option value="30">云南</option>
                                                <option value="31">浙江</option>
                                                <option value="32">重庆</option>
                                                <option value="33">香港</option>
                                                <option value="34">澳门</option>
                                                <option value="35">台湾</option>
                                            </select>
                                            <select name="city" id="selCities_0" onchange="region.changed(this, 3, &#39;selDistricts_0&#39;)">
                                                <option value="0">请选择市</option>
                                                <option value="180" selected="">武汉</option>
                                                <option value="181">仙桃</option>
                                                <option value="182">鄂州</option>
                                                <option value="183">黄冈</option>
                                                <option value="184">黄石</option>
                                                <option value="185">荆门</option>
                                                <option value="186">荆州</option>
                                                <option value="187">潜江</option>
                                                <option value="188">神农架林区</option>
                                                <option value="189">十堰</option>
                                                <option value="190">随州</option>
                                                <option value="191">天门</option>
                                                <option value="192">咸宁</option>
                                                <option value="193">襄樊</option>
                                                <option value="194">孝感</option>
                                                <option value="195">宜昌</option>
                                                <option value="196">恩施</option>
                                            </select>
                                            <select name="district" id="selDistricts_0">
                                                <option value="0">请选择区</option>
                                                <option value="1544">江岸区</option>
                                                <option value="1545">武昌区</option>
                                                <option value="1546" selected="">江汉区</option>
                                                <option value="1547">硚口区</option>
                                                <option value="1548">汉阳区</option>
                                                <option value="1549">青山区</option>
                                                <option value="1550">洪山区</option>
                                                <option value="1551">东西湖区</option>
                                                <option value="1552">汉南区</option>
                                                <option value="1553">蔡甸区</option>
                                                <option value="1554">江夏区</option>
                                                <option value="1555">黄陂区</option>
                                                <option value="1556">新洲区</option>
                                                <option value="1557">经济开发区</option>
                                            </select>
                                            (必填) </td>
                                    </tr>
                                    <tr>
                                        <td align="right" bgcolor="#ffffff">收货人姓名：</td>
                                        <td align="left" bgcolor="#ffffff">
                                            <input name="consignee" type="text" class="inputBg" id="consignee_0" value="Markin"> (必填) </td>
                                        <td align="right" bgcolor="#ffffff">电子邮件地址：</td>
                                        <td align="left" bgcolor="#ffffff">
                                            <input name="email" type="text" class="inputBg" id="email_0" value="iacdingping@gmail.com"> (必填)
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" bgcolor="#ffffff">详细地址：</td>
                                        <td align="left" bgcolor="#ffffff">
                                            <input name="address" type="text" class="inputBg" id="address_0" value="湖北高级人才中心市场"> (必填)
                                        </td>
                                        <td align="right" bgcolor="#ffffff">邮政编码：</td>
                                        <td align="left" bgcolor="#ffffff">
                                            <input name="zipcode" type="text" class="inputBg" id="zipcode_0" value="430034">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" bgcolor="#ffffff">电话：</td>
                                        <td align="left" bgcolor="#ffffff">
                                            <input name="tel" type="text" class="inputBg" id="tel_0" value="18000000000"> (必填)
                                        </td>
                                        <td align="right" bgcolor="#ffffff">手机：</td>
                                        <td align="left" bgcolor="#ffffff">
                                            <input name="mobile" type="text" class="inputBg" id="mobile_0" value="18012341234">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" bgcolor="#ffffff">标志建筑：</td>
                                        <td align="left" bgcolor="#ffffff">
                                            <input name="sign_building" type="text" class="inputBg" id="sign_building_0" value="无心法师">
                                        </td>
                                        <td align="right" bgcolor="#ffffff">最佳送货时间：</td>
                                        <td align="left" bgcolor="#ffffff">
                                            <input name="best_time" type="text" class="inputBg" id="best_time_0" value="23:00">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" bgcolor="#ffffff">&nbsp;</td>
                                        <td colspan="3" align="center" bgcolor="#ffffff">
                                            <input type="submit" name="submit" class="bnt_blue_1" value="确认修改">
                                            <input name="button" type="button" class="bnt_blue" onclick="if (confirm(&#39;你确认要删除该收货地址吗？&#39;))location.href=&#39;user.php?act=drop_consignee&amp;id=34&#39;" value="删除">
                                            <input type="hidden" name="act" value="act_edit_address">
                                            <input name="address_id" type="hidden" value="34">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <form action="http://www.hzltyp.com/user.php" method="post" name="theForm" onsubmit="return checkConsignee(this)">
                            <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                                <tbody>
                                    <tr>
                                        <td align="right" bgcolor="#ffffff">配送区域：</td>
                                        <td colspan="3" align="left" bgcolor="#ffffff">
                                            <select name="country" id="selCountries_1" onchange="region.changed(this, 1, &#39;selProvinces_1&#39;)">
                                                <option value="0">请选择国家</option>
                                                <option value="1" selected="">中国</option>
                                            </select>
                                            <select name="province" id="selProvinces_1" onchange="region.changed(this, 2, &#39;selCities_1&#39;)">
                                                <option value="0">请选择省</option>
                                                <option value="2">北京</option>
                                                <option value="3">安徽</option>
                                                <option value="4">福建</option>
                                                <option value="5">甘肃</option>
                                                <option value="6">广东</option>
                                                <option value="7">广西</option>
                                                <option value="8">贵州</option>
                                                <option value="9">海南</option>
                                                <option value="10">河北</option>
                                                <option value="11">河南</option>
                                                <option value="12">黑龙江</option>
                                                <option value="13">湖北</option>
                                                <option value="14">湖南</option>
                                                <option value="15">吉林</option>
                                                <option value="16">江苏</option>
                                                <option value="17">江西</option>
                                                <option value="18">辽宁</option>
                                                <option value="19">内蒙古</option>
                                                <option value="20">宁夏</option>
                                                <option value="21">青海</option>
                                                <option value="22">山东</option>
                                                <option value="23">山西</option>
                                                <option value="24">陕西</option>
                                                <option value="25">上海</option>
                                                <option value="26">四川</option>
                                                <option value="27">天津</option>
                                                <option value="28">西藏</option>
                                                <option value="29">新疆</option>
                                                <option value="30">云南</option>
                                                <option value="31">浙江</option>
                                                <option value="32">重庆</option>
                                                <option value="33">香港</option>
                                                <option value="34">澳门</option>
                                                <option value="35">台湾</option>
                                            </select>
                                            <select name="city" id="selCities_1" onchange="region.changed(this, 3, &#39;selDistricts_1&#39;)">
                                                <option value="0">请选择市</option>
                                            </select>
                                            <select name="district" id="selDistricts_1" style="display:none">
                                                <option value="0">请选择区</option>
                                            </select>
                                            (必填) </td>
                                    </tr>
                                    <tr>
                                        <td align="right" bgcolor="#ffffff">收货人姓名：</td>
                                        <td align="left" bgcolor="#ffffff">
                                            <input name="consignee" type="text" class="inputBg" id="consignee_1" value=""> (必填) </td>
                                        <td align="right" bgcolor="#ffffff">电子邮件地址：</td>
                                        <td align="left" bgcolor="#ffffff">
                                            <input name="email" type="text" class="inputBg" id="email_1" value="iacdingping@gmail.com"> (必填)
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" bgcolor="#ffffff">详细地址：</td>
                                        <td align="left" bgcolor="#ffffff">
                                            <input name="address" type="text" class="inputBg" id="address_1" value=""> (必填)
                                        </td>
                                        <td align="right" bgcolor="#ffffff">邮政编码：</td>
                                        <td align="left" bgcolor="#ffffff">
                                            <input name="zipcode" type="text" class="inputBg" id="zipcode_1" value="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" bgcolor="#ffffff">电话：</td>
                                        <td align="left" bgcolor="#ffffff">
                                            <input name="tel" type="text" class="inputBg" id="tel_1" value=""> (必填)
                                        </td>
                                        <td align="right" bgcolor="#ffffff">手机：</td>
                                        <td align="left" bgcolor="#ffffff">
                                            <input name="mobile" type="text" class="inputBg" id="mobile_1" value="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" bgcolor="#ffffff">标志建筑：</td>
                                        <td align="left" bgcolor="#ffffff">
                                            <input name="sign_building" type="text" class="inputBg" id="sign_building_1" value="">
                                        </td>
                                        <td align="right" bgcolor="#ffffff">最佳送货时间：</td>
                                        <td align="left" bgcolor="#ffffff">
                                            <input name="best_time" type="text" class="inputBg" id="best_time_1" value="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" bgcolor="#ffffff">&nbsp;</td>
                                        <td colspan="3" align="center" bgcolor="#ffffff">
                                            <input type="submit" name="submit" class="bnt_blue_2" value="新增收货地址">
                                            <input type="hidden" name="act" value="act_edit_address">
                                            <input name="address_id" type="hidden" value="">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>