package com.iac.letaoyp.repository.user;

import java.util.Date;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.user.Order;
import com.iac.letaoyp.repository.BasicRepository;

public interface OrderDao extends BasicRepository<Order,java.lang.Long>{
	
	public Order findByTradeNo(java.lang.String tradeNo);
	
	public Long deleteByTradeNo(java.lang.String tradeNo);

	public Long countByMemberIdAndCreatedGreaterThan(Long member, Date date);

	@Modifying
    @Query("update Order a set a.active=?1 where a.id in (?2)")
    void updateActiveByIdIn(boolean active, Long[] ids);


    @Modifying
    @Query("delete Order a where a.id in (?1)")
    void deleteByIdIn(Long[] ids);
}
