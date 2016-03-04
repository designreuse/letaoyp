package com.iac.letaoyp.service.admin;

import com.iac.letaoyp.entity.admin.Permission;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.admin.PermissionDao;
import com.iac.letaoyp.service.BasicService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional
public class PermissionService extends BasicService<Permission,java.lang.Long> {

	@Autowired
	private PermissionDao permissionDao;
	
	@Override
	public BasicRepository<Permission,java.lang.Long> getRepository() {
		return permissionDao;
	}
}
