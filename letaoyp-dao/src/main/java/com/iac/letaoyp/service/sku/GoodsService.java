package com.iac.letaoyp.service.sku;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.jsoup.helper.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.sku.Goods;
import com.iac.letaoyp.entity.sku.Goods.Status;
import com.iac.letaoyp.entity.sku.GoodsChoosen;
import com.iac.letaoyp.entity.sku.GoodsImage;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.sku.GoodsChoosenDao;
import com.iac.letaoyp.repository.sku.GoodsDao;
import com.iac.letaoyp.repository.sku.GoodsImageDao;
import com.iac.letaoyp.repository.sku.GoodsTopDao;
import com.iac.letaoyp.service.BasicService;
import com.iac.letaoyp.service.ServiceException;
import com.iac.letaoyp.service.admin.FileManagerService;
import com.iac.letaoyp.util.CollectionsUtil;

@Component
@Transactional
public class GoodsService extends BasicService<Goods,java.lang.Long> {
	
	private Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private GoodsDao goodsDao;
	
	@Autowired
	private GoodsTopDao goodsTopDao;
	
	@Autowired
	private GoodsImageDao goodsImageDao;
	
	@Autowired
	private GoodsChoosenDao goodsChoosenDao;
	
	@Autowired
	private FileManagerService fileManagerService;
	
	@Override
	public BasicRepository<Goods,java.lang.Long> getRepository() {
		return goodsDao;
	}

	public List<Goods> findTop15(Long category, Goods.Status status) {
		return goodsDao.findTop(category, status.name(), 15);
	}

	/**
	 * check if goods choosen all selected before adding to cart
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
	
	@Override
	public void delete(Long id) {
		this.delete(new Long[] {id});
	}
	
	public void updateActiveByIds(boolean active, Long[] ids) {
		goodsDao.updateActiveByIdIn(active, ids);
		goodsTopDao.updateActiveByGoodsIdIn(active, ids);
		goodsImageDao.updateActiveByGoodsIn(active, ids);
		goodsChoosenDao.updateActiveByGoodsIn(active, ids);
	}

	public void delete(Long[] ids) {
		List<GoodsImage> goodsImages = goodsImageDao.findByGoodsIn(ids);
		for(GoodsImage image : goodsImages) {
			if(StringUtil.isBlank(image.getPath())) continue;
			
			try {
				File f = new File(image.getPath());
				if(f.exists()) {
					boolean result = f.delete();
					
					if(!result) {
						log.warn("File {} delete failure, which should be removed Manually" + image.getPath());
					}
				}
			} catch(Exception e) {
				log.warn(String.format("Delete Image with path [%s] goodsImage id [%s] due to error", image.getPath(), image.getId()), e);
			}
		}
		goodsImageDao.deleteByGoodsIn(ids);
		goodsTopDao.deleteByGoodsIdIn(ids);
		goodsChoosenDao.deleteByGoodsIdIn(ids);
		goodsDao.deleteByIdIn(ids);
	}

	public void updateStatus(Long id, Status status) {
		if(status == Status.ONLINE) {
			goodsDao.updateStatusAndOnlineTimeById(status, new Date(), id);
		} else {
			goodsDao.updateStatusById(status, id);
		}
	}

	public void save(Goods goods, String[] images, Integer[] sort, String[] keys, String[] values) {
		if(keys == null || values == null) {
			goods.setProperty(null);
		} else {
			if(keys.length != values.length) {
				throw new ServiceException("Invalid parameter 'keys' and 'values' should have same length");
			}
			Map<String, String> property = new HashMap<String, String>();
			for(int i=0; i<keys.length; i++) {
				property.put(keys[i], values[i]);
			}
			goods.setParsedProperty(property);
		}
		
		super.save(goods);
		
		if(images == null || images.length == 0)
			return;

		if(sort == null || images.length != sort.length) {
			throw new ServiceException("Invalid parameter 'images' and 'sort', It shouldn't be null and has same length");
		}
		
		for(int i=0; i<images.length; i++) {
			if(StringUtils.isBlank(images[i]))
				continue;
			GoodsImage goodsImage = new GoodsImage();
			goodsImage.setGoods(goods.getId());
			goodsImage.setSrc(images[i]);
			goodsImage.setPath(fileManagerService.getAbsolutePath(images[i]));
			goodsImage.setSort(sort[i]);
			goodsImageDao.save(goodsImage);
		}
	}
}
