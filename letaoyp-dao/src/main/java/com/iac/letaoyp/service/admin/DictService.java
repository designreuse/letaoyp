package com.iac.letaoyp.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.admin.Dict;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.admin.DictDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class DictService extends BasicService<Dict,java.lang.Long> {

	@Autowired
	private DictDao dictDao;
	
	@Override
	public BasicRepository<Dict,java.lang.Long> getRepository() {
		return dictDao;
	}
}
