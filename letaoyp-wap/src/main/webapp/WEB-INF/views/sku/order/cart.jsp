<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="visit_history" value="${sessionScope._key_visit_history.list}"/>
<html>
<head>
<title>购物车</title>
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
        <div class="step_all step_1"></div>
        <div class="flowBox flowBox1">
            <table width="100%" align="center" border="0" cellpadding="5" cellspacing="0" class="formCart_table">
                <tbody>
                    <tr>
                        <th>商品名称</th>
                        <!--              <th >属性</th>-->
                        <th>本店价</th>
                        <th>购买数量</th>
                        <th>小计</th>
                        <th>操作</th>
                    </tr>
                    
                    <c:forEach items="${items}" var="cartItem">
                    	<tr id="cartitem_${cartItem.id}" class="cartItem">
                         <td align="center">
                             <div class="fl">
                                 <a href="${ctx}/sku/goods/${cartItem.goods.id}" target="_blank">
                                 <img src="${cartItem.goods.image}" border="0" title="${cartItem.goods.name}"></a>
                             </div>
                             <div class="fl">
                                 <a href="${ctx}/sku/goods/${cartItem.goods.id}" target="_blank" class="f6">${cartItem.goods.name}</a>
                                 <p> 
                                 	<c:forEach items="${cartItem.mappedChoosenDescription}" var="entry">
                                 		${entry.key} : ${entry.value}
                                 		<br>
                                 	</c:forEach>
                                 </p>
                             </div>
                         </td>
                         <td>￥<span>${cartItem.price / 100}</span></td>
                         <td>
                         	${cartItem.quantity}
                             <!-- <input name="submit" type="button" class="fd30_jian_606" value="-" onclick="decrement(${cartItem.id})"> -->
                             <!-- <input type="text" name="goods_number[606]" id="goods_number_606" value="${cartItem.quantity}" size="2" class="inputBg fd30_num" style="text-align:center " onkeydown="showdiv(this)"> -->
                             <!-- <input name="submit" type="button" class="fd30_jia_606" value="+" onclick="increment(${cartItem.id})"> -->
                         </td>
                         <td align="right">￥<span class="span_price">${cartItem.price * cartItem.quantity / 100}</span></td>
                         <td align="center">
                             <a href="javascript:deleteCartItem(${cartItem.id})" class="f6">删除</a>
                             <a href="javascript:;" class="f6">放入收藏夹</a>
                         </td>
                     </tr>
                    </c:forEach>
                </tbody>
            </table>
            <table width="100%" align="center" border="0" cellpadding="5" cellspacing="0" class="fd30_tt">
                <tbody>
                    <tr>
                        <td>
                            <a href="${ctx}/"><img src="${ctx}/static/images/continue.gif" alt="continue"></a>
                            <input id="button_clear_cart" type="button" value="清空购物车" class="fd30_clear" />
                        </td>
                        <td>
                            <div class="fr"> <a href="${ctx}/sku/order/from/cart" class="fd30_checkout">去结算</a></div>
                            <div class="fr">
                                <span id="total_price"><em>总计：</em>￥311.00</span></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="blank"></div>
    </div>
    <jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>
    
    <script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.9.1.min.js"></script>
    <script>
    	$(function() {
    	  computePrice();
    		$('#button_clear_cart').click(clearCart);
    	})
    	
    	function computePrice() {
    	  var totalPrice = 0;
        $('.span_price').each(function() {
          totalPrice += parseInt($(this).text());
        })
        
        $('#total_price').html('<em>总计：￥</em>' + totalPrice);
    	}
    	
    	function deleteCartItem(cartItem) {
    	  $.ajax({
    	    url: '${ctx}/sku/order/cart/' + cartItem, 
    	    type: 'DELETE',
    	    success: function(data) {
    	      if(data.success) {
    	        $('#cartitem_' + cartItem).fadeOut();
    	        $('#cartitem_' + cartItem).find('.span_price').removeClass('span_price');
    	        computePrice();
    	      } else {
    	        layer.msg(data.msg || 'Sorry 操作失败，请稍后再试');
    	      }
    	    }
    	  })
    	}
    	
    	function clearCart() {
    	  $.ajax({
          url: '${ctx}/sku/order/cart',
          type: 'DELETE',
          success: function(data) {
            if(data.success) {
              $('tr.cartItem .span_price').removeClass('span_price');
              $('tr.cartItem').fadeOut();
              computePrice();
            } else {
              layer.msg(data.msg || 'Sorry 操作失败，请稍后再试');
            }
          }
        })
    	}
    </script>
</body>
</html>