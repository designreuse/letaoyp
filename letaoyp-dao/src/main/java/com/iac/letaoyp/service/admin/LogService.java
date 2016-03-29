package com.iac.letaoyp.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.admin.Log;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.admin.LogDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class LogService extends BasicService<Log, java.lang.Long> {

    @Autowired
    private LogDao logDao;

    @Override
    public BasicRepository<Log,java.lang.Long> getRepository() {
    	return logDao;
    }


    public void updateActiveByIds(boolean active, Long[] ids) {
      logDao.updateActiveByIdIn(active, ids);
    }

    public void delete(Long[] ids) {
      logDao.deleteByIdIn(ids);
    }
}
