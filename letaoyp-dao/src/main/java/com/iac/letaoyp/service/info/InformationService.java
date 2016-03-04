package com.iac.letaoyp.service.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.info.Information;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.info.InformationDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class InformationService extends BasicService<Information,java.lang.Long> {

	@Autowired
	private InformationDao informationDao;
	
	@Override
	public BasicRepository<Information,java.lang.Long> getRepository() {
		return informationDao;
	}
}
