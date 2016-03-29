package com.iac.letaoyp.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.admin.RolePermission;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.admin.RolePermissionDao;
import com.iac.letaoyp.service.BasicService;


@Component
@Transactional
public class RolePermissionService extends BasicService<RolePermission, Long> {

	@Autowired
	private RolePermissionDao rolePermissionDao;
	
	@Override
	public BasicRepository<RolePermission, Long> getRepository() {
		return rolePermissionDao;
	}
	
	public void updateActiveByIds(boolean active, Long[] ids) {
		rolePermissionDao.updateActiveByIdIn(active, ids);
	}

	public void delete(Long[] ids) {
		rolePermissionDao.deleteByIdIn(ids);
	}
}
