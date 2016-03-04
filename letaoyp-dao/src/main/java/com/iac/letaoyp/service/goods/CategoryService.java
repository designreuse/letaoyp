package com.iac.letaoyp.service.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.goods.Category;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.goods.CategoryDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class CategoryService extends BasicService<Category,java.lang.Long> {

	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	public BasicRepository<Category,java.lang.Long> getRepository() {
		return categoryDao;
	}
}
