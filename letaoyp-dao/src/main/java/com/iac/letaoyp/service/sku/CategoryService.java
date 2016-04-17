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

	public List<Category> findByParentOrderBySortDesc(Long parent) {
		return categoryDao.findByParentOrderBySortDesc(parent);
	}

	public List<Category> findAllByOrderBySortDesc() {
		return categoryDao.findAllByOrderBySortDesc();
	}

	public List<Category> findHomeShown() {
		return categoryDao.findByParentAndTopAndActiveOrderBySortDesc(ROOT, true, true);
	}

	public List<Category> findByActiveOrderBySortDesc(boolean active) {
		return categoryDao.findByActiveOrderBySortDesc(active);
	}

	public List<Category> findByParentAndActiveOrderBySortDesc(Long categoryId, boolean active) {
		return categoryDao.findByParentAndActiveOrderBySortDesc(categoryId, active);
	}
	
	public void updateActiveByIds(boolean active, Long[] ids) {
		categoryDao.updateActiveByIdIn(active, ids);
	}

	public void delete(Long[] ids) {
		categoryDao.deleteByIdIn(ids);
	}
	
	@Override
	public void save(Category c) {
		Category parent = categoryDao.findOne(c.getParent());
		parent.setIsLeaf(false);
		categoryDao.save(parent);
		
		c.setIsLeaf(true);
		c.setLevel(parent.getLevel() + 1);
		c.setTreeName(parent.getTreeName() + "," + parent.getName());
		c.setTreePath(parent.getTreePath() + "," + parent.getId());
		categoryDao.save(c);
	}

	public void setTop(Long id, boolean top) {
		categoryDao.updateTopById(top, id);
	}
}
