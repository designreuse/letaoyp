package com.iac.letaoyp.controller.admin;

import com.iac.letaoyp.entity.admin.Menu;
import com.iac.letaoyp.service.admin.MenuService;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/admin/menu")
public class MenuAdminController {

	@Autowired
	private MenuService menuService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model, ServletRequest request) {
		List<Menu> roots = menuService.listRootMenus();
		for(Menu m : roots) {
			List<Menu> subMenus = menuService.listSubMenus(m.getId());
			m.setSubMenus(subMenus);
		}
		model.addAttribute("roots", roots);

		return "admin/menuList";
	}
	
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		List<Menu> roots = menuService.listRootMenus();
		model.addAttribute("roots", roots);
		return "admin/menuForm";
	}
	
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("menu", menuService.get(id));
		List<Menu> roots = menuService.listRootMenus();
		model.addAttribute("roots", roots);
		return "admin/menuForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("menu") Menu menu, RedirectAttributes redirectAttributes) {
		menuService.save(menu);
		redirectAttributes.addFlashAttribute("message", "更新菜单" + menu.getDescription() + "成功");
		return "redirect:/admin/menu";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		Menu menu = menuService.get(id);
		menuService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除菜单" + menu.getDescription() + "成功");
		return "redirect:/admin/menu";
	}

	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出menu对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getMenu(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("menu", menuService.get(id));
		}
	}
}
