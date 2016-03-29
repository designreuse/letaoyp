package com.iac.letaoyp.repository.user;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.user.VisitHistory;
import com.iac.letaoyp.repository.BasicRepository;

public interface VisitHistoryDao extends BasicRepository<VisitHistory,java.lang.Long>{
	
	@Modifying
    @Query("update VisitHistory a set a.active=?1 where a.id in (?2)")
    void updateActiveByIdIn(boolean active, Long[] ids);


    @Modifying
    @Query("delete VisitHistory a where a.id in (?1)")
    void deleteByIdIn(Long[] ids);
}
