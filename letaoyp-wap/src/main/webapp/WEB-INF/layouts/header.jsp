<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="header">
	<a name="top"></a>
	<div class="fd_top_ad">
		<a
			style="HEIGHT: 100px; BACKGROUND: url(${ctx}/static/images/topad.jpg) no-repeat center 50%; DISPLAY: block; WIDTH: 100%"
			href=""></a>
	</div>
	<div class="fd_top0">
		<div class="fd_top">
			<div class="fl">
				<c:choose>
					<c:when test="${member != null}">
						<font id="ECS_MEMBERZONE"><div id="append_parent"></div> <font>
							您好，<font class="f4_b">${member.username}</font>, 欢迎您回来！ <a href="${ctx}/user">用户中心</a>
							| <a href="${ctx}/user/logout">退出</a>
						</font> </font>
					</c:when>
					<c:otherwise>
						<font id="ECS_MEMBERZONE">
							<div id="append_parent"></div> 欢迎光临本店
							<a href="${ctx}/user/login">[请登录] <strong></strong></a> 
							<a href="${ctx}/user/register"> [免费注册] </a>
						</font>
					</c:otherwise>
				</c:choose>
				
			</div>
			<div class="fr">
				<a href="#" target="_blank">招商加盟</a>
				<b>0571-87162087</b>
			</div>
			<div class="clear0"></div>
		</div>
	</div>
	
	<div class="fd_top1">
        <div class="fd_top">
            <div class="logo1">
                <a href="#" name="top"><img src="${ctx}/static/images/redegsin/logo.jpg"></a>
            </div>
            <div class="logo_r">
                <div class="clear0"></div>
                <div class="logo3">
                    <div class="cart" id="ECS_CARTINFO">
                        <div id="ECS_CARTINFO" class="fd30_slideTog">
                            <h4><a href="${ctx}/sku/order/cart">购物车(<span id="cartCount">${fn:length(sessionScope._letaoyp_u_.cart.items)}</span>)</a></h4>
                            <div id="cart_list" class="slideTog_info">
                                <div class="noprc">您购物车暂商品，赶紧选购吧！</div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--
                <div class="logo2 search">
                    <div id="fd_ffff">
                        <form id="searchForm" name="searchForm" method="get" action="http://www.youchengds.com/search.php" class="SearchBar_11_00" onsubmit="return checkSearchForm()">
                            <div class="search_label">
                                <select name="category" id="category" class="B_input" style="display:none">
                                    <option value="0">所有分类</option>
                                    <option value="1">韩风女装</option>
                                    <option value="12">&nbsp;&nbsp;&nbsp;&nbsp;套装/卫衣</option>
                                    <option value="13">&nbsp;&nbsp;&nbsp;&nbsp;T恤</option>
                                    <option value="14">&nbsp;&nbsp;&nbsp;&nbsp;衬衫/雪纺衫</option>
                                    <option value="15">&nbsp;&nbsp;&nbsp;&nbsp;打底/针织衫</option>
                                    <option value="16">&nbsp;&nbsp;&nbsp;&nbsp;外套/风衣</option>
                                    <option value="17">&nbsp;&nbsp;&nbsp;&nbsp;长裤</option>
                                    <option value="18">&nbsp;&nbsp;&nbsp;&nbsp;连衣裙</option>
                                    <option value="19">&nbsp;&nbsp;&nbsp;&nbsp;短裤/打底裤</option>
                                    <option value="40">&nbsp;&nbsp;&nbsp;&nbsp;牛仔系列</option>
                                    <option value="2">都市男装</option>
                                    <option value="20">&nbsp;&nbsp;&nbsp;&nbsp;T恤</option>
                                    <option value="21">&nbsp;&nbsp;&nbsp;&nbsp;衬衫</option>
                                    <option value="22">&nbsp;&nbsp;&nbsp;&nbsp;西装/外套</option>
                                    <option value="23">&nbsp;&nbsp;&nbsp;&nbsp;毛衣/开衫</option>
                                    <option value="24">&nbsp;&nbsp;&nbsp;&nbsp;长裤</option>
                                    <option value="25">&nbsp;&nbsp;&nbsp;&nbsp;短裤</option>
                                    <option value="26">&nbsp;&nbsp;&nbsp;&nbsp;卫衣/套装</option>
                                    <option value="4">童装/亲子装</option>
                                    <option value="44">&nbsp;&nbsp;&nbsp;&nbsp;衬衫/T恤</option>
                                    <option value="42">&nbsp;&nbsp;&nbsp;&nbsp;外套/风衣</option>
                                    <option value="32">&nbsp;&nbsp;&nbsp;&nbsp;裤装</option>
                                    <option value="43">&nbsp;&nbsp;&nbsp;&nbsp;针织衫/毛衣</option>
                                    <option value="31">&nbsp;&nbsp;&nbsp;&nbsp;可爱裙装</option>
                                    <option value="29">&nbsp;&nbsp;&nbsp;&nbsp;套装</option>
                                    <option value="30">&nbsp;&nbsp;&nbsp;&nbsp;亲子装</option>
                                    <option value="5">鞋包系列</option>
                                    <option value="35">&nbsp;&nbsp;&nbsp;&nbsp;时尚潮鞋</option>
                                    <option value="33">&nbsp;&nbsp;&nbsp;&nbsp;潮流女包</option>
                                    <option value="3">情侣装</option>
                                    <option value="27">&nbsp;&nbsp;&nbsp;&nbsp;T恤/衬衫</option>
                                    <option value="28">&nbsp;&nbsp;&nbsp;&nbsp;裤装</option>
                                    <option value="7">VIP特供商品</option>
                                    <option value="10">&nbsp;&nbsp;&nbsp;&nbsp;三彩系列</option>
                                    <option value="11">&nbsp;&nbsp;&nbsp;&nbsp;贝拉系列</option>
                                    <option value="41">招商加盟</option>
                                </select>
                                <input name="keywords" type="text" id="keyword" value="" class="inputstyle keywords">
                                <input name="imageField" type="submit" value="搜索" class="btn-search" style="cursor:pointer;">
                            </div>
                        </form>
                        <div class="hot-keywords"> <span>热门搜索:</span>
                            <a href="http://www.hzltyp.com/search.php?keywords=%E4%B8%89%E5%BD%A9">三彩</a> 
                            <a href="http://www.hzltyp.com/search.php?keywords=%E8%B4%9D%E6%8B%89">贝拉</a> 
                            <a href="http://www.hzltyp.com/search.php?keywords=%E5%A5%B3%E8%A3%85">女装</a> 
                            <a href="http://www.hzltyp.com/search.php?keywords=%E7%94%B7%E8%A3%85">男装</a> 
                            <a href="http://www.hzltyp.com/search.php?keywords=%E7%AB%A5%E8%A3%85">童装</a> 
                            <a href="http://www.hzltyp.com/search.php?keywords=%E6%83%85%E4%BE%A3%E8%A3%85">情侣装</a> 
                            <a href="http://www.hzltyp.com/search.php?keywords=%E5%8C%85">包</a> 
                            <a href="http://www.hzltyp.com/search.php?keywords=%E9%9E%8B%E5%AD%90">鞋子</a> 
                       	</div>
                    </div>
                </div>
                -->
            </div>
            <div class="clear0"></div>
        </div>
    </div>
    
    <div class="fd_top2">
        <div class="navs fd_top">
            <div class="navs_l hover">
                <div class="fd30_cat">
                    <div class="t">全部商品分类 <span> </span></div>
                    <div class="classmenu">
                        <ul>
                            <!-- <li class="cat_lv1 hover post_cat1 li0">
                                <h4><a href="http://www.hzltyp.com/category.php?id=1">韩风女装</a> </h4>
                                <p>
                                    <a href="http://www.hzltyp.com/category.php?id=12">套装/卫衣</a>
                                    <a href="http://www.hzltyp.com/category.php?id=13">T恤</a>
                                    <a href="http://www.hzltyp.com/category.php?id=14">衬衫/雪纺衫</a>
                                    <a href="http://www.hzltyp.com/category.php?id=15">打底/针织衫</a>
                                    <a href="http://www.hzltyp.com/category.php?id=16">外套/风衣</a>
                                    <a href="http://www.hzltyp.com/category.php?id=17">长裤</a>
                                    <a href="http://www.hzltyp.com/category.php?id=18">连衣裙</a>
                                    <a href="http://www.hzltyp.com/category.php?id=19">短裤/打底裤</a>
                                    <a href="http://www.hzltyp.com/category.php?id=40">牛仔系列</a>
                                </p>
                            </li>
                            <li class="cat_lv1 hover post_cat41 li6">
                                <h4><a href="http://www.hzltyp.com/category.php?id=41">招商加盟</a> </h4>
                                <p>
                                </p>
                                <div class="cat_p" style="display:none">
                                    <div class="clear10"></div>
                                    <div class="cat_brand">
                                        <h2>推荐品牌</h2>
                                    </div>
                                </div>
                            </li> -->
                        </ul>
                        <div class="clear0"></div>
                    </div>
                </div>
            </div>
            <div class="navs_m">
                <ul class="MenuList">
                   <!--  <li class="li1"><a href="http://www.hzltyp.com/index.php" class="cur">首页</a></li>
                    <li><a href="http://www.hzltyp.com/category.php?id=1" target="_blank">韩风女装</a></li>
                    <li><a href="http://www.hzltyp.com/category.php?id=2" target="_blank">都市男装</a></li>
                    <li><a href="http://www.hzltyp.com/category.php?id=3" target="_blank">情侣装</a></li>
                    <li><a href="http://www.hzltyp.com/category.php?id=4" target="_blank">童装/亲子装</a></li>
                    <li><a href="http://www.hzltyp.com/category.php?id=5" target="_blank">鞋包系列</a></li>
                    <li><a href="http://www.hzltyp.com/category.php?id=7" target="_blank">VIP特供商品</a></li>
                    <li><a href="http://pan.baidu.com/s/1i3XhI9v" target="_blank">数据包下载</a></li> -->
                </ul>
            </div>
            <div class="clear0"></div>
        </div>
    </div>
</div>

<div class="clear0"></div>

<script type="text/javascript" src="${ctx}/static/js/app.js"></script>
<script>
	var topHomeCategory;

	function requestCategory() {
		ajax({
			url: '${ctx}/sku/category/listTop2Level',
			type: 'GET',
			success: function(data) {
				var list = data.data;
				
				var obj = {top1:[], top2:[]};
				var index = {};
				var t = 0;
				for(var i in list) {
					var category = list[i];
					if(category.level == 1 && obj.top1.length <= 6) {
						obj.top1.push(category);
						index[category.id] = t++;
					}
				}
				
				for(var i in list) {
					var category = list[i];
					
					if(category.level == 2) {
						var j = index[category.parent];
						
						if(typeof j != 'undifined') {	// top2 为top1子节点 top1.top必须为true   j可能为0  不能用 if(j) 作判定条件
							if(!obj.top2[j]) {
								obj.top2[j] = [];
							}
							if(obj.top2[j].length <= 6)
								obj.top2[j].push(category);
						}
					}
				}
				topHomeCategory = obj.top1;
				appendItem(obj);
			}
		})
	}
	
	function appendItem(obj) {
		var $html = $('.classmenu ul'), $menu = $('.MenuList');
		$menu.append('<li class="li1"><a href="${ctx}/" class="cur">首页</a></li>');
		
		for(var i in obj.top1) {
			var parent = obj.top1[i];
			var chirldren = obj.top2[i];
			
			$li = $( 
			'<li class="cat_lv1 hover post_cat1 li0">' +
			'    <h4><a href="${ctx}/sku/category/' + parent.id + '">' + 
			'			<img src="' + parent.icon + '"/>' 
			+ parent.name + '</a> </h4>' +
			'    <p>' +
			'    </p>' +
			'</li>');
			
			for(var j in chirldren) {
				$li.find('p').append('        <a href="${ctx}/sku/category/' + chirldren[j].id + '">' + chirldren[j].name + '</a>');
			}
			$html.append($li);
			$menu.append('<li class="li1"><a href="${ctx}/sku/category/' + parent.id + '">' + parent.name + '</a></li>');
		}
		
		$html.append(
				'<li class="cat_lv1 hover post_cat41 li6">' +
				'    <h4><a href="http://www.hzltyp.com/category.php?id=41">招商加盟</a> </h4>' +
				'    <p>' +
				'    </p>' +
				'    <div class="cat_p" style="display:none">' +
				'        <div class="clear10"></div>' +
				'        <div class="cat_brand">' +
				'            <h2>推荐品牌</h2>' +
				'        </div>' +
				'    </div>' +
				'</li>'
		);
		$menu.append('<li><a href="http://pan.baidu.com/s/1i3XhI9v" target="_blank">数据包下载</a></li>');
	}

	$(function() {
		requestCategory();
		
		$(".hover").hover(function() {
			$(this).toggleClass('hover_h');
		});

		$(window).scroll(function() {
			if ($(window).scrollTop() > 250) {

				$('.fd_top2').addClass('fd_top2_v')
			} else {
				$('.fd_top2').removeClass('fd_top2_v');
			}
		});
	})
</script>