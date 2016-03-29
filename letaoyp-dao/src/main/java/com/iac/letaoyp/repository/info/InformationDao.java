package com.iac.letaoyp.repository.info;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.info.Information;
import com.iac.letaoyp.repository.BasicRepository;


public interface InformationDao extends BasicRepository<Information,java.lang.Long> {


    @Modifying
    @Query("update Information a set a.active=?1 where a.id in (?2)")
    void updateActiveByIdIn(boolean active, Long[] ids);


    @Modifying
    @Query("delete Information a where a.id in (?1)")
    void deleteByIdIn(Long[] ids);
}
