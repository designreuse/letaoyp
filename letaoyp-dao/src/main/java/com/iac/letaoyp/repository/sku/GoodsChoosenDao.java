package com.iac.letaoyp.repository.sku;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.sku.GoodsChoosen;
import com.iac.letaoyp.repository.BasicRepository;

public interface GoodsChoosenDao extends BasicRepository<GoodsChoosen,java.lang.Long>{

	List<GoodsChoosen> findByGoodsId(Long goods);

	List<GoodsChoosen> findByIdIn(Long[] choosen);

	@Modifying
    @Query("update GoodsChoosen a set a.active=?1 where a.id in (?2)")
    void updateActiveByIdIn(boolean active, Long[] ids);


    @Modifying
    @Query("delete GoodsChoosen a where a.id in (?1)")
    void deleteByIdIn(Long[] ids);
}
