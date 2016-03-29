package com.iac.letaoyp.repository.admin;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iac.letaoyp.entity.admin.Menu;
import com.iac.letaoyp.repository.BasicRepository;

public interface MenuDao extends BasicRepository<Menu, java.lang.Long> {

	@Modifying
	@Query("update Menu a set a.active=?1 where a.id in (?2)")
	void updateActiveByIdIn(boolean active, Long[] ids);

	@Modifying
	@Query("delete Menu a where a.id in (?1)")
	void deleteByIdIn(Long[] ids);

	public List<Menu> findByParentAndActive(long id, boolean active);

	Menu findByNameAndActive(String name, boolean active);
}
