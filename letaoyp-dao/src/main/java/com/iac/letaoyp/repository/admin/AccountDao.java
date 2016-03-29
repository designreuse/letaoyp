package com.iac.letaoyp.repository.admin;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.admin.Account;
import com.iac.letaoyp.repository.BasicRepository;

public interface AccountDao extends BasicRepository<Account, Long> {

	Account findByLoginName(String loginName);

	@Modifying
	@Query("update Account a set a.active=?1 where a.id in (?2)")
	void updateActiveByIdIn(boolean active, Long[] ids);

	
	@Modifying
	@Query("delete Account a where a.id in (?1)")
	void deleteByIdIn(Long[] ids);

}
