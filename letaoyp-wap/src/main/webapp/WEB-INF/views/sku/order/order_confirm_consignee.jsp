<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="visit_history" value="${sessionScope._key_visit_history.list}"/>
<html>
<head>
<title>确认收货地址</title>
<link href="${ctx}/static/css/category.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="reg_top">
        <a href="http://www.hzltyp.com/index.php" name="top"><img src="images/redegsin/reg_logo.jpg"></a>
    </div>
    <div class="clear0"></div>
    <div class="blank"></div>
    <div class="block">
        <div class="step_all step_2">
        </div>
        <form action="http://www.hzltyp.com/flow.php" method="post" name="theForm" id="theForm" onsubmit="return checkConsignee(this)">
            <div class="flowBox">
                <h6><span>收货人信息</span></h6>
                <table width="99%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                    <tbody>
                        <tr>
                            <td bgcolor="#ffffff">配送区域:</td>
                            <td colspan="3" bgcolor="#ffffff">
                                <select name="country" id="selCountries_0" onchange="region.changed(this, 1, &#39;selProvinces_0&#39;)" style="border:1px solid #ccc;">
                                    <option value="0">请选择国家</option>
                                    <option value="1" selected="">中国</option>
                                </select>
                                <select name="province" id="selProvinces_0" onchange="region.changed(this, 2, &#39;selCities_0&#39;)" style="border:1px solid #ccc;">
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
                                <select name="city" id="selCities_0" onchange="region.changed(this, 3, &#39;selDistricts_0&#39;)" style="border:1px solid #ccc;">
                                    <option value="0">请选择市</option>
                                </select>
                                <select name="district" id="selDistricts_0" style="display:none">
                                    <option value="0">请选择区</option>
                                </select>
                                (必填) </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffffff">收货人姓名:</td>
                            <td bgcolor="#ffffff">
                                <input name="consignee" type="text" class="inputBg" id="consignee_0" value=""> (必填) </td>
                            <td bgcolor="#ffffff">电子邮件地址:</td>
                            <td bgcolor="#ffffff">
                                <input name="email" type="text" class="inputBg" id="email_0" value="iacdingping@gmail.com"> (必填)
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffffff">详细地址:</td>
                            <td bgcolor="#ffffff">
                                <input name="address" type="text" class="inputBg" id="address_0" value=""> (必填)
                            </td>
                            <td bgcolor="#ffffff">邮政编码:</td>
                            <td bgcolor="#ffffff">
                                <input name="zipcode" type="text" class="inputBg" id="zipcode_0" value="">
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffffff">电话:</td>
                            <td bgcolor="#ffffff">
                                <input name="tel" type="text" class="inputBg" id="tel_0" value=""> (必填)
                            </td>
                            <td bgcolor="#ffffff">手机:</td>
                            <td bgcolor="#ffffff">
                                <input name="mobile" type="text" class="inputBg" id="mobile_0" value="">
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffffff">标志建筑:</td>
                            <td bgcolor="#ffffff">
                                <input name="sign_building" type="text" class="inputBg" id="sign_building_0" value="">
                            </td>
                            <td bgcolor="#ffffff">最佳送货时间:</td>
                            <td bgcolor="#ffffff">
                                <input name="best_time" type="text" class="inputBg" id="best_time_0" value="">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center" bgcolor="#ffffff">
                                <input type="submit" name="Submit" class="bnt_blue_2" value="配送至这个地址">
                                <input type="hidden" name="step" value="consignee">
                                <input type="hidden" name="act" value="checkout">
                                <input name="address_id" type="hidden" value="">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</body>
</html>