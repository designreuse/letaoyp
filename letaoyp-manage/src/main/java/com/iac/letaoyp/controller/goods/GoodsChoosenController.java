package com.iac.letaoyp.controller.goods;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.web.Servlets;

import com.iac.letaoyp.controller.BasicController;
import com.iac.letaoyp.entity.goods.GoodsChoosen;
import com.iac.letaoyp.service.goods.GoodsChoosenService;

@Controller
@RequestMapping("goods/goodschoosen")
public class GoodsChoosenController extends BasicController {
	
	@Autowired
	private GoodsChoosenService goodsChoosenService;
	
	/** 列表 */
	@RequestMapping
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = DEFAULT_PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = DEFAULT_SORT_TYPE) String sortType,
			Model model, ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Page<GoodsChoosen> page = goodsChoosenService.findPage(searchParams, pageNumber, pageSize, sortType);
				
		model.addAttribute("page", page);
		model.addAttribute("sortType", sortType);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		return "goods/goodschoosenList";
	}
	
	/** 进入新增 */
	@RequestMapping(value="/create", method = RequestMethod.GET)
	public String createForm(ModelMap model) {
		return "goods/goodschoosenForm";
	}
	
	/** 编辑 */
	@RequestMapping(value="update/{id}", method = RequestMethod.GET)
	public String updateForm(ModelMap model, @PathVariable java.lang.Long id) {
		GoodsChoosen goodsChoosen = goodsChoosenService.get(id);
		model.addAttribute("goodsChoosen",goodsChoosen);
		return "goods/goodschoosenForm";
	}
	
	/** 保存更新,@Valid标注spirng在绑定对象时自动为我们验证对象属性并存放errors在BindingResult  */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("goodsChoosen") GoodsChoosen goodsChoosen, 
			RedirectAttributes redirectAttributes, BindingResult errors, ModelMap model) {
		goodsChoosenService.save(goodsChoosen);
		redirectAttributes.addFlashAttribute("message", "更新成功");
		return "redirect:/goods/goodschoosen";
	}
	
	
	/** 删除 */
	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") java.lang.Long id, RedirectAttributes redirectAttributes) {
		goodsChoosenService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除成功");
		return "redirect:/goods/goodschoosen";
	}
	

	/** 批量删除 */
	@RequestMapping(value = "delete", method=RequestMethod.DELETE)
	public String batchDelete(ModelMap model,@RequestParam("items") java.lang.Long[] items,
			RedirectAttributes redirectAttributes) {
		for(int i = 0; i < items.length; i++) {
			goodsChoosenService.delete(items[i]);
		}
		redirectAttributes.addFlashAttribute("message", "删除成功");
		return "redirect:/goods/goodschoosen";
	}
	
	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出menu对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getGoodsChoosen(@RequestParam(value = "id", defaultValue = "-1") java.lang.Long id, Model model) {
		if (id != -1) {
			model.addAttribute("goodsChoosen", goodsChoosenService.get(id));
		}
	}
}

