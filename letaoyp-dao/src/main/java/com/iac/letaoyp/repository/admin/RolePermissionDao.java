package com.iac.letaoyp.repository.admin;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.admin.RolePermission;
import com.iac.letaoyp.repository.BasicRepository;


public interface RolePermissionDao extends BasicRepository<RolePermission, Long> {
	@Modifying
	@Query("update RolePermission a set a.active=?1 where a.id in (?2)")
	void updateActiveByIdIn(boolean active, Long[] ids);

	@Modifying
	@Query("delete RolePermission a where a.id in (?1)")
	void deleteByIdIn(Long[] ids);
}
