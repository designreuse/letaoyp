package com.iac.letaoyp.repository.user;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.user.Cart;
import com.iac.letaoyp.repository.BasicRepository;

public interface CartDao extends BasicRepository<Cart,java.lang.Long>{

	Cart findByMemberId(Long id);
	
	@Modifying
    @Query("update Cart a set a.active=?1 where a.id in (?2)")
    void updateActiveByIdIn(boolean active, Long[] ids);


    @Modifying
    @Query("delete Cart a where a.id in (?1)")
    void deleteByIdIn(Long[] ids);
}
