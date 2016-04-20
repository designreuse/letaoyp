package com.iac.letaoyp.service.user;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.iac.letaoyp.RollbackTransactionBaseTest;
import com.iac.letaoyp.entity.user.Cart;
import com.iac.letaoyp.entity.user.Member;

public class CartServiceTest extends RollbackTransactionBaseTest {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private CartItemService cartItemService;
	
	@Test
	public void testGetCart() {
		Member m = new Member();
		m.setId(2L);
		Cart cart = cartService.findByMember(m);
		System.out.println(cart.getMember().getEmail());
		
		
		cartItemService.delete(-11l, -2l);
		cartItemService.deleteByCartId(-1L);
	}
}
