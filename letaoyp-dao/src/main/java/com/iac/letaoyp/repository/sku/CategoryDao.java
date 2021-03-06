package com.iac.letaoyp.repository.sku;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.sku.Category;
import com.iac.letaoyp.repository.BasicRepository;

public interface CategoryDao extends BasicRepository<Category,java.lang.Long>{

	List<Category> findByParentOrderBySortDesc(Long parent);

	List<Category> findAllByOrderBySortDesc();

	List<Category> findByParentAndTopAndActiveOrderBySortDesc(Long root, boolean top, boolean active);

	List<Category> findByParentAndActiveOrderBySortDesc(Long categoryId, boolean active);

	List<Category> findByActiveOrderBySortDesc(boolean active);

	@Modifying
    @Query("update Category a set a.active=?1 where a.id in (?2)")
    void updateActiveByIdIn(boolean active, Long[] ids);


    @Modifying
    @Query("delete Category a where a.id in (?1)")
    void deleteByIdIn(Long[] ids);

    @Modifying
    @Query("update Category a set a.top=?1 where a.id = ?2")
	void updateTopById(boolean top, Long id);
}
