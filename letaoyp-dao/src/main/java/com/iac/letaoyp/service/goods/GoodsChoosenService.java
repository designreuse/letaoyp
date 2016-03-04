package com.iac.letaoyp.service.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.goods.GoodsChoosen;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.goods.GoodsChoosenDao;
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
}
