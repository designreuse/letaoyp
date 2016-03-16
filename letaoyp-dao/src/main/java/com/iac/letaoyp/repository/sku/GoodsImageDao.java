package com.iac.letaoyp.repository.sku;

import java.util.List;

import com.iac.letaoyp.entity.sku.GoodsImage;
import com.iac.letaoyp.repository.BasicRepository;

public interface GoodsImageDao extends BasicRepository<GoodsImage,java.lang.Long>{

	List<GoodsImage> findByGoods(Long goods);
	

}
