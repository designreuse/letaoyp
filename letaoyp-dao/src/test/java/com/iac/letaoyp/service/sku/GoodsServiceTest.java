package com.iac.letaoyp.service.sku;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.iac.letaoyp.RollbackTransactionBaseTest;
import com.iac.letaoyp.entity.sku.Goods;

public class GoodsServiceTest extends RollbackTransactionBaseTest {

	@Autowired
	private GoodsService goodsService;
	
	@Test
	public void test() {
		List<Goods> list = goodsService.findTop15(1L, Goods.Status.OFFLINE);
		System.out.println(list.size());
		
		goodsService.updateStatus(1L, Goods.Status.OFFLINE);
		goodsService.updateActiveByIds(false, new Long[]{1L, 2L});
	}
}
