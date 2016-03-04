package com.iac.letaoyp.service.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.goods.Goods;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.goods.GoodsDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class GoodsService extends BasicService<Goods,java.lang.Long> {

	@Autowired
	private GoodsDao goodsDao;
	
	@Override
	public BasicRepository<Goods,java.lang.Long> getRepository() {
		return goodsDao;
	}
}
