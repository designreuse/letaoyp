package com.iac.letaoyp.repository.sku;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.sku.Brand;
import com.iac.letaoyp.repository.BasicRepository;


public interface BrandDao extends BasicRepository<Brand,java.lang.Long>{
	
	@Modifying
    @Query("update Brand a set a.active=?1 where a.id in (?2)")
    void updateActiveByIdIn(boolean active, Long[] ids);


    @Modifying
    @Query("delete Brand a where a.id in (?1)")
    void deleteByIdIn(Long[] ids);
}
