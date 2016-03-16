package com.iac.letaoyp.repository.sku;

import java.util.List;

import com.iac.letaoyp.entity.sku.Category;
import com.iac.letaoyp.repository.BasicRepository;

public interface CategoryDao extends BasicRepository<Category,java.lang.Long>{

	List<Category> findByParent(Long parent);

	List<Category> findAllByOrderByOrderDesc();

	List<Category> findByParentAndTopAndActiveOrderByOrderDesc(Long root, boolean top, boolean active);

	List<Category> findByParentAndActiveOrderByOrderDesc(Long categoryId, boolean active);

	List<Category> findByActiveOrderByOrderDesc(boolean active);

}
