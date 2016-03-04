package com.iac.letaoyp.repository.admin;

import com.iac.letaoyp.entity.admin.Menu;
import com.iac.letaoyp.repository.BasicRepository;

import java.util.List;

import javax.persistence.OrderBy;

public interface MenuDao extends BasicRepository<Menu, Long> {

	@OrderBy(value="sort")
	List<Menu> findByParent(Long parentId);

}
