package com.iac.letaoyp.repository.admin;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.admin.Permission;
import com.iac.letaoyp.repository.BasicRepository;

public interface PermissionDao extends BasicRepository<Permission, Long>{
	public void deleteByMenu(Long menu);
	
	@Modifying
	@Query("update Permission a set a.active=?1 where a.id in (?2)")
	void updateActiveByIdIn(boolean active, Long[] ids);

	@Modifying
	@Query("delete Permission a where a.id in (?1)")
	void deleteByIdIn(Long[] ids);
}
