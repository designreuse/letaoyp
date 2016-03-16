package com.iac.letaoyp.repository.sku;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.sku.Goods;
import com.iac.letaoyp.repository.BasicRepository;

public interface GoodsDao extends BasicRepository<Goods,java.lang.Long>{

	@Query(value = "select * from goods a where a.category = ?1 "
			+ "and a.status = ?2 and a.active = 1 order by online_time desc, id desc limit 0, ?3", nativeQuery = true)
	List<Goods> findTop(Long category, String status, int size);
	

}
