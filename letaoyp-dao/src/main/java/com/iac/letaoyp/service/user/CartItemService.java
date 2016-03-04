package com.iac.letaoyp.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.user.CartItem;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.user.CartItemDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class CartItemService extends BasicService<CartItem,java.lang.Long> {

	@Autowired
	private CartItemDao cartItemDao;
	
	@Override
	public BasicRepository<CartItem,java.lang.Long> getRepository() {
		return cartItemDao;
	}
}
