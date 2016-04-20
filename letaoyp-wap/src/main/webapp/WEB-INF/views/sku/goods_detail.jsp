<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="visit_history" value="${sessionScope._key_visit_history.list}"/>
<html>
<head>
<title>Home</title>
<link href="${ctx}/static/css/category.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="prcpage">
        <div class="block box">
            <div id="ur_here">
            	<div class="Navigation">
	            	当前位置: <a href="${ctx}/">首页</a>
					<c:set var="treePathes" value="${fn:split(category.treePath, ',')}" />			
					<c:set var="treeNames" value="${fn:split(category.treeName, ',')}" />
						
					<c:forEach items="${treeNames}" var="treeName" varStatus="status">
						<c:if test="${fn:length(treeNames[0]) > 0}">
							<code>&gt;123${treeNames[0]}</code>
							<a href="${ctx}/sku/category/${treePathes[status.index]}">${treeName}</a>
						</c:if>	
					</c:forEach>
					
					<code>&gt;</code>
					<a href="javascript:void(0);">${category.name}</a>
	            
                </div>
            </div>
        </div>
        <div id="goodsInfo" class="clearfix">
            <div class="imgInfo">
                <div class="gmax_pic_box">
                    <img src="${goods.image}" alt="女装短外套" class="gmax_pic">
                </div>
                <div class="picture" id="imglist">
                    <div class="cxjad_m">
                        <div class="cxjinfo" style="width: 400px; margin-left: 0px;">
                        	<c:forEach items="${images}" var="image">
                        		<div class="cxjitem">
                        			
	                                <a <c:if test="${goods.image == image.src}">class="a_h"</c:if> href="javascript:void(0);" rev="${image.src}" title=""> <img src="${image.src}" alt="${goods.name}"></a>
	                            </div>
                        	</c:forEach>
                        </div>
                    </div>
                </div>
                <style>

                </style>
                <div class="clear10"></div>
                <div class="blank5"></div>
            </div>
            <div class="textInfo">
                <div class="goodsnames">${goods.name}</div>
                <div class="briefs"></div>
                <form action="javascript:addToCart(${goods.id})" method="post" name="ECS_FORMBUY" id="ECS_FORMBUY">
                    <div class="all_price">
                        <div class="ECS_GOODS_AMOUNT">商品总价
                            <font id="ECS_GOODS_AMOUNT" class="shop">￥${goods.salesPrice / 100}</font>
                        </div>
                        <!-- 
                        <div class="rank_prices">(会员等级价<em>V</em>)
                            <div>
                                <table border="0" cellpadding="0" cellspacing="0">
                                </table>
                            </div>
                        </div> -->
                        <div class="clear0"></div>
                        <div class="market_prices"> <strong>市场价格：</strong><font class="market">￥${goods.marketPrice / 100}</font> </div>
                    </div>
                    <div class="clear10"></div>
                    <table width="100%" border="0" cellpadding="0" cellspacing="15" class="COMMENT_table">
                        <tbody>
                            <tr>
                                <td class="td1"><strong>近期销售量</strong><i class="get_BOUGHT"></i></td>
                                <td class="td2"><strong>用户评价：</strong><img src="${ctx}/static/images/stars5.gif" alt="comment rank 5">(<i class="get_COMMENT"></i>)</td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="clear0"></div>
                    <ul class="fd30_ulinfo">
                    	<c:if test="${goods.brand != null }">
                        	<li> <strong>商品品牌：</strong><a href="javascript:void(0);">${goods.brand.name}</a> </li>
                        </c:if>
                        <li> <strong>商品重量：</strong>${goods.weight}${goods.unit} </li>
                        <li>
                            <strong>商品点击数：</strong>${goods.hits} </li>
                        <li style="display:none">
                            <!--  <strong>本店售价：</strong><font class="shop" id="ECS_SHOPPRICE">￥129</font><br />-->
                        </li>
                        
                        <c:forEach items="${choosen}" var="item">
                        	<li class="padd loop"> <strong>${item.key}:</strong>
                        		<c:forEach items="${item.value}" var="choosen" varStatus="status">
                        			
		                            <label for="spec_value_${choosen.id}" <c:if test="${status.index == 0}"> class="label_click"</c:if> data-choosen="${choosen.id}" data-price="${choosen.cost}">
		                                <input type="radio" name="choosen" value="${choosen.id}" id="spec_value_${choosen.id}" checked="" onclick="computePrice()"> ${choosen.value}
		                                <b>${choosen.value}</b><em> ￥${choosen.cost / 100}</em>
	                                </label>
                        		</c:forEach>
	                            <input type="hidden" name="spec_list" value="3">
	                            <div class="clear0"></div>
	                        </li>
                        </c:forEach>
                        
                        <li> <strong>购买数量：</strong>
                            <input name="number" type="text" id="number" value="1" size="3" onblur="computePrice()" style="border:1px solid #ccc; ">
                        </li>
                        
                        <!-- 积分目前不支持
                        <li> <strong>购买此商品可使用：</strong>
                            <font class="f4">0 积分</font>
                        </li> -->
                        <li class="padd">
                            <a href="javascript:addToCart(${goods.id})"><img src="${ctx}/static/images/bnt_cat.gif"></a>
                            <!-- 收藏 分享先去掉
                            <a href="javascript:collect(${goods.id})"><img src="${ctx}/static/images/bnt_colles.gif"></a>
                            <a href="http://www.hzltyp.com/user.php?act=affiliate&amp;goodsid=3852"><img src="images/bnt_recommend.gif"></a>
                             -->
                        </li>
                    </ul>
                </form>
            </div>
        </div>
        <div class="blank"></div>
        <div class="prc_r">
            <div class="leftbox" id="history_div" style="display: block;">
                <div class="lt">浏览历史</div>
                <div class="boxCenterList clearfix" id="history_list">
                	<c:forEach items="${visit_history}" var="goods">
	                    <ul class="clearfix ul_visit_history">
	                        <li class="goodsimg">
	                            <a href="${ctx}/sku/goods/${goods.id}" target="_blank">
	                            	<img src="${goods.image}" alt="${goods.name}" class="B_blue">
	                            </a>
	                        </li>
	                        <li><a href="${ctx}/sku/goods/${goods.id}" target="_blank" title="${goods.name}">${goods.name}</a>
	                            <br>本店售价：
	                            <font class="f1">￥${goods.salesPrice / 100}</font>
	                            <br>
	                        </li>
	                    </ul>
                	</c:forEach>
                    <ul id="clear_history"><a onclick="clear_history()">[清空]</a></ul>
                </div>
            </div>
            <div class="clear10"></div>
        </div>
        <div class="prc_l">
            <div class="box">
                <div class="box_1">
                    <div id="com_b" class="history clearfix">
                        <h2 style="cursor: pointer;">商品描述：</h2>
                        <h2 class="h2bg" style="cursor: pointer;">商品属性</h2>
                    </div>
                    <div id="com_v" class="detail_index boxCenterList RelaArticle">
                        <div align="center">${goods.description}</div>
                    </div>
                    <div id="com_h" class="detail_index none boxCenterList RelaArticle">
                        <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#dddddd">
                            <tbody>
                                <tr>
                                    <th colspan="2" bgcolor="#FFFFFF">商品属性</th>
                                </tr>
                                <c:forEach items="${ goods.parsedProperty }" var="item">
                                 <tr>
                                     <td bgcolor="#FFFFFF" align="left" width="30%" class="f1">[${item.key}]</td>
                                     <td bgcolor="#FFFFFF" align="left" width="70%">${item.value}</td>
                                 </tr>
                                </c:forEach>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="blank"></div>
        </div>
    </div>
    
    <script type="text/javascript" src="${ctx}/static/js/autoroll.js"></script>
    <script type="text/javascript">
    
	    function clear_history() {
			ajax({
				url: '${ctx}/sku/goods/clearVisitHistory',
				success: function(data) {
					$('.ul_visit_history').remove();
				}
			})
		}
	    
	    
		$(function() {
			$(".picture").textSlider({
				speeds : 5000,
				lines : 1,
				offset : 5000,
				direc : 1,
				qnum : 5
			});
			$(".cxjitem a").hover(function() {
				$(".cxjitem a").removeClass("a_h");
				$(this).addClass('a_h');
				var imgSrc = $(this).attr("rev");
				$(".gmax_pic").attr('src', imgSrc);
			});
			
			$(".loop label").click(function() {
				$(this).siblings().removeClass("label_click");
				$(this).addClass("label_click");
			});
			
			
			// 商品属性切换
			$('#com_b h2').each(function(i) {
				$(this).click(function() {
					$('#com_b h2').addClass('h2bg');
					$(this).removeClass('h2bg');
					$('.detail_index').hide().eq(i).show();
				})
			});
			
			computePrice();
		});
		
		var price = $('goods.salesPrice');
		function computePrice() {
			if(!/^[0-9]+$/g.test($('#number').val())) {
				$('#number').val('1');
			}
			
			var num = $('#number').val();
			var p = '${goods.salesPrice}';
			$('.padd.loop .label_click').each(function() {
				var _this = $(this);
				p += _this.data('price');
			})
			$('#ECS_GOODS_AMOUNT').html('￥' + num * (p / 100).toFixed(2));
		}
		
		function addToCart(goods) {
			var choosen = [];
			if($('li.padd.loop').length) {
				$('li.padd.loop').each(function(i) {
					var $select = $(this).find('label.label_click');
					if($select.length != 1) {
						
						layer.msg('请选择 ' + $(this).find('strong').text());
						
						return false;	//? is useful ?
					}
					
					choosen.push($select.data('choosen'));
				})
			}
			
			ajax({
				url: '${ctx}/sku/order/cart',
				type: 'post',
				data: {goods: goods, choosen: choosen.join(','), count: $('#number').val()},
				success: function(data) {
					// animate pic into the cart
					layer.msg('已加入购物车');
					var num = parseInt($('#cartCount').html());
					$('#cartCount').html(num + 1);
				}
			})
			
		}
	</script>
</body>
</html>