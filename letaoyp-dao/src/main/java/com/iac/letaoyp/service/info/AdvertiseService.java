package com.iac.letaoyp.service.info;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.info.Advertise;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.info.AdvertiseDao;
import com.iac.letaoyp.service.BasicService;


@Component
@Transactional
public class AdvertiseService extends BasicService<Advertise,java.lang.Long> {

    @Autowired
    private AdvertiseDao advertiseDao;

    @Override
    public BasicRepository<Advertise,java.lang.Long> getRepository() {
    	return advertiseDao;
    }


    public void updateActiveByIds(boolean active, Long[] ids) {
      advertiseDao.updateActiveByIdIn(active, ids);
    }

    public void delete(Long[] ids) {
      advertiseDao.deleteByIdIn(ids);
    }


	public Advertise findBySequenceAndModel(Long sequence, Advertise.Model advertiseModel) {
		return advertiseDao.findBySequenceAndModel(sequence, advertiseModel);
	}


	public List<Advertise> findByModel(Advertise.Model model) {
		return advertiseDao.findByModel(model);
	}


	public List<Advertise> findBySequenceInAndModel(List<Long> sequences, Advertise.Model model) {
		return advertiseDao.findBySequenceInAndModel(sequences, model);
	}
}
