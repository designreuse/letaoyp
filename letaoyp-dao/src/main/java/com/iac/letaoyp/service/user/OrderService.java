package com.iac.letaoyp.service.user;

import java.util.Date;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.user.Cart;
import com.iac.letaoyp.entity.user.CartItem;
import com.iac.letaoyp.entity.user.Member;
import com.iac.letaoyp.entity.user.Order;
import com.iac.letaoyp.entity.user.OrderItem;
import com.iac.letaoyp.entity.user.ShippingAddress;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.user.CartDao;
import com.iac.letaoyp.repository.user.CartItemDao;
import com.iac.letaoyp.repository.user.OrderDao;
import com.iac.letaoyp.repository.user.OrderItemDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class OrderService extends BasicService<Order,java.lang.Long> {

	@Autowired
	private OrderDao orderDao;
	@Autowired
	private OrderItemDao orderItemDao;
	@Autowired
	private CartDao cartDao;
	@Autowired
	private CartItemDao cartItemDao;
	private AtomicLong sequence = new AtomicLong(1000000);
	
	@Override
	public BasicRepository<Order,java.lang.Long> getRepository() {
		return orderDao;
	}
	
	private String generateTradeNo() {
		return System.nanoTime() + "" + sequence.getAndIncrement();
	}

	public Order generateFromCart(Member member, ShippingAddress shippingAddress) {
		Cart cart = cartDao.findByMemberId(member.getId());
		
		List<CartItem> items = cartItemDao.findByCartId(cart.getId());
		
		long amount = 0L;
		for(CartItem item : items) {
			amount += item.getPrice() * item.getQuantity();
		}
		Order order = create(member, amount, 0, 0, shippingAddress);
		
		for(CartItem item : items) {
			OrderItem orderItem = new OrderItem();
			orderItem.setName(item.getGoods().getName());
			orderItem.setPrice(item.getPrice());
			orderItem.setQuantity(item.getQuantity());
			orderItem.setThumbnail(item.getGoods().getImage());
			orderItem.setWeight(item.getGoods().getWeight());
			orderItem.setOrder(order);
			orderItem.setGoods(item.getGoods());
			orderItemDao.save(orderItem);
		}
		cartItemDao.delete(items);
		return order;
	}
	
	public Order create(Member member, long amount, long freight, long tax, ShippingAddress shippingAddress) {
		Order order = new Order();
		order.setAddress(shippingAddress.getAddress());
		order.setConsignee(StringUtils.defaultIfBlank(shippingAddress.getReceiver(), member.getNick()));
		
		order.setAmount(amount);
		order.setFreight(freight);
		order.setTax(tax);
		order.setFee(amount + freight + tax);
		order.setStatus(Order.Status.START);
		order.setMobile(StringUtils.defaultIfBlank(shippingAddress.getMobile(), member.getMobile()));
		order.setTradeNo(generateTradeNo());
		order.setMember(member);
		order.setOffsetAmount(0L);
		
		orderDao.save(order);
		return order;
	}

	public Long countByMemberIdAndCreatedGreaterThan(Long member, Date date) {
		return orderDao.countByMemberIdAndCreatedGreaterThan(member, date);
	}
}
