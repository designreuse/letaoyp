package com.iac.letaoyp.service.sku;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.iac.letaoyp.RollbackTransactionBaseTest;

public class CategoryServiceTest extends RollbackTransactionBaseTest {

	@Autowired
	private CategoryService categoryService;
	
	@Test
	public void test() {
		categoryService.findByParentOrderBySortDesc(0L);
	}
}
