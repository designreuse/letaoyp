package com.iac.letaoyp.service;

import com.iac.letaoyp.entity.admin.Account;
import com.iac.letaoyp.entity.admin.AccountRole;
import com.iac.letaoyp.entity.admin.Role;
import com.iac.letaoyp.service.admin.AccountRoleService;
import com.iac.letaoyp.service.admin.AccountService;
import com.iac.letaoyp.service.admin.RoleService;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

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
	
	/**
	 * 1、先save role 然后设置user.setRole 
	 * save user
	 * 然后 查询save role2  set user role 为role2 save user
	 * user对应的role是否会变 
	 */
	@Test
	public void saveUserRoleTest() {
		Account account = new Account();
		account.setName("Many 2 many test");
		account.setLoginName("testMany2Many");
		account.setPlainPassword("123");
		
		Role role = new Role();
		role.setName("test1");
		role.setDescription("测试1");
		roleService.save(role);
		
		Role role2 = new Role();
		role2.setName("test2");
		role2.setDescription("测试2");
		roleService.save(role2);
		
		ar.setAccount(account);
		ar.setRole(role);
		List<AccountRole> ars = new ArrayList<AccountRole>();
		ars.add(ar);
		account.setAccountRoles(ars);
		
		accountService.save(account);
		
		ar.setRole(role2);
		
		Account queryAccount = accountService.get(account.getId());
		queryAccount.setName("updated name");
		queryAccount.setAccountRoles(ars);
		accountService.save(queryAccount);
		
		
		System.out.println("role.id:" + role.getId());
		System.out.println("after update user role.id:" + account.getAccountRoles().get(0).getRole().getId());
		System.out.println("after update query user role.id:" + queryAccount.getAccountRoles().get(0).getRole().getId());
		System.out.println();
		
		// 删除中间表时  得先删除对两端的引用
		queryAccount.getAccountRoles().remove(ar);
		// 因为未显示设置关系 一下语句不需要remove
//		role.getAccountRoles().remove(ar);
		
		accountRoleService.delete(ar.getId());
		
		//清空数据
		roleService.delete(role.getId());
		roleService.delete(role2.getId());
		accountService.delete(queryAccount.getId());
	}
}
