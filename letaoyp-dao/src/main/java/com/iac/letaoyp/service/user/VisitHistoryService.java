package com.iac.letaoyp.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.user.VisitHistory;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.user.VisitHistoryDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class VisitHistoryService extends BasicService<VisitHistory,java.lang.Long> {

	@Autowired
	private VisitHistoryDao visitHistoryDao;
	
	@Override
	public BasicRepository<VisitHistory,java.lang.Long> getRepository() {
		return visitHistoryDao;
	}
}
