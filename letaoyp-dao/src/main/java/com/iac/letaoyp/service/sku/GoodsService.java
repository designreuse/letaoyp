package com.iac.letaoyp.service.sku;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.sku.Goods;
import com.iac.letaoyp.entity.sku.GoodsChoosen;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.sku.GoodsChoosenDao;
import com.iac.letaoyp.repository.sku.GoodsDao;
import com.iac.letaoyp.service.BasicService;
import com.iac.letaoyp.util.CollectionsUtil;

@Component
@Transactional
public class GoodsService extends BasicService<Goods,java.lang.Long> {

	@Autowired
	private GoodsDao goodsDao;
	
	@Autowired
	private GoodsChoosenDao goodsChoosenDao;
	
	@Override
	public BasicRepository<Goods,java.lang.Long> getRepository() {
		return goodsDao;
	}

	public List<Goods> findTop15(Long category, Goods.Status status) {
		return goodsDao.findTop(category, status.name(), 15);
	}

	/**
	 * check if goods choosen all selected
	 * @param goodsId
	 * @param choosen
	 * @return
	 */
	public String predicateCheck(Long goodsId, Long[] choosen) {
		Goods goods = this.get(goodsId);
		if(goods == null || !goods.getActive()) {
			return "商品已下架";
		}
		
		List<GoodsChoosen> goodsChoosen = goodsChoosenDao.findByGoodsId(goodsId);
		if((choosen == null || choosen.length == 0) && !goodsChoosen.isEmpty()) {
			return "请选择商品参数";
		}
		
		Map<Object, List<GoodsChoosen>> map = CollectionsUtil.extractToMap(goodsChoosen, "name");
		
		if(choosen != null) {
			for(GoodsChoosen gc : goodsChoosen) {
				for(Long l : choosen) {
					if(gc.getId().longValue() == l.longValue()) {
						map.remove(gc.getName());
					}
				}
			}
		}
		
		
		return map.isEmpty() ? null : "请选择商品参数";
	}
	
	public void updateActiveByIds(boolean active, Long[] ids) {
		goodsDao.updateActiveByIdIn(active, ids);
	}

	public void delete(Long[] ids) {
		goodsDao.deleteByIdIn(ids);
	}
}
