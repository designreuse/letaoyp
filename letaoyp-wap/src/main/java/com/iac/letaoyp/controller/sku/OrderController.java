package com.iac.letaoyp.controller.sku;

import java.util.List;

import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iac.letaoyp.biz.web.AjaxResult;
import com.iac.letaoyp.controller.AbstractController;
import com.iac.letaoyp.entity.user.Cart;
import com.iac.letaoyp.entity.user.CartItem;
import com.iac.letaoyp.entity.user.Member;
import com.iac.letaoyp.entity.user.Order;
import com.iac.letaoyp.entity.user.OrderItem;
import com.iac.letaoyp.entity.user.ShippingAddress;
import com.iac.letaoyp.security.SessionOption;
import com.iac.letaoyp.service.sku.GoodsService;
import com.iac.letaoyp.service.user.CartItemService;
import com.iac.letaoyp.service.user.CartService;
import com.iac.letaoyp.service.user.OrderItemService;
import com.iac.letaoyp.service.user.OrderService;
import com.iac.letaoyp.util.SessionUtils;

@Controller
@RequestMapping("sku/order")
@SessionOption
public class OrderController extends AbstractController {

	@Autowired
	private GoodsService goodsService;
	@Autowired
	private CartService cartService;
	@Autowired
	private CartItemService cartItemService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderItemService orderItemService;
	@Autowired
	private SessionUtils sessionUtils;
	
	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String cart(Model model) {
		Member member = this.getCurrentUser();
		Cart cart = cartService.findByMember(member);
		
		if(cart != null) {
			List<CartItem> items = cartItemService.findByCartId(cart.getId());
			model.addAttribute("items", items);
		}
		return "sku/order/cart";
	}
	
	@RequestMapping(value = "cart", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult addToCart(@RequestParam("goods") Long goods, 
			@RequestParam(value="choosen", required=false) Long[] choosen,
			@RequestParam("count")int count) {
		Member member = this.getCurrentUser();
		String predicate = goodsService.predicateCheck(goods, choosen);
		
		if(StringUtils.isNotBlank(predicate)) 
			return AjaxResult.fail(predicate);
		
		CartItem ci = cartService.addCart(member, goods, choosen, count);
		sessionUtils.addSessionCart(ci);
		return AjaxResult.succeed();
	}
	
	@RequestMapping(value = "cart/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public AjaxResult deleteCart(@PathVariable Long id) {
		cartItemService.delete(sessionUtils.getSessionPrincipal().getCart().getId(), id);
		sessionUtils.clearSessionCart(id);
		return AjaxResult.succeed();
	}
	
	@RequestMapping(value = "cart", method = RequestMethod.DELETE)
	@ResponseBody
	public AjaxResult deleteCart() {
		cartItemService.deleteByCartId(sessionUtils.getSessionPrincipal().getCart().getId());
		sessionUtils.clearSessionCart(null);
		return AjaxResult.succeed();
	}

	
	/**
	 * 购物车点击结算 write订单
	 * @return
	 */
	@RequestMapping(value = "from/cart", method = RequestMethod.GET)
	public String orderFromCart(Model model) {
		Member member = this.getCurrentUser();
		Cart cart = cartService.findByMember(member);
		
		if(cart != null) {
			List<CartItem> items = cartItemService.findByCartId(cart.getId());
			model.addAttribute("items", items);
		}
		
		return "sku/order/order_cart";
	}
	
	/**
	 * 购物车订单结算 生成订单
	 * @return
	 */
	@RequestMapping(value = "from/cart", method = RequestMethod.POST)
	public String orderFromCart(@Valid ShippingAddress shippingAddress) {
		Member member = this.getCurrentUser();
		
		Order order = orderService.generateFromCart(member, shippingAddress);
		sessionUtils.clearSessionCart(null);
		
		return "redirect:/sku/order/confirm/" + order.getId();
	}
	
	@RequestMapping(value = "consignee", method = RequestMethod.GET)
	public String consigneeForm() {
		return "sku/order/order_confirm_consignee";
	}
	
	@RequestMapping(value = "consignee", method = RequestMethod.POST)
	public String consignee(@Valid ShippingAddress address) {
		// save shippingAddress
		
		return null;
	}
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value = "confirm/{order}", method = RequestMethod.GET)
	public String confirmForm(@PathVariable("order") Long orderId, Model model) {
		Member member = this.getCurrentUser();
		Order order = orderService.get(orderId);
		if(order == null || order.getMember().getId().longValue() != member.getId().longValue()
				|| !order.getActive()) {
			return "error/404";
		}
		
		List<OrderItem> items = orderItemService.findByOrderIdAndActive(orderId, true);
		model.addAttribute("order", order);
		model.addAttribute("items", items);
		return "sku/order/order_confirm";
	}
	
	@RequestMapping(value = "confirm", method = RequestMethod.POST)
	public String confirm() {
		return null;
	}
}
