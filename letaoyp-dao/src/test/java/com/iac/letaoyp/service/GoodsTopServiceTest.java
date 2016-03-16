package com.iac.letaoyp.service;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

import com.iac.letaoyp.entity.sku.GoodsTop;
import com.iac.letaoyp.service.sku.GoodsTopService;

@ContextConfiguration(locations = { "classpath:spring/applicationContext*.xml" })
public class GoodsTopServiceTest extends SpringTransactionalTestCase {
	
	@Autowired
	private GoodsTopService goodsTopService;
	
	@Test
	public void findByCategoryAndActiveTest() {
		List<GoodsTop> list = goodsTopService.findByCategoryAndActive(1L, true);
	}
}
