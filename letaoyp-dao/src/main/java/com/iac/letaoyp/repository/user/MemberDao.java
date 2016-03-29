package com.iac.letaoyp.repository.user;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.user.Member;
import com.iac.letaoyp.repository.BasicRepository;


public interface MemberDao extends BasicRepository<Member,java.lang.Long>{
	
	public Member findByUsername(java.lang.String username);
	
	public Member deleteByUsername(java.lang.String username);

	public Member findByMobile(String phone);

	@Modifying
    @Query("update Member a set a.active=?1 where a.id in (?2)")
    void updateActiveByIdIn(boolean active, Long[] ids);


    @Modifying
    @Query("delete Member a where a.id in (?1)")
    void deleteByIdIn(Long[] ids);
}
