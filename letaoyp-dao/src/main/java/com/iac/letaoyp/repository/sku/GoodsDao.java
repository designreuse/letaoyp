package com.iac.letaoyp.repository.sku;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.sku.Goods;
import com.iac.letaoyp.entity.sku.Goods.Status;
import com.iac.letaoyp.repository.BasicRepository;

public interface GoodsDao extends BasicRepository<Goods,java.lang.Long>{

	@Query(value = "select * from goods a where a.category = ?1 "
			+ "and a.status = ?2 and a.active = 1 order by online_time desc, id desc limit 0, ?3", nativeQuery = true)
	List<Goods> findTop(Long category, String status, int size);

	@Modifying
    @Query("update Goods a set a.active = ?1 where a.id in (?2)")
    void updateActiveByIdIn(boolean active, Long[] ids);


    @Modifying
    @Query("delete Goods a where a.id in (?1)")
    void deleteByIdIn(Long[] ids);

    @Modifying
    @Query("update Goods a set a.status = ?1, a.onlineTime = ?2 where a.id = ?3")
	void updateStatusAndOnlineTimeById(Goods.Status status, Date date, Long id);

    @Modifying
    @Query("update Goods a set a.status = ?1 where a.id = ?2")
	void updateStatusById(Status status, Long id);

    @Modifying
    @Query("update Goods a set a.topPosition = null where a.id = ?1")
	void updateTopPositionById(Long id);
}
