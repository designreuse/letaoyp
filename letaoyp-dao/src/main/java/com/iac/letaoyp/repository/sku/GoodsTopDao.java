package com.iac.letaoyp.repository.sku;

import java.util.List;

import com.iac.letaoyp.entity.sku.GoodsTop;
import com.iac.letaoyp.repository.BasicRepository;

public interface GoodsTopDao extends BasicRepository<GoodsTop,java.lang.Long>{

	List<GoodsTop> findByCategoryIdAndActive(Long categoryId, boolean active);

}
