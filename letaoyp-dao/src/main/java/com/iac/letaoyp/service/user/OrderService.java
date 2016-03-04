package com.iac.letaoyp.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.user.Order;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.user.OrderDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class OrderService extends BasicService<Order,java.lang.Long> {

	@Autowired
	private OrderDao orderDao;
	
	@Override
	public BasicRepository<Order,java.lang.Long> getRepository() {
		return orderDao;
	}
}
