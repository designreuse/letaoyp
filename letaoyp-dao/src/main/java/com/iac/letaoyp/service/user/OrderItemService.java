package com.iac.letaoyp.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.user.OrderItem;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.user.OrderItemDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class OrderItemService extends BasicService<OrderItem,java.lang.Long> {

	@Autowired
	private OrderItemDao orderItemDao;
	
	@Override
	public BasicRepository<OrderItem,java.lang.Long> getRepository() {
		return orderItemDao;
	}

	public List<OrderItem> findByOrderIdAndActive(Long orderId, boolean active) {
		return orderItemDao.findByOrderIdAndActive(orderId, active);
	}
}
