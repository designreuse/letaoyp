package com.iac.letaoyp.repository.user;

import com.iac.letaoyp.entity.user.Member;
import com.iac.letaoyp.repository.BasicRepository;


public interface MemberDao extends BasicRepository<Member,java.lang.Long>{
	
	public Member findByUsername(java.lang.String username);
	
	public Member deleteByUsername(java.lang.String username);

}
