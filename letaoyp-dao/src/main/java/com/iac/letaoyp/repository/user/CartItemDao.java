package com.iac.letaoyp.repository.user;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.user.CartItem;
import com.iac.letaoyp.repository.BasicRepository;

public interface CartItemDao extends BasicRepository<CartItem,java.lang.Long>{

	List<CartItem> findByCartId(Long cart);
	
	@Modifying
    @Query("update CartItem a set a.active=?1 where a.id in (?2)")
    void updateActiveByIdIn(boolean active, Long[] ids);

    @Modifying
    @Query("delete CartItem a where a.id in (?1)")
    void deleteByIdIn(Long[] ids);

    @Modifying
    @Query("delete CartItem a where a.cart.id = ?1")
	void deleteByCartId(Long cartId);

    @Modifying
    @Query("delete CartItem a where a.cart.id = ?1 and a.id = ?2")
	void deleteByCartIdAndId(Long cartId, Long id);
}
