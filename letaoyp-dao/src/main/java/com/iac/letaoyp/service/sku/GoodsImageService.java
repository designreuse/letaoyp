package com.iac.letaoyp.service.sku;

import java.io.File;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.sku.GoodsImage;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.sku.GoodsImageDao;
import com.iac.letaoyp.service.BasicService;
import com.iac.letaoyp.service.admin.FileManagerService;

@Component
@Transactional
public class GoodsImageService extends BasicService<GoodsImage,java.lang.Long> {

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private GoodsImageDao goodsImageDao;
	
	@Autowired
	private FileManagerService fileManagerService;
	
	@Override
	public BasicRepository<GoodsImage,java.lang.Long> getRepository() {
		return goodsImageDao;
	}

	public List<GoodsImage> findByGoods(Long goods) {
		return goodsImageDao.findByGoods(goods);
	}
	
	public void updateActiveByIds(boolean active, Long[] ids) {
		goodsImageDao.updateActiveByIdIn(active, ids);
	}

	public void delete(Long[] ids) {
		goodsImageDao.deleteByIdIn(ids);
	}
	
	@Override
	public void save(GoodsImage entity) {
		String path = fileManagerService.getAbsolutePath(entity.getSrc());
		if(!StringUtils.equals(path, entity.getPath())) {
			deleteFile(entity);
		}
		entity.setPath(path);
		super.save(entity);
	}
	
	private void deleteFile(GoodsImage entity) {
		if(StringUtils.isNotBlank(entity.getPath())) {
			try {
				File f = new File(entity.getPath());
				boolean result = f.delete();
				
				if(!result) {
					log.warn("File {} delete failure, which should be removed Manually" + entity.getPath());
				}
			} catch(Exception e) {
				log.warn(String.format("Delete Image with path [%s] goodsImage id [%s] due to error", entity.getPath(), entity.getId()), e);
			}
		}
	}
	
	@Override
	public void delete(Long id) {
		GoodsImage goodsImage = goodsImageDao.findOne(id);
		
		if(goodsImage == null)
			return;
		
		deleteFile(goodsImage);
		
		super.delete(id);
	}
}
