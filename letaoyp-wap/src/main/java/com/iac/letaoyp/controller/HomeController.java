package com.iac.letaoyp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iac.letaoyp.entity.sku.Category;
import com.iac.letaoyp.service.sku.CategoryService;

@Controller
@RequestMapping
public class HomeController extends AbstractController {

	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping
	public String home(Model model) {
		List<Category> list = categoryService.findHomeShown();
		model.addAttribute("homeShown", list);
		return "index";
	}
}
