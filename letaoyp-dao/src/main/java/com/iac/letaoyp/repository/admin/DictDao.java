package com.iac.letaoyp.repository.admin;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.admin.Dict;
import com.iac.letaoyp.repository.BasicRepository;


public interface DictDao extends BasicRepository<Dict,java.lang.Long>{
	
	@Modifying
	@Query("update Dict a set a.active=?1 where a.id in (?2)")
	void updateActiveByIdIn(boolean active, Long[] ids);

	@Modifying
	@Query("delete Dict a where a.id in (?1)")
	void deleteByIdIn(Long[] ids);
}
