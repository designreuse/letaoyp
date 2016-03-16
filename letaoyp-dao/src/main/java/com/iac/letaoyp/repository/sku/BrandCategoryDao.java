package com.iac.letaoyp.repository.sku;

import java.util.List;

import com.iac.letaoyp.entity.sku.BrandCategory;
import com.iac.letaoyp.repository.BasicRepository;

public interface BrandCategoryDao extends BasicRepository<BrandCategory,java.lang.Long>{

	List<BrandCategory> findByCategory(Long id);
}
