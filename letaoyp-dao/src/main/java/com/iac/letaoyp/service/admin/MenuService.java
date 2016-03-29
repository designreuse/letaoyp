package com.iac.letaoyp.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.iac.letaoyp.entity.admin.Menu;
import com.iac.letaoyp.entity.admin.Permission;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.admin.MenuDao;
import com.iac.letaoyp.repository.admin.PermissionDao;
import com.iac.letaoyp.service.BasicService;
import com.iac.letaoyp.service.ServiceException;

@Component
@Transactional
public class MenuService extends BasicService<Menu, java.lang.Long> {

	@Autowired
	private MenuDao menuDao;
	@Autowired
	private PermissionDao permissionDao;

	@Override
	public BasicRepository<Menu, java.lang.Long> getRepository() {
		return menuDao;
	}

	public Menu findByName(java.lang.String name) {
		return menuDao.findByNameAndActive(name, true);
	}

	public void updateActiveByIds(boolean active, Long[] ids) {
		menuDao.updateActiveByIdIn(active, ids);
	}

	public void delete(Long[] ids) {
		menuDao.deleteByIdIn(ids);
	}
	
	public List<Menu> listRootMenus() {
		return menuDao.findByParentAndActive(0L, true);
	}
	
	public List<Menu> listSubMenus(Long id) {
		return menuDao.findByParentAndActive(id, true);
	}

	@Override
	public void save(Menu menu) {
		
		String parentName = "";
		if(menu.getParent() != 0L) {
			Menu parent = super.get(menu.getParent());
			if(parent == null || !parent.getActive()) {
				throw new ServiceException("Not found menu with id::" + menu.getParent());
			}
			
			//  To avoid 2 level of menu limit, add column named 'full_name' on table s_menu , 
			//	of course should maintain the column when save it or update parent name
			// and then add permission named 'parent.full_name : menu.name : view ' or edit rights
			if(parent.getParent() != 0L) {
				throw new ServiceException("Menu only support 2 level");
			}
			
			parentName = parent.getName();
		}
		
		boolean isInsert = menu.getId() == null;
		super.save(menu);
		// maintain permission name when updated menu 
		if(isInsert) {
			// 增加menu时 默认添加对应的权限
			Permission p = new Permission();
			p.setActive(true);
			p.setName(parentName + ":" + menu.getName() + ":*");
			p.setDescription(menu.getDescription() + "管理");
			p.setMenu(menu.getId());
			permissionDao.save(p);
			
			Permission p2 = new Permission();
			p2.setActive(true);
			p2.setName(parentName + ":" + menu.getName() + ":view");
			p2.setDescription(menu.getDescription() + "查看权限");
			p2.setMenu(menu.getId());
			permissionDao.save(p2);
			
			Permission p3 = new Permission();
			p3.setActive(true);
			p3.setName(parentName + ":" + menu.getName() + ":edit");
			p3.setDescription(menu.getDescription() + "编辑权限");
			p3.setMenu(menu.getId());
			permissionDao.save(p3);
			
			Permission p4 = new Permission();
			p4.setActive(true);
			p4.setName(parentName + ":" + menu.getName() + ":delete");
			p4.setDescription(menu.getDescription() + "删除权限");
			p4.setMenu(menu.getId());
			permissionDao.save(p4);
		}
	}
	
	@Override
	public void delete(Long id) {
		super.delete(id);
		permissionDao.deleteByMenu(id);
	}
}
