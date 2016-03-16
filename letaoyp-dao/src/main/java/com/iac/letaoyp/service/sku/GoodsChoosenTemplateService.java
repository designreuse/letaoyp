package com.iac.letaoyp.service.sku;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.sku.GoodsChoosenTemplate;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.sku.GoodsChoosenTemplateDao;
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
