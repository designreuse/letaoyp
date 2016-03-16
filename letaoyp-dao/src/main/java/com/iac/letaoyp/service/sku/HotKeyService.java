package com.iac.letaoyp.service.sku;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.sku.HotKey;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.sku.HotKeyDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class HotKeyService extends BasicService<HotKey,java.lang.Long> {

	@Autowired
	private HotKeyDao hotKeyDao;
	
	@Override
	public BasicRepository<HotKey,java.lang.Long> getRepository() {
		return hotKeyDao;
	}
}
