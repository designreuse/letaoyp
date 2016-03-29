package com.iac.letaoyp.service.sku;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.sku.BrandCategory;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.sku.BrandCategoryDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class BrandCategoryService extends BasicService<BrandCategory,java.lang.Long> {

	@Autowired
	private BrandCategoryDao brandCategoryDao;
	
	@Override
	public BasicRepository<BrandCategory,java.lang.Long> getRepository() {
		return brandCategoryDao;
	}

	public List<BrandCategory> findByCategory(Long id) {
		return brandCategoryDao.findByCategory(id);
	}
	
	public void updateActiveByIds(boolean active, Long[] ids) {
		brandCategoryDao.updateActiveByIdIn(active, ids);
	}

	public void delete(Long[] ids) {
		brandCategoryDao.deleteByIdIn(ids);
	}
}
