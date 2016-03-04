package com.iac.letaoyp.controller.admin;

import java.util.List;

import com.iac.letaoyp.entity.admin.Menu;
import com.iac.letaoyp.service.admin.MenuService;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)，
 * 
 * 真正登录的POST请求由Filter完成,
 * 
 */
@Controller
@RequestMapping(value = "/")
public class LoginController {

	@Autowired
	private MenuService menuService;
	
	@RequestMapping(value="admin", method = RequestMethod.GET)
	public String index(ModelMap model) {
		List<Menu> roots = menuService.listRootMenus();
		for(Menu m : roots) {
			List<Menu> subMenus = menuService.listSubMenus(m.getId());
			m.setSubMenus(subMenus);
		}
		model.addAttribute("roots", roots);

		return "index";
	}
	
	@RequestMapping(value="login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value="login", method = RequestMethod.POST)
	public String fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) {
		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
		return "login";
	}

}
