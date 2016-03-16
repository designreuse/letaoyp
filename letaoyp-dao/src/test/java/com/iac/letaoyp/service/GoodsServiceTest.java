package com.iac.letaoyp.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

import com.iac.letaoyp.entity.sku.Goods;
import com.iac.letaoyp.service.sku.GoodsService; 

@ContextConfiguration(locations = { "classpath:spring/applicationContext*.xml" })
public class GoodsServiceTest extends SpringTransactionalTestCase {

	@Autowired
	private GoodsService goodsService;
	
	@Test
	public void findTop15Test() {
		goodsService.findTop15(1L, Goods.Status.ONLINE);
	}
}
