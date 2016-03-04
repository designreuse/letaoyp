package com.iac.letaoyp.service.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.goods.Brand;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.goods.BrandDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class BrandService extends BasicService<Brand,java.lang.Long> {

	@Autowired
	private BrandDao brandDao;
	
	@Override
	public BasicRepository<Brand,java.lang.Long> getRepository() {
		return brandDao;
	}
}
