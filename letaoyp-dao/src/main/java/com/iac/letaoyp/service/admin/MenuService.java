package com.iac.letaoyp.service.admin;

import com.iac.letaoyp.entity.admin.Menu;
import com.iac.letaoyp.entity.admin.Permission;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.admin.MenuDao;
import com.iac.letaoyp.repository.admin.PermissionDao;
import com.iac.letaoyp.service.BasicService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional
public class MenuService extends BasicService<Menu, Long> {

	@Autowired
	private MenuDao menuDao;
	
	@Autowired
	private PermissionDao permissionDao;
	
	public List<Menu> listRootMenus() {
		return menuDao.findByParent(0L);
	}
	
	public List<Menu> listSubMenus(Long id) {
		return menuDao.findByParent(id);
	}

	public void save(Menu menu) {
		boolean isInsert = menu.getId() == null;
		super.save(menu);
		if(isInsert) {
			// 增加menu时 默认添加对应的权限
			Permission p = new Permission();
			p.setActive(true);
			p.setName(menu.getName() + ":*");
			p.setDescription(menu.getDescription() + "管理");
			p.setMenu(menu.getId());
			permissionDao.save(p);
			
			Permission p2 = new Permission();
			p2.setActive(true);
			p2.setName(menu.getName() + ":view");
			p2.setDescription(menu.getDescription() + "查看");
			p2.setMenu(menu.getId());
			permissionDao.save(p2);
		}
	}
	
	public void delete(Long id) {
		super.delete(id);
		permissionDao.deleteByMenu(id);
	}
	
	@Override
	public BasicRepository<Menu, Long> getRepository() {
		return menuDao;
	}
}
