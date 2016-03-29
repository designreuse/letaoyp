package com.iac.letaoyp.service;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

import com.iac.letaoyp.entity.admin.Account;
import com.iac.letaoyp.entity.admin.AccountRole;
import com.iac.letaoyp.service.admin.AccountRoleService;
import com.iac.letaoyp.service.admin.AccountService;
import com.iac.letaoyp.service.admin.RoleService;

/**
 * 默认AbstractTransactionalJUnit4SpringContextTests 会在执行完毕后 回滚事务
 * 如需要提交事务 请配置 @TransactionConfiguration(defaultRollback=false)
 * @author iacdp
 *
 */
@ContextConfiguration(locations = { "classpath:spring/applicationContext*.xml" })
@TransactionConfiguration(defaultRollback=false)
public class AccountServiceTest extends SpringTransactionalTestCase  {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private AccountRoleService accountRoleService;
	
	private Account testUser;
	private AccountRole ar = new AccountRole();
	
	@Before
	public void init() {
		testUser = new Account();
		testUser.setLoginName("test");
		testUser.setName("Test User");
		testUser.setPlainPassword("123");
	}
	
	@Test
	public void saveUserRoleTest() {
		Account account = accountService.findByLoginName("admin");
		
		account.setPlainPassword("123456");
		accountService.save(account);
	}
}
