package com.iac.letaoyp.service.sku;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.iac.letaoyp.CommitTransactionBaseTest;
import com.iac.letaoyp.entity.sku.Goods;
import com.iac.letaoyp.repository.sku.GoodsChoosenDao;
import com.iac.letaoyp.repository.sku.GoodsDao;
import com.iac.letaoyp.repository.sku.GoodsImageDao;
import com.iac.letaoyp.repository.sku.GoodsTopDao;

public class GoodsServiceTest extends CommitTransactionBaseTest {

	@Autowired
	private GoodsService goodsService;
	@Autowired
	private GoodsImageDao goodsImageDao;
	@Autowired
	private GoodsTopDao goodsTopDao;
	@Autowired
	private GoodsChoosenDao goodsChoosenDao;
	@Autowired
	private GoodsDao goodsDao;
	
//	@Test
	public void test() {
		List<Goods> list = goodsService.findTop(1L, Goods.Status.OFFLINE, 15);
		System.out.println(list.size());
		
		goodsService.updateStatus(1L, Goods.Status.OFFLINE);
		goodsService.updateActiveByIds(false, new Long[]{1L, 2L});
	}
	
	@Test
	public void test2() {
//		Long[] ids = new Long[] {91L};
		
		goodsService.delete(91L);
		
//		goodsImageDao.deleteByGoodsIn(ids);
//		goodsTopDao.deleteByGoodsIdIn(ids);
//		goodsChoosenDao.deleteByGoodsIdIn(ids);
//		goodsDao.deleteByIdIn(ids);
	}
}
