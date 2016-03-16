package com.iac.letaoyp.repository.sku;

import java.util.List;

import com.iac.letaoyp.entity.sku.GoodsChoosen;
import com.iac.letaoyp.repository.BasicRepository;

public interface GoodsChoosenDao extends BasicRepository<GoodsChoosen,java.lang.Long>{

	List<GoodsChoosen> findByGoodsId(Long goods);

	List<GoodsChoosen> findByIdIn(Long[] choosen);

}
