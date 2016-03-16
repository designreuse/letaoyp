package com.iac.letaoyp.service.sku;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.iac.letaoyp.RollbackTransactionBaseTest;

public class BrandCategoryServiceTest extends RollbackTransactionBaseTest {

	@Autowired
	private BrandCategoryService brandCategoryService;
	
	@Test
	public void findByCategoryTest() {
		brandCategoryService.findByCategory(1L);
	}
}
