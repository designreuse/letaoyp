package com.iac.letaoyp.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.admin.AccountRole;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.admin.AccountRoleDao;
import com.iac.letaoyp.service.BasicService;


@Component
@Transactional
public class AccountRoleService extends BasicService<AccountRole, Long> {

	@Autowired
	private AccountRoleDao accountRoleDao;
	
	@Override
	public BasicRepository<AccountRole,java.lang.Long> getRepository() {
		return accountRoleDao;
	}

	public void updateActiveByIds(boolean active, Long[] ids) {
		accountRoleDao.updateActiveByIdIn(active, ids);
	}

	public void delete(Long[] ids) {
		accountRoleDao.deleteByIdIn(ids);
	}
	
}
