package com.iac.letaoyp.controller.sku;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iac.letaoyp.biz.web.AjaxResult;
import com.iac.letaoyp.controller.AbstractController;
import com.iac.letaoyp.entity.sku.Goods;
import com.iac.letaoyp.entity.sku.GoodsChoosen;
import com.iac.letaoyp.entity.sku.GoodsImage;
import com.iac.letaoyp.service.sku.CategoryService;
import com.iac.letaoyp.service.sku.GoodsChoosenService;
import com.iac.letaoyp.service.sku.GoodsImageService;
import com.iac.letaoyp.service.sku.GoodsService;
import com.iac.letaoyp.util.CollectionsUtil;
import com.iac.letaoyp.util.WebUtils;

@Controller
@RequestMapping("sku/goods")
public class GoodsController extends AbstractController {
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private GoodsImageService goodsImageService;
	
	@Autowired
	private GoodsChoosenService goodsChoosenService;
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("{id}")
	public String detail(@PathVariable("id") Long id, HttpServletRequest request,  Model model) {
		Goods goods = goodsService.get(id);
		model.addAttribute("goods", goods);
		
		if(goods == null) {
			return "goods_deleted";
		}
		model.addAttribute("category", categoryService.get(goods.getCategory()));
		
		List<GoodsImage> images = goodsImageService.findByGoods(id);
		model.addAttribute("images", images);
		
		List<GoodsChoosen> list = goodsChoosenService.findByGoodsId(id);
		Map<Object, List<GoodsChoosen>> choosen = CollectionsUtil.extractToMap(list, "name");
		model.addAttribute("choosen", choosen);
		
		WebUtils.addVisitHistory(goods);
		return "sku/goods_detail";
	}
	
	@RequestMapping("clearVisitHistory")
	public AjaxResult clearVisitHistory() {
		WebUtils.clearVisitHistory();
		
		return AjaxResult.succeed();
	}
}
