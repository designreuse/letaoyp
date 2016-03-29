package com.iac.letaoyp.service.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.info.Area;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.info.AreaDao;
import com.iac.letaoyp.service.BasicService;


@Component
@Transactional
public class AreaService extends BasicService<Area,java.lang.Long> {

    @Autowired
    private AreaDao areaDao;

    @Override
    public BasicRepository<Area,java.lang.Long> getRepository() {
    	return areaDao;
    }


    public void updateActiveByIds(boolean active, Long[] ids) {
      areaDao.updateActiveByIdIn(active, ids);
    }

    public void delete(Long[] ids) {
      areaDao.deleteByIdIn(ids);
    }
}
