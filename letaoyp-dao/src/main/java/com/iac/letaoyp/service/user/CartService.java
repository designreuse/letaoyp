package com.iac.letaoyp.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.user.Cart;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.user.CartDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class CartService extends BasicService<Cart,java.lang.Long> {

	@Autowired
	private CartDao cartDao;
	
	@Override
	public BasicRepository<Cart,java.lang.Long> getRepository() {
		return cartDao;
	}
}
