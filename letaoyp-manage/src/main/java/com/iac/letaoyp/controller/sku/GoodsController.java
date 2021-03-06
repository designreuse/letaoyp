package com.iac.letaoyp.controller.sku;

import java.util.List;
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
import com.iac.letaoyp.entity.sku.Goods;
import com.iac.letaoyp.entity.sku.GoodsImage;
import com.iac.letaoyp.service.sku.GoodsImageService;
import com.iac.letaoyp.service.sku.GoodsService;


@Controller
@RequestMapping("sku/goods")
public class GoodsController extends BasicController {
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private GoodsImageService goodsImageService;
	
	/** 列表 */
	@RequestMapping
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = DEFAULT_PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = DEFAULT_SORT_TYPE) String sortType,
			Model model, ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Page<Goods> page = goodsService.findPage(searchParams, pageNumber, pageSize, sortType);
				
		model.addAttribute("page", page);
		model.addAttribute("sortType", sortType);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		return "sku/goodsList";
	}
	
	@RequestMapping(value="/create", method = RequestMethod.GET)
	public String createForm(ModelMap model) {
		return "sku/goodsForm";
	}
	
	@RequestMapping(value="update/{id}", method = RequestMethod.GET)
	public String updateForm(ModelMap model, @PathVariable java.lang.Long id) {
		Goods goods = goodsService.get(id);
		List<GoodsImage> goodsImages = goodsImageService.findByGoods(id);
		model.addAttribute("goods", goods);
		model.addAttribute("goodsImages", goodsImages);
		return "sku/goodsForm";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult update(@Valid @ModelAttribute("goods") Goods goods, 
			@RequestParam(value = "images", required = false) String[] images,
			@RequestParam(value = "sorts", required = false) Integer[] sorts,
			@RequestParam(value = "key", required = false) String[] keys,
			@RequestParam(value = "value", required = false) String[] values
			) {
		goodsService.save(goods, images, sorts, keys, values);
		return AjaxResult.SUCCEED;
	}
	
	@RequestMapping(value = "offline/{id}", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult offline(@PathVariable java.lang.Long id) {
		goodsService.updateStatus(id, Goods.Status.OFFLINE);
		return AjaxResult.SUCCEED;
	}
	
	@RequestMapping(value = "online/{id}", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult online(@PathVariable java.lang.Long id) {
		goodsService.updateStatus(id, Goods.Status.ONLINE);
		return AjaxResult.SUCCEED;
	}
	
	
	
	/** 删除 */
	@RequestMapping(value = "delete/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public AjaxResult delete(@PathVariable("id") java.lang.Long id) {
		goodsService.delete(id);
		return AjaxResult.succeed();
	}

	@RequestMapping(value = "delete", method=RequestMethod.POST)
	@ResponseBody
	public AjaxResult batchDelete(@RequestParam("ids") java.lang.Long[] ids) {
		if(ids == null || ids.length == 0) {
			return AjaxResult.ERROR_PARAM;
		}
		goodsService.delete(ids);
		return AjaxResult.succeed();
	}
	
	@RequestMapping(value = "settings", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult settings(@RequestParam("ids")Long[] ids, @RequestParam("active")boolean active) {
		if(ids == null || ids.length == 0) {
			return AjaxResult.ERROR_PARAM;
		}
		
		goodsService.updateActiveByIds(active, ids);
		return AjaxResult.succeed();
	}
	
	@RequestMapping(value = "untop/{id}", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult untop(@PathVariable Long id) {
		goodsService.untop(id);
		return AjaxResult.SUCCEED;
	}

	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,
	 * 先根据form的id从数据库查出menu对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getGoods(@RequestParam(value = "id", defaultValue = "-1") java.lang.Long id, Model model) {
		if (id != -1) {
			model.addAttribute("goods", goodsService.get(id));
		}
	}
}

