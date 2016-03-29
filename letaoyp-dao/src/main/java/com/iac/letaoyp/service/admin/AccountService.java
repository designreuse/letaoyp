package com.iac.letaoyp.service.admin;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.Encodes;

import com.iac.letaoyp.entity.admin.Account;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.admin.AccountDao;
import com.iac.letaoyp.service.BasicService;
import com.iac.letaoyp.service.ServiceException;

@Component
@Transactional
public class AccountService extends BasicService<Account, Long> {

	@Autowired
	private AccountDao accountDao;
	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	private static final int SALT_SIZE = 8;
	
	public Account findByLoginName(String loginName) {
		return accountDao.findByLoginName(loginName);
	}
	
	@Override
	public void save(Account user) {
		if (StringUtils.isNotBlank(user.getPlainPassword())) {
			entryptPassword(user);
		}
		accountDao.save(user);
	}
	
	/**
	 * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
	 */
	private void entryptPassword(Account user) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));

		byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(), salt, HASH_INTERATIONS);
		user.setPassword(Encodes.encodeHex(hashPassword));
	}

	@Override
	public BasicRepository<Account, Long> getRepository() {
		return accountDao;
	}

	public void updateActiveByIds(boolean active, Long[] ids) {
		checkOperationParam(ids);
		
		accountDao.updateActiveByIdIn(active, ids);
	}

	@Override
	public void delete(Long id) {
		if(id == 1L) {
			throw new ServiceException("不允许删除超级管理员账号");
		}
		
		super.delete(id);
	}
	
	public void delete(Long[] ids) {
		checkOperationParam(ids);
		
		accountDao.deleteByIdIn(ids);
	}

	public void checkOperationParam(Long[] ids) {
		for(long t : ids) {
			if (t == 1L) {
				throw new ServiceException("不允许修改超级管理员账号");
			}
		}
	}
}
