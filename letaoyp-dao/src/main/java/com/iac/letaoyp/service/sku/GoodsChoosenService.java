package com.iac.letaoyp.service.sku;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.sku.GoodsChoosen;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.sku.GoodsChoosenDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class GoodsChoosenService extends BasicService<GoodsChoosen,java.lang.Long> {

	@Autowired
	private GoodsChoosenDao goodsChoosenDao;
	
	@Override
	public BasicRepository<GoodsChoosen,java.lang.Long> getRepository() {
		return goodsChoosenDao;
	}

	public List<GoodsChoosen> findByGoodsId(Long goods) {
		return goodsChoosenDao.findByGoodsId(goods);
	}
}
