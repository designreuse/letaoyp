package com.iac.letaoyp.repository.sku;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.sku.GoodsImage;
import com.iac.letaoyp.repository.BasicRepository;

public interface GoodsImageDao extends BasicRepository<GoodsImage,java.lang.Long>{

	List<GoodsImage> findByGoods(Long goods);
	
	@Modifying
    @Query("update GoodsImage a set a.active = ?1 where a.id in (?2)")
    void updateActiveByIdIn(boolean active, Long[] ids);

    @Modifying
    @Query("delete GoodsImage a where a.id in (?1)")
    void deleteByIdIn(Long[] ids);

    @Modifying
    @Query("update GoodsImage a set a.active = ?1 where a.goods in (?2)")
	void updateActiveByGoodsIn(boolean active, Long[] goodsIds);

	List<GoodsImage> findByGoodsIn(Long[] goodsIds);

	void deleteByGoodsIn(Long[] ids);
}
