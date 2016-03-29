package com.iac.letaoyp.service.sku;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.sku.Brand;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.sku.BrandDao;
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
	
	public void updateActiveByIds(boolean active, Long[] ids) {
		brandDao.updateActiveByIdIn(active, ids);
	}

	public void delete(Long[] ids) {
		brandDao.deleteByIdIn(ids);
	}
}
