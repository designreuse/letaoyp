package com.iac.letaoyp.controller.sku;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.modules.web.Servlets;

import com.iac.letaoyp.biz.web.AjaxResult;
import com.iac.letaoyp.controller.AbstractController;
import com.iac.letaoyp.entity.sku.BrandCategory;
import com.iac.letaoyp.entity.sku.Category;
import com.iac.letaoyp.entity.sku.Goods;
import com.iac.letaoyp.entity.sku.GoodsTop;
import com.iac.letaoyp.service.sku.BrandCategoryService;
import com.iac.letaoyp.service.sku.CategoryService;
import com.iac.letaoyp.service.sku.GoodsService;
import com.iac.letaoyp.service.sku.GoodsTopService;
import com.iac.letaoyp.util.CollectionsUtil;

@Controller
@RequestMapping("sku/category")
public class CategoryController extends AbstractController {
	
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private GoodsTopService goodsTopService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private BrandCategoryService brandCategoryService;
	
	@RequestMapping("listTop2Level")
	@ResponseBody
	public AjaxResult listTop2Level() {
		List<Category> list = categoryService.findByActiveOrderBySortDesc(true);
		return AjaxResult.succeed(list);
	}
	
	/**
	 * 
	 * @param categoryId	only top1 level could be display on home page
	 * @param model
	 * @return
	 */
	@RequestMapping("ajax/homeShown/{categoryId}")
	public String homeShown(@PathVariable Long categoryId, Model model) {
		Category category = categoryService.get(categoryId);
		List<Category> categories = categoryService.findByParentAndActiveOrderBySortDesc(categoryId, true);
		
		List<Category> left = new ArrayList<Category>();
		List<Category> horizontal = new ArrayList<Category>();
		for(Category c : categories) {
			if(StringUtils.isNoneBlank(c.getLogo()) && left.size() <= 6) {
				left.add(c);
			}
			
			if(horizontal.size() <= 10) {
				horizontal.add(c);
			}
		}
		
		List<GoodsTop> topGoods = goodsTopService.findByCategoryAndActive(categoryId, true);
		Map<Object, List<GoodsTop>> map = CollectionsUtil.extract(topGoods, "position");
		
		model.addAttribute("rootCategory", category);
		model.addAttribute("leftCategory", left);
		model.addAttribute("horizontalCategory", horizontal);
		
		model.addAttribute("topLevel1", map.get(GoodsTop.Position.HOME_SLIDE));
		model.addAttribute("topLevel2", map.get(GoodsTop.Position.HOME_VERTICAL));
		model.addAttribute("topLevel3", map.get(GoodsTop.Position.HOME_HORIZONTAL));
		
		return "sku/category_home_shown";
	}
	
	@RequestMapping("{id}")
	public String list(@PathVariable Long id,
			@RequestParam(value="page", required=false, defaultValue="1") int pageNumber,
			@RequestParam(value="pageSize", required=false, defaultValue=DEFAULT_PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", required=false, defaultValue = DEFAULT_SORT_TYPE) String sortType,
			Model model, HttpServletRequest request) {
		Category category = categoryService.get(id);
		
		List<Category> categories = categoryService.findByParentAndActiveOrderBySortDesc(category.getParent(), true);
		if(!category.getIsLeaf()) {
			List<Category> children = categoryService.findByParentAndActiveOrderBySortDesc(id, true);
			model.addAttribute("children", children);
		}
		model.addAttribute("categories", categories);
		
		
		List<BrandCategory> brandCategories = brandCategoryService.findByCategory(id);
		model.addAttribute("category", category);
		model.addAttribute("brandCategories", brandCategories);
		
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		searchParams.put("EQ_category", id.toString());
		
		Page<Goods> page = goodsService.findPage(searchParams, pageNumber, pageSize, sortType);
		model.addAttribute("page", page);
		
		model.addAttribute("sortType", sortType);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		
		return "sku/category_list";
	}
	
	public enum GoodsSort {
		DEFAULT("shipping_time desc, id desc"),
		;
		private String sort;

		private GoodsSort(String sort) {
			this.sort = sort;
		}

		public String getSort() {
			return sort;
		}

		public void setSort(String sort) {
			this.sort = sort;
		}
	}
}
