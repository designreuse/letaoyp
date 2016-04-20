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
	<div class="block clearfix">
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
		<div class="AreaR">
			<div id="Tr_cs"></div>
			<div class="clear10"></div>
			<div class="guige">
				<div class="screeBox">
					<strong>品牌：</strong> <span>全部</span> 
					<c:forEach items="${brandCategories}" var="brandCategory">
						<a href="${ctx}/sku/category/${category.id}?brand=${brandCategory.brand}">${brandCategory.brandName}</a>
					</c:forEach>
				</div>
				<div class="clear0"></div>
			</div>
			<div class="clear10"></div>
			<div class="prclist">
				<form method="GET" class="sort" name="listform">
					<div class="displaylist">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td class="listorder">
									<input type="hidden" name="category" value="1"> 
									<input type="hidden" name="display" value="list" id="display"> 
									<input type="hidden" name="brand" value="0"> 
									<input type="hidden" name="price_min" value="0"> 
									<input type="hidden" name="price_max" value="0"> 
									<input type="hidden" name="filter_attr" value="0"> 
									<input type="hidden" name="page" value="1"> 
									<input type="hidden" name="sort" value="goods_id"> 
									<input type="hidden" name="order" value="DESC"> 
									<a href="#" data-sort="SHIPPING_DESC">
										<img src="${ctx}/static/images/goods_id_DESC.gif" alt="按上架时间排序"></a> 
									<a href="">
										<img src="${ctx}/static/images/shop_price_default.gif" alt="按价格排序"></a> 
									<a href="">
										<img src="${ctx}/static/images/last_update_default.gif" alt="按更新时间排序"></a></td>
									<td>
										<table border="0" class="btn_display">
											<tbody>
												<tr>
													<td>显示方式：</td>
													<td>
														<a id="link_display_list" href="javascript:void(0);">
															<img src="${ctx}/static/images/display_mode_list_act.gif" alt=""></a> 
														<a id="link_display_grid" href="javascript:void(0);">
															<img src="${ctx}/static/images/display_mode_grid.gif" alt=""></a>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="td_r">(共有<b>${page.totalElements}</b>个商品) 共<b>${page.totalPages}</b>页 <a
										name="goods_list"></a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
				<div class="blank5"></div>
				
				<div class="goodsList" style="display:none;">
					<c:forEach items="${page.content}" var="goods" varStatus="status">
						
						<ul class="clearfix <c:if test="${status.index % 2 == 1}">bgcolor</c:if>" id="goods_${goods.id}">
							<!-- <li><br> <a href="javascript:void(0);"
								onclick="Compare.add(3852,&#39;女装短外套&#39;,&#39;19&#39;)"
								class="f6">比较</a></li> -->
							<li class="thumb">
								<a href="${ctx}/sku/goods/${goods.id}?category=${category.id}">
									<img src="${goods.image}" alt="女装短外套" height="249" width="184">
								</a></li>
							<li class="goodsName">
								<a href="${ctx}/sku/goods/${goods.id}?category=${category.id}">
									${goods.name}<br>
								</a></li>
							<li>本店售价： <font class="shop">￥${goods.salesPrice / 100}</font> <br></li>
							<li class="action">
								<!-- <a href="javascript:collect(${goods.id});" class="abg f6">收藏该商品</a> --> 
								<a href="javascript:addToCart(${goods.id})"><img src="${ctx}/static/images/bnt_buy_1.gif"></a></li>
						</ul>
					</c:forEach>
				</div>
				
				
				<div class="itemsGrid" style="display:none;">
				    <div class="clearfix goodsBox" style="border:none;">
				    	<c:forEach items="${page.content}" var="goods">
				    		<div class="items-gallery">
					            <div class="pic">
					                <a href="${ctx}/sku/goods/${goods.id}?category=${category.id}">
					                	<img src="${goods.image}" alt="${goods.name}" width="224" height="224"></a>
					                <div class="n_bg" style="bottom: -77px;"></div>
					            </div>
					            <div class="i" style="bottom: -77px;">
					            	<span class="xq"><a href="${ctx}/sku/goods/${goods.id}?category=${category.id}">详情</a></span>
					                <div class="point_brief">
					                	<span class="brief_seve"><em class="save">直降￥${(goods.marketPrice - goods.salesPrice) / 100}</em></span> </div>
					                <div class="ibg">
					                    <p class="name"><a href="${ctx}/sku/goods/${goods.id}?category=${category.id}" title="${goods.name}">${goods.name}</a></p>
					                    <ul class="prices">
					                        <li class="gel-price">
					                            销售价：<em>￥${goods.salesPrice / 100}</em>
					                        </li>
					                    </ul>
					                    <div class="items-btn">
					                        <p>评分</p>
					                        <span class="point"><em style="width:0px;"></em><i>(${goods.star})</i></span>
					                        <a href="javascript:addToCart(${goods.id})" class="f6" title="购买"></a>
					                    </div>
					                </div>
					            </div>
					        </div>
				    	</c:forEach>
				    </div>
				</div>
				
				
				
				
			</div>
			<div class="blank5"></div>
			<div class="fd_pager">
				<tags:pagination page="${page}" paginationSize="10"/>
			</div>
		</div>
		<div class="AreaL">
			<div class="fd30_left_cart leftbox">
				<div class="lt">产品分类</div>
				<c:forEach items="${categories}" var="c">
				
					<c:choose>
						<c:when test="${c.id == category.id}">
							<div class="Cate_item Cate_item_k" id="cat${c.id}">
								<h4>
									<a href="${ctx}/sku/category/${c.id}">${c.name}</a>
								</h4>
								<div class="catTw_Th">
									<c:forEach items="${children}" var="child">
										<a id="catTw${child.id}" href="${ctx}/sku/category/${child.id}" >${child.name}</a>
									</c:forEach>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="Cate_item" id="cat${c.id}">
								<h4>
									<a href="${ctx}/sku/category/${c.id}">${c.name}</a>
								</h4>
								<div class="catTw_Th">
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
			</div>
			
			<input type="hidden" class="i_gcatid" name="cat_id" value="">
			<div class="blank5"></div>
			<div class="leftbox">
				<div class="lt">畅销排行Top10</div>
				<ul class="leftprc">
				</ul>
			</div>
			<div class="clear10"></div>
			
			<c:if test="${not empty visit_history}">
				<div class="leftbox" id="history_div" style="display: block;">
					<div class="lt">浏览历史</div>
					<div class="boxCenterList clearfix" id="history_list">
						<c:forEach items="${visit_history}" var="goods">
							<ul class="clearfix ul_visit_history">
								<li class="goodsimg">
									<a href="${ctx}/sku/goods/${goods.id}" target="_blank">
										<img src="${goods.image}"
										alt="${goods.name}" class="B_blue">
									</a>
								</li>
								<li><a href="${ctx}/sku/goods/${goods.id}"
									target="_blank" title="${goods.name}">${goods.name}</a>
									<br>本店售价： <font class="f1">￥${goods.salesPrice / 100}</font> <br></li>
							</ul>
						</c:forEach>
						<ul id="clear_history">
							<a onclick="clear_history()">[清空]</a>
						</ul>
					</div>
				</div>
			</c:if>
			<div class="clear10"></div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/static/lib/jquery.cookie.js"></script>
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

			$(".items-gallery").hover(function() {
				$(this).addClass("items-gallery_H");
				$(this).find(".i,.n_bg").animate({
					bottom : 0
				}, 400)
			}, function() {
				$(this).removeClass("items-gallery_H");
				$(this).find(".i,.n_bg").animate({
					bottom : -77
				}, 400)

			});
			
			changeShown();
			
			$('#link_display_list').click(function() {changeShown('list')});
			$('#link_display_grid').click(function() {changeShown('grid')});
		})
		
		function changeShown(type) {
			type = type || $.cookie('shownType') || 'list';
			
			if(type == 'list') {
				$('.goodsList').show();
				$('.itemsGrid').hide();
				$('#link_display_list img').attr('src', '${ctx}/static/images/display_mode_list_act.gif');
				$('#link_display_grid img').attr('src', '${ctx}/static/images/display_mode_grid.gif');
			} else {
				$('.goodsList').hide();
				$('.itemsGrid').show();
				$('#link_display_list img').attr('src', '${ctx}/static/images/display_mode_list.gif');
				$('#link_display_grid img').attr('src', '${ctx}/static/images/display_mode_grid_act.gif');
			}
			$.cookie('shownType', type);
		}
	</script>
</body>
</html>