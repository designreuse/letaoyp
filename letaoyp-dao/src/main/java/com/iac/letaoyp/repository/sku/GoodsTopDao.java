package com.iac.letaoyp.repository.sku;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.sku.GoodsTop;
import com.iac.letaoyp.repository.BasicRepository;

public interface GoodsTopDao extends BasicRepository<GoodsTop,java.lang.Long>{

	List<GoodsTop> findByCategoryAndActiveOrderByIdDesc(Long category, boolean active);

	@Modifying
    @Query("update GoodsTop a set a.active=?1 where a.id in (?2)")
    void updateActiveByIdIn(boolean active, Long[] ids);

    @Modifying
    @Query("delete GoodsTop a where a.id in (?1)")
    void deleteByIdIn(Long[] ids);

    @Modifying
    @Query("update GoodsTop a set a.active = ?1 where a.goods.id in (?2)")
	void updateActiveByGoodsIdIn(boolean active, Long[] goodsIds);

    @Modifying
    @Query("delete from GoodsTop a where a.goods.id in (?1)")
	void deleteByGoodsIdIn(Long[] goodsIds);
}
