<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="visit_history" value="${sessionScope._key_visit_history.list}"/>
<html>
<head>
<title>下单</title>
<link href="${ctx}/static/css/style.css" rel="stylesheet" type="text/css">
<link href="${ctx}/static/css/ec11.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="reg_top">
        <a href="${ctx}/" name="top"><img src="${ctx}/static/images/redegsin/reg_logo.jpg"></a>
    </div>
    <div class="clear0"></div>
    <div class="blank"></div>
    <div class="block">
        <form action="${ctx}/sku/order/from/cart" method="post" name="form" id="form" onsubmit="return checkOrderForm(this)">
            <div class="step_all step_2"></div>
            <div class="flowBox">
                <h6><span>商品列表</span><a href="${ctx}/sku/order/cart" class="f6">修改</a></h6>
                <table width="100%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                    <tbody>
                        <tr>
                            <th>商品名称</th>
                            <th>属性</th>
                            <th>本店价</th>
                            <th>购买数量</th>
                            <th>小计</th>
                        </tr>
                        <c:forEach items="${items}" var="cartItem">
                        
                        <tr>
                            <td>
                                <a href="${ctx}/sku/goods/${cartItem.goods.id}" target="_blank" class="f6">${cartItem.goods.name}</a>
                            </td>
                            <td>
                            	<c:forEach items="${cartItem.mappedChoosenDescription}" var="entry">
                               		${entry.key} : ${entry.value}
                               		<br>
                               	</c:forEach>
                            </td>
                            <td align="right">￥${cartItem.price / 100}</td>
                            <td align="right">${cartItem.quantity}</td>
                            <td align="right">￥<span="span_price">${cartItem.price * cartItem.quantity / 100}</span></td>
                        </tr>
                        
                        </c:forEach>
                        <tr>
                            <td colspan="7" id="total_price">
                                <em>总计：</em>￥311.00 </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="blank"></div>
            <div class="flowBox">
                <h6><span>收货人信息</span><a href="javascript:;" id="modify_consignee" class="f6">修改</a></h6>
                <table width="100%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                    <tbody>
                        <tr>
                            <td>收货人姓名:</td>
                            <td class="modifiable" data-id="receiver">Markin</td>
                            <td>电子邮件地址:</td>
                            <td class="modifiable" data-id="email">iacdingping@gmail.com</td>
                        </tr>
                        <tr>
                            <td>详细地址:</td>
                            <td class="modifiable" data-id="address">湖北高级人才中心市场 </td>
                            <td>邮政编码:</td>
                            <td class="modifiable" data-id="zipCode">430034</td>
                        </tr>
                        <tr>
                            <td>手机:</td>
                            <td class="modifiable" data-id="mobile">18012341234</td>
                            <td>收货时间:</td>
                            <td class="modifiable" data-id="receiveTime">9:00 - 24:00</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="blank"></div>
            
            <!-- 
            <div class="flowBox">
                <h6><span>配送方式</span></h6>
                <table width="100%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd" id="shippingTable">
                    <tbody>
                        <tr>
                            <th width="5%">&nbsp;</th>
                            <th width="25%">名称</th>
                            <th>订购描述</th>
                            <th width="15%">费用</th>
                            <th width="15%">免费额度</th>
                            <th width="15%">保价费用</th>
                        </tr>
                        <tr>
                            <td valign="top">
                                <input name="shipping" type="radio" value="4" supportcod="0" insure="0" onclick="selectShipping(this)">
                            </td>
                            <td valign="top"><strong>申通快递</strong></td>
                            <td valign="top">江、浙、沪地区首重为5元/KG，大部分地区10元/KG， 东北及部分地区15元/KG 新疆 西藏20元/KG</td>
                            <td align="right" valign="top">￥0.00</td>
                            <td align="right" valign="top">￥1.00</td>
                            <td align="right" valign="top">不支持保价</td>
                        </tr>
                        <tr>
                            <td colspan="6" align="right">
                                <label for="ECS_NEEDINSURE">
                                    <input name="need_insure" id="ECS_NEEDINSURE" type="checkbox" onclick="selectInsure(this.checked)" value="1" disabled="true"> 配送是否需要保价 </label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div> 
            <div class="blank"></div>
            <div class="flowBox">
                <h6><span>支付方式</span></h6>
                <table width="100%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd" id="paymentTable">
                    <tbody>
                        <tr>
                            <th width="5%">&nbsp;</th>
                            <th width="20%">名称</th>
                            <th>订购描述</th>
                            <th width="15%">手续费</th>
                        </tr>
                        <tr>
                            <td valign="top">
                                <input type="radio" name="payment" value="1" iscod="0" onclick="selectPayment(this)">
                            </td>
                            <td valign="top"><strong><font color="#FF0000">支付宝</font></strong></td>
                            <td valign="top">支付宝网站(www.alipay.com) 是国内先进的网上支付平台。
                                <br>支付宝收款接口：在线即可开通，
                                <font color="red"><b>零预付，免年费</b></font>，单笔阶梯费率，无流量限制。
                                <br>
                                <a href="http://cloud.ecshop.com/payment_apply.php?mod=alipay" target="_blank">
                                    <font color="red">立即在线申请</font>
                                </a>
                            </td>
                            <td align="right" valign="top">￥0.00</td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <input type="radio" name="payment" value="2" iscod="0" onclick="selectPayment(this)">
                            </td>
                            <td valign="top"><strong><font color="#FF0000">银联电子支付</font></strong></td>
                            <td valign="top">中国银联倾力打造的互联网支付平台，安全、高效、便捷。产品分为无卡支付与B2C支付，无卡支付无需持卡人开通网银。产品展示参照铁道部网站www.12306.cn使用之支付方式“中国银联”选项。银联电子支付与商派合作期间，推广期对商派商户
                                <font color="red">免平台接入费</font>，B2C支付接口
                                <font color="red">手续费0.6%</font>，无卡支付接口
                                <font color="red">手续费0.7%</font>，
                                <a href="http://cloud.ecshop.com/payment_apply.php?mod=syl">
                                    <font color="red">点击申请</font>
                                </a>。</td>
                            <td align="right" valign="top">￥0.00</td>
                        </tr>
                    </tbody>
                </table>
            </div>-->
            <div class="blank"></div>
            <div class="flowBox">
                <h6><span>其它信息</span></h6>
                <table width="100%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                    <tbody>
                    	<!-- 
                        <tr>
                            <td><strong>使用红包:</strong></td>
                            <td>
                                选择已有红包
                                <select name="bonus" onchange="changeBonus(this.value)" id="ECS_BONUS" style="border:1px solid #ccc;">
                                    <option value="0" selected="">请选择</option>
                                </select>
                                或者输入红包序列号
                                <input name="bonus_sn" type="text" class="inputBg" size="15" value="">
                                <input name="validate_bonus" type="button" class="bnt_blue_1" value="验证红包" onclick="validateBonus(document.forms[&#39;theForm&#39;].elements[&#39;bonus_sn&#39;].value)" style="vertical-align:middle;">
                            </td>
                        </tr> -->
                        <tr>
                            <td valign="top"><strong>订单附言:</strong></td>
                            <td>
                                <textarea name="postscript" cols="80" rows="3" id="postscript" style="border:1px solid #ccc;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>缺货处理:</strong></td>
                            <td>
                                <label>
                                    <input name="how_oos" type="radio" value="0" checked="" onclick="changeOOS(this)"> 等待所有商品备齐后再发
                                </label>
                                <label>
                                    <input name="how_oos" type="radio" value="1" onclick="changeOOS(this)"> 取消订单
                                </label>
                                <label>
                                    <input name="how_oos" type="radio" value="2" onclick="changeOOS(this)"> 与店主协商
                                </label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="blank"></div>
            <div class="flowBox">
                <h6><span>费用总计</span></h6>
                <div id="ECS_ORDERTOTAL">
                    <table width="100%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                        <tbody>
                        	<!-- 
                            <tr>
                                <td align="right" bgcolor="#ffffff">
                                    该订单完成后，您将获得
                                    <font class="f4_b">311</font> 积分 ，以及价值
                                    <font class="f4_b">￥0.00</font>的红包。
                                </td>
                            </tr> -->
                            <tr>
                                <td align="right" bgcolor="#ffffff">
                                    商品总价:
                                    <font class="f4_b"><span id="goods_price">￥311.00</span></font>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" bgcolor="#ffffff"> 应付款金额:
                                    <font class="f4_b"><span id="payment">￥311.00</span></font>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div align="center" style="margin:15px auto;">
                    <input type="image" src="${ctx}/static/images/bnt_subOrder.gif">
                    <input type="hidden" name="step" value="done">
                </div>
            </div>
        </form>
    </div>
    <jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>
    
    <script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.9.1.min.js"></script>
    <script>
    	$(function() {
    		var amount = 0;
    		$('.span_price').each(function() {
    			amount += parseInt($(this).text());
    		})
    		
    		$('#total_price').html('<em>总计：￥</em>' + amount);
    		$('#payment').html('￥' + amount);
    		$('#goods_price').html('￥' + amount);
    		modifyConsignee();
    	})
    	
    	function modifyConsignee() {
    		$('.modifiable').each(function() {
    			var _this = $(this);
    			_this.html('<span>' + _this.html() + '</span><input id="' + _this.data('id') + '" name="' + _this.data('id') + '" value="' + _this.html() + '" />')
    				.addClass('modify');
    		})
    		
    		$('#modify_consignee').click(function() {
    			if($(this).text() == '修改') {
    				$(this).text('确定');
	    			$('.modifiable').removeClass('modify').addClass('modifing');
    			} else {
    				$(this).text('修改');
    				$('.modifiable').removeClass('modifing').addClass('modify');
    				$('.modifiable span').each(function() {$(this).html($(this).next().val());})
    			}
    			
    		})
    	}
    </script>
    
    <style>
    	.modify input {display: none;}
    	.modifing span {display: none;}
    </style>
</body>
</html>