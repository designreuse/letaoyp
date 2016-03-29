package com.iac.letaoyp.repository.admin;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.admin.Log;
import com.iac.letaoyp.repository.BasicRepository;

public interface LogDao extends BasicRepository<Log, java.lang.Long> {


    @Modifying
    @Query("update Log a set a.active=?1 where a.id in (?2)")
    void updateActiveByIdIn(boolean active, Long[] ids);


    @Modifying
    @Query("delete Log a where a.id in (?1)")
    void deleteByIdIn(Long[] ids);
}
