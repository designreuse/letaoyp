package com.iac.letaoyp.controller.user;

import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.modules.mapper.BeanMapper;
import org.springside.modules.utils.DateUtil;

import com.iac.letaoyp.controller.AbstractController;
import com.iac.letaoyp.entity.user.Member;
import com.iac.letaoyp.entity.user.Order;
import com.iac.letaoyp.security.SessionOption;
import com.iac.letaoyp.security.SessionPrincipal.LoginType;
import com.iac.letaoyp.service.user.MemberService;
import com.iac.letaoyp.service.user.OrderService;
import com.iac.letaoyp.util.Servlets;
import com.iac.letaoyp.util.SessionUtils;

/**
 * 
 * @author sihai
 *
 */
@Controller
@RequestMapping("user")
@SessionOption
public class UserController extends AbstractController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private SessionUtils sessionUtils;
	
	@RequestMapping
	public String index(Model model) {
		Member member = getCurrentUser();
		Long count = orderService.countByMemberIdAndCreatedGreaterThan(member.getId(), 
				DateUtil.addDays(DateUtil.truncate(new Date(), Calendar.DAY_OF_MONTH), -30)
				);
		
		model.addAttribute("orderCount", count);
		return "user/user";
	}
	
	
	@RequestMapping(value="register", method=RequestMethod.GET)
	@SessionOption(false)
	public String registerForm() {
		if(this.isLogined()) {
			return "redirect:/";
		}
		return "register";
	}
	
	/**
	 * 
	 * @param phone
	 * @return
	 */
	@RequestMapping("check/mobile")
	@ResponseBody
	@SessionOption(false)
	public String checkPhone(@RequestParam("mobile")String mobile) {
		if(memberService.findByMobile(mobile) == null) 
			return Boolean.TRUE.toString();
		
		return "手机号已存在";
	}
	
	/**
	 * 
	 * @param username
	 * @return
	 */
	@RequestMapping("check/username")
	@ResponseBody
	@SessionOption(false)
	public String checkUsername(@RequestParam("username")String username) {
		if(memberService.getByUsername(username) == null) 
			return Boolean.TRUE.toString();
		
		return "用户名已存在";
	}
	
	/**
	 * 
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping("register")
	@SessionOption(false)
	public String register(Model model, @Valid Member user) {
		if(this.isLogined() || StringUtils.isBlank(user.getPlainPassword())) {
			return "redirect:/";
		}
		
		user.setRegisterIp(Servlets.getRemoteAddress());
		user.setLoginIp(user.getRegisterIp());
		user.setLoginDate(new Date());
		
		this.memberService.register(user);
		sessionUtils.setupSession(user, LoginType.PC_LOGIN);
		return "redirect:/";
	}
	
	@RequestMapping(value="profile", method=RequestMethod.GET)
	@SessionOption(true)
	public String profileForm() {
		return "user/profile";
	}
	
	@RequestMapping(value="profile", method=RequestMethod.POST)
	public String profile(@Valid MemberSettings memberSettings) {
		Member current = getCurrentUser();
		
		BeanMapper.copy(memberSettings, current);
		memberService.update(current);
		return "redirect:/user";
	}
	
	@RequestMapping("order")
	public String myOrder(
			@RequestParam(value="pageNumber", required=false, defaultValue="1") int pageNumber,
			@RequestParam(value="pageSize", required=false, defaultValue=DEFAULT_PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", required=false, defaultValue = DEFAULT_SORT_TYPE) String sortType,
			Model model, HttpServletRequest request) {
		Member member = getCurrentUser();
		
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		searchParams.put("EQ_member.id", member.getId().toString());
		searchParams.put("EQ_active", Boolean.TRUE.toString());
		
		Page<Order> page = orderService.findPage(searchParams, pageNumber, pageSize, sortType);
		model.addAttribute("page", page);
		model.addAttribute("sortType", sortType);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		return "user/order";
	}
}
