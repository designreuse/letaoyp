package com.iac.letaoyp.service.sku;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.sku.GoodsImage;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.sku.GoodsImageDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class GoodsImageService extends BasicService<GoodsImage,java.lang.Long> {

	@Autowired
	private GoodsImageDao goodsImageDao;
	
	@Override
	public BasicRepository<GoodsImage,java.lang.Long> getRepository() {
		return goodsImageDao;
	}

	public List<GoodsImage> findByGoods(Long goods) {
		return goodsImageDao.findByGoods(goods);
	}
}
