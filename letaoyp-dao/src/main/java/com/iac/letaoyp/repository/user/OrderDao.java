package com.iac.letaoyp.repository.user;

import java.util.Date;

import com.iac.letaoyp.entity.user.Order;
import com.iac.letaoyp.repository.BasicRepository;

public interface OrderDao extends BasicRepository<Order,java.lang.Long>{
	
	public Order findByTradeNo(java.lang.String tradeNo);
	
	public Long deleteByTradeNo(java.lang.String tradeNo);

	public Long countByMemberIdAndCreatedGreaterThan(Long member, Date date);

}
