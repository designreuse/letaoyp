package com.iac.letaoyp.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.admin.Role;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.admin.RoleDao;
import com.iac.letaoyp.service.BasicService;


@Component
@Transactional
public class RoleService extends BasicService<Role, Long> {

	@Autowired
	private RoleDao roleDao;
	
	@Override
	public BasicRepository<Role, Long> getRepository() {
		return roleDao;
	}
	
	public void updateActiveByIds(boolean active, Long[] ids) {
		roleDao.updateActiveByIdIn(active, ids);
	}

	public void delete(Long[] ids) {
		roleDao.deleteByIdIn(ids);
	}
}
