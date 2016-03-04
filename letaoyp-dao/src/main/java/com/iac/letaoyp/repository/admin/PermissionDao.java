package com.iac.letaoyp.repository.admin;

import com.iac.letaoyp.entity.admin.Permission;
import com.iac.letaoyp.repository.BasicRepository;

public interface PermissionDao extends BasicRepository<Permission, Long>{
	public void deleteByMenu(Long menu);
}
