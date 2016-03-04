package com.iac.letaoyp.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.user.Member;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.user.MemberDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class MemberService extends BasicService<Member,java.lang.Long> {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public BasicRepository<Member,java.lang.Long> getRepository() {
		return memberDao;
	}
}
