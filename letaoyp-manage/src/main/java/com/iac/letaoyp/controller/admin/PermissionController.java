package com.iac.letaoyp.controller.admin;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.modules.web.Servlets;

import com.iac.letaoyp.biz.web.AjaxResult;
import com.iac.letaoyp.controller.BasicController;
import com.iac.letaoyp.entity.admin.Permission;
import com.iac.letaoyp.service.admin.PermissionService;

@Controller
@RequestMapping("admin/permission")
public class PermissionController extends BasicController {
	
	@Autowired
	private PermissionService permissionService;
	
	/** 列表 */
	@RequestMapping
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = DEFAULT_PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = DEFAULT_SORT_TYPE) String sortType,
			Model model, ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Page<Permission> page = permissionService.findPage(searchParams, pageNumber, pageSize, sortType);
				
		model.addAttribute("page", page);
		model.addAttribute("sortType", sortType);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		return "admin/permissionList";
	}
	
	@RequestMapping(value="/create", method = RequestMethod.GET)
	public String createForm(ModelMap model) {
		return "admin/permissionForm";
	}
	
	@RequestMapping(value="update/{id}", method = RequestMethod.GET)
	public String updateForm(ModelMap model, @PathVariable java.lang.Long id) {
		Permission permission = permissionService.get(id);
		model.addAttribute("permission",permission);
		return "admin/permissionForm";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult update(@Valid @ModelAttribute("permission") Permission permission) {
		permissionService.save(permission);
		return AjaxResult.SUCCEED;
	}
	
	/** 删除 */
	@RequestMapping(value = "delete/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public AjaxResult delete(@PathVariable("id") java.lang.Long id) {
		permissionService.delete(id);
		return AjaxResult.succeed();
	}

	@RequestMapping(value = "delete", method=RequestMethod.POST)
	@ResponseBody
	public AjaxResult batchDelete(@RequestParam("ids") java.lang.Long[] ids) {
		if(ids == null || ids.length == 0) {
			return AjaxResult.ERROR_PARAM;
		}
		permissionService.delete(ids);
		return AjaxResult.succeed();
	}
	
	@RequestMapping(value = "settings", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult settings(@RequestParam("ids")Long[] ids, @RequestParam("active")boolean active) {
		if(ids == null || ids.length == 0) {
			return AjaxResult.ERROR_PARAM;
		}
		
		permissionService.updateActiveByIds(active, ids);
		return AjaxResult.succeed();
	}

	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,
	 * 先根据form的id从数据库查出menu对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getPermission(@RequestParam(value = "id", defaultValue = "-1") java.lang.Long id, Model model) {
		if (id != -1) {
			model.addAttribute("permission", permissionService.get(id));
		}
	}
}

