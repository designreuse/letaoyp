package com.iac.letaoyp.repository.user;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.user.OrderItem;
import com.iac.letaoyp.repository.BasicRepository;

public interface OrderItemDao extends BasicRepository<OrderItem,java.lang.Long>{

	List<OrderItem> findByOrderIdAndActive(Long orderId, boolean active);
	
	@Modifying
    @Query("update OrderItem a set a.active=?1 where a.id in (?2)")
    void updateActiveByIdIn(boolean active, Long[] ids);


    @Modifying
    @Query("delete OrderItem a where a.id in (?1)")
    void deleteByIdIn(Long[] ids);
}
