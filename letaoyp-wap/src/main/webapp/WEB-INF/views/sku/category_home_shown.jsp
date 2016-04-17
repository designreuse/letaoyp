<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="ipl ipl1">
    <div class="ipl_m">
        <div class="fl">
            <div id="Tr_cs18">
            	<c:forEach items="${leftCategory}" var="category">
	                <a href="${ctx}/sku/category/${category.id}" target="_blank"><img src="${category.logo}" width="151" height="60" border="0"></a>
            	</c:forEach>
            </div>
        </div>
        <div class="fr">
            <div class="fr_l">
                <div id="Tr_cs24">
                    <div class="Tr_cs Tr_cs1">
                        <div class="cxjad_m">
                            <div class="cxjinfo" style="width: 1570px; left: 0px;">
                            	<c:forEach items="${topLevel1}" var="topGoods" begin="0" end="1">
	                            	<div class="cxjitem">
	                                    <a href="${ctx}/sku/goods/${topGoods.goods.id}" target="_blank">
	                                    	<img src="${topGoods.topImage}" width="785" height="368" border="0">
	                                   	</a>
	                                </div>
                            	</c:forEach>
                            </div>
                        </div>
                        <div class="TABLE_Sbg">
                            <ul class="TABLE_S">
                                <li class="cxjli visited"></li>
                                <li class="cxjli"></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fr_r">
                <div id="Tr_cs31">
                	<c:forEach items="${topLevel2}" var="topGoods" begin="0" end="1">
                    	<div class="cxjitem">
                            <a href="${ctx}/sku/goods/${topGoods.goods.id}" target="_blank">
                            	<img src="${topGoods.topImage}" width="242" height="184" border="0">
                            </a>
                        </div>
                   	</c:forEach>
                </div>
            </div>
        </div>
        <div class="clear0"></div>
        <div class="psp">
            <h2><span>${rootCategory.name}</span></h2>
           	<span class="get_cats">
            	<span class="get_cat1">
            		<c:forEach items="${horizontalCategory}" var="category">
            			<a href="${ctx}/sku/category/${category.id}">${category.name}</a>
            		</c:forEach>
                  	
            	</span>
                  	<c:if test="${not empty horizontalCategory}">
            			<a href="${ctx}/sku/category/${rootCategory.id}" class="more">更多&gt;</a>
            		</c:if>
            </span>
            <div class="i_prclist hover goods_cart">
                <div class="cxjad_m">
                    <div class="cxjinfo">
                    	<c:forEach items="${topLevel3}" var="goods" begin="0" end="15">
                    		<div class="cxjitem">
	                            <div class="p">
	                                <a href="${ctx}/sku/goods/${goods.id}" class="aimg">
	                                	<img src="${goods.image}" width="310" height="310" alt="${goods.name}" class="goodsimg">
	                               	</a>
	                            </div>
	                            <div class="i">
	                                <h3><a href="${ctx}/sku/goods/${goods.id}" title="${good.name}">${good.name}</a></h3>
	                                <ul>
	                                    <li class="gel-price">
	                                        <em>￥${goods.salesPrice / 100}</em>
	                                    </li>
	                                    <li class="gel-mktprice">
	                                        <del>￥${goods.marketPrice / 100}</del>
	                                    </li>
	                                    <li class="point_num">已有<i>${goods.comments}</i>人评论</li>
	                                    <li class="addToCart">
	                                        <a href="javascript:addToCart(${goods.id})" title="购买"></a>
	                                    </li>
	                                </ul>
	                                <div class="clear0"></div>
	                            </div>
	                        </div>
                    	</c:forEach>
                    </div>
                </div>
                <div class="clear0"></div>
            </div>
        </div>
        <div class="clear0"></div>
    </div>
</div>
