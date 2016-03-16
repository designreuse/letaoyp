package com.iac.letaoyp.repository.user;

import java.util.List;

import com.iac.letaoyp.entity.user.CartItem;
import com.iac.letaoyp.repository.BasicRepository;

public interface CartItemDao extends BasicRepository<CartItem,java.lang.Long>{

	List<CartItem> findByCartId(Long cart);

}
