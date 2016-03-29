package com.iac.letaoyp.repository.info;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.info.Advertise;
import com.iac.letaoyp.repository.BasicRepository;

public interface AdvertiseDao extends BasicRepository<Advertise,java.lang.Long> {

    @Modifying
    @Query("update Advertise a set a.active=?1 where a.id in (?2)")
    void updateActiveByIdIn(boolean active, Long[] ids);


    @Modifying
    @Query("delete Advertise a where a.id in (?1)")
    void deleteByIdIn(Long[] ids);
}
