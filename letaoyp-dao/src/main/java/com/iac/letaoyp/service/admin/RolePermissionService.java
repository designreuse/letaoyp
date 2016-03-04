package com.iac.letaoyp.service.admin;

import com.iac.letaoyp.entity.admin.RolePermission;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.admin.RolePermissionDao;
import com.iac.letaoyp.service.BasicService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


@Component
@Transactional
public class RolePermissionService extends BasicService<RolePermission, Long> {

	@Autowired
	private RolePermissionDao rolePermissionDao;
	
	@Override
	public BasicRepository<RolePermission, Long> getRepository() {
		return rolePermissionDao;
	}
}
