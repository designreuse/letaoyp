package com.iac.letaoyp.repository.user;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.user.ShippingAddress;
import com.iac.letaoyp.repository.BasicRepository;

public interface ShippingAddressDao extends BasicRepository<ShippingAddress,java.lang.Long>{
	
	@Modifying
    @Query("update ShippingAddress a set a.active=?1 where a.id in (?2)")
    void updateActiveByIdIn(boolean active, Long[] ids);


    @Modifying
    @Query("delete ShippingAddress a where a.id in (?1)")
    void deleteByIdIn(Long[] ids);
}
