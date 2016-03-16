package com.iac.letaoyp.service.user;

import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.DateUtil;
import org.springside.modules.utils.Encodes;

import com.iac.letaoyp.entity.user.Member;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.user.MemberDao;
import com.iac.letaoyp.service.BasicService;
import com.iac.letaoyp.service.ServiceException;

@Component
@Transactional
public class MemberService extends BasicService<Member,java.lang.Long> {
	
	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	private static final int SALT_SIZE = 8;

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public BasicRepository<Member,java.lang.Long> getRepository() {
		return memberDao;
	}

	public Member findByMobile(String phone) {
		return memberDao.findByMobile(phone);
	}

	public Member getByUsername(String username) {
		return memberDao.findByUsername(username);
	}

	public void register(Member user) {
		entryptPassword(user);
		memberDao.save(user);
	}
	
	public void update(Member user) {
		if (StringUtils.isNotBlank(user.getPlainPassword())) {
			entryptPassword(user);
		}
		memberDao.save(user);
	}
	
	/**
	 * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
	 */
	private void entryptPassword(Member user) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));

		user.setPassword(encryptPassword(user.getPlainPassword(), user.getSalt()));
	}
	
	private String encryptPassword(String password, String salt) {
		return Encodes.encodeHex(Digests.sha1(password.getBytes(), Encodes.decodeHex(salt), HASH_INTERATIONS));
	}

	public Member login(String username, String password, String captchas) throws ServiceException {
		Member user = memberDao.findByUsername(username);
		if(user == null) 
			throw new ServiceException("用户名或者密码错误");
		
		if(user.getIsLocked())
			throw new ServiceException("用户已被锁定，暂时无法登陆");
		
		if(user.getLoginFailureCount() >= 3) {
			// validate captchas
		}
		
		if(!encryptPassword(password, user.getSalt()).equals(user.getPassword())) {
			if(DateUtil.isSameDay(user.getLockedDate(), new Date())) {
				user.setLoginFailureCount(user.getLoginFailureCount() + 1);
				
				if(user.getLoginFailureCount() > 10) {
					user.setIsLocked(true);
				}
			} else {
				user.setLoginFailureCount(1);
			}
			user.setLockedDate(new Date());
			this.update(user);
			
			throw new ServiceException("用户名或者密码错误");
		}
		
		return user;
	}
}
