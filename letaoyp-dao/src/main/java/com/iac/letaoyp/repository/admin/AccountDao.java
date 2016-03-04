package com.iac.letaoyp.repository.admin;

import com.iac.letaoyp.entity.admin.Account;
import com.iac.letaoyp.repository.BasicRepository;

public interface AccountDao extends BasicRepository<Account, Long> {

	Account findByLoginName(String loginName);

}
