package com.iac.letaoyp.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.user.ShippingAddress;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.user.ShippingAddressDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class ShippingAddressService extends BasicService<ShippingAddress,java.lang.Long> {

	@Autowired
	private ShippingAddressDao shippingAddressDao;
	
	@Override
	public BasicRepository<ShippingAddress,java.lang.Long> getRepository() {
		return shippingAddressDao;
	}
	
	public void updateActiveByIds(boolean active, Long[] ids) {
		shippingAddressDao.updateActiveByIdIn(active, ids);
	}

	public void delete(Long[] ids) {
		shippingAddressDao.deleteByIdIn(ids);
	}
}
