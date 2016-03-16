package com.iac.letaoyp.service.sku;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.sku.GoodsTop;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.sku.GoodsTopDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class GoodsTopService extends BasicService<GoodsTop,java.lang.Long> {

	@Autowired
	private GoodsTopDao goodsTopDao;
	
	@Override
	public BasicRepository<GoodsTop,java.lang.Long> getRepository() {
		return goodsTopDao;
	}

	public List<GoodsTop> findByCategoryAndActive(Long categoryId, boolean active) {
		return goodsTopDao.findByCategoryIdAndActive(categoryId, active);
	}
}
