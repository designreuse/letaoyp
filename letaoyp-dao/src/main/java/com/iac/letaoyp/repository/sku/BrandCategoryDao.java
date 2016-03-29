package com.iac.letaoyp.repository.sku;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.sku.BrandCategory;
import com.iac.letaoyp.repository.BasicRepository;

public interface BrandCategoryDao extends BasicRepository<BrandCategory,java.lang.Long>{

	List<BrandCategory> findByCategory(Long id);
	
	@Modifying
    @Query("update BrandCategory a set a.active=?1 where a.id in (?2)")
    void updateActiveByIdIn(boolean active, Long[] ids);


    @Modifying
    @Query("delete BrandCategory a where a.id in (?1)")
    void deleteByIdIn(Long[] ids);
	
}
