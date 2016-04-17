package com.iac.letaoyp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springside.modules.utils.Collections3;

import com.iac.letaoyp.entity.info.Advertise;
import com.iac.letaoyp.entity.sku.Category;
import com.iac.letaoyp.service.info.AdvertiseService;
import com.iac.letaoyp.service.sku.CategoryService;

@Controller
@RequestMapping
public class HomeController extends AbstractController {

	@Autowired
	private CategoryService categoryService;
	@Autowired
	private AdvertiseService advertiseService;
	
	@RequestMapping
	public String home(Model model) {
		List<Category> list = categoryService.findHomeShown();
		List<Advertise> topSlideAdvertises = advertiseService.findByModel(Advertise.Model.HOME_TOP_SLIDE);
		List<Long> categoryIds = Collections3.extractToList(list, "id");
		Map<Long, Advertise> categoryAdvertiseMap = new HashMap<Long, Advertise>();
		List<Advertise> categoryAdvertises = advertiseService.findBySequenceInAndModel(categoryIds, Advertise.Model.HOME_CATEGORY);
		for(Advertise a : categoryAdvertises) {
			categoryAdvertiseMap.put(a.getSequence(), a);
		}
		
		model.addAttribute("homeShown", list);
		model.addAttribute("topSlideAdvertises", topSlideAdvertises);
		model.addAttribute("categoryAdvertiseMap", categoryAdvertiseMap);
		return "index";
	}
}
