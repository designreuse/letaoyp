package com.iac.letaoyp.service.sku;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.sku.Category;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.sku.CategoryDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class CategoryService extends BasicService<Category,java.lang.Long> {
	
	public static final Long ROOT = 0l;

	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	public BasicRepository<Category,java.lang.Long> getRepository() {
		return categoryDao;
	}

	public List<Category> findByParent(Long parent) {
		return categoryDao.findByParent(parent);
	}

	public List<Category> findAllByOrderByOrderDesc() {
		return categoryDao.findAllByOrderByOrderDesc();
	}

	public List<Category> findHomeShown() {
		return categoryDao.findByParentAndTopAndActiveOrderByOrderDesc(ROOT, true, true);
	}

	public List<Category> findByActiveOrderByOrderDesc(boolean active) {
		return categoryDao.findByActiveOrderByOrderDesc(active);
	}

	public List<Category> findByParentAndActiveOrderByOrderDesc(Long categoryId, boolean active) {
		return categoryDao.findByParentAndActiveOrderByOrderDesc(categoryId, active);
	}
}
