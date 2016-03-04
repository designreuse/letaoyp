package com.iac.letaoyp.service.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.goods.GoodsChoosenTemplate;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.goods.GoodsChoosenTemplateDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class GoodsChoosenTemplateService extends BasicService<GoodsChoosenTemplate,java.lang.Long> {

	@Autowired
	private GoodsChoosenTemplateDao goodsChoosenTemplateDao;
	
	@Override
	public BasicRepository<GoodsChoosenTemplate,java.lang.Long> getRepository() {
		return goodsChoosenTemplateDao;
	}
}
