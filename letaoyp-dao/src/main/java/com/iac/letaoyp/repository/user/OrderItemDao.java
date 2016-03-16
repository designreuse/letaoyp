package com.iac.letaoyp.repository.user;

import java.util.List;

import com.iac.letaoyp.entity.user.OrderItem;
import com.iac.letaoyp.repository.BasicRepository;

public interface OrderItemDao extends BasicRepository<OrderItem,java.lang.Long>{

	List<OrderItem> findByOrderIdAndActive(Long orderId, boolean active);
	

}
