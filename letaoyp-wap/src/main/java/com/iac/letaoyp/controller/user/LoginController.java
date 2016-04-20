package com.iac.letaoyp.controller.user;

import java.util.concurrent.TimeUnit;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iac.letaoyp.entity.user.Member;
import com.iac.letaoyp.security.Principal;
import com.iac.letaoyp.security.SessionOption;
import com.iac.letaoyp.security.SessionPrincipal.LoginType;
import com.iac.letaoyp.service.ServiceException;
import com.iac.letaoyp.service.user.MemberService;
import com.iac.letaoyp.util.Servlets;
import com.iac.letaoyp.util.SessionUtils;

@Controller
@RequestMapping("user")
public class LoginController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private SessionUtils sessionUtils;

	@RequestMapping(value="login", method=RequestMethod.GET)
	@SessionOption(false)
	public String loginForm() {
		return "login";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	@SessionOption(false)
	public String login(@Valid LoginForm param, 
			@RequestParam(value="remember", required=false, defaultValue="false") boolean remember,
			@RequestParam(value=Principal.PARAMETER_REDIRECT_KEY, required=false, defaultValue="/") String redirect,
			RedirectAttributes flash) {
		Member member = null;
		try {
			member = memberService.login(param.getUsername(), param.getPassword(), param.getCaptchas());
		} catch(ServiceException se) {
			flash.addFlashAttribute("message", se.getMessage());
			return "redirect:/user/login?" + Principal.PARAMETER_REDIRECT_KEY + "=" + redirect;
		}
		
		if(remember) {
			Servlets.setCookie(Principal.ACCOUNT_COOKIE_KEY, member.getUsername(), 30, TimeUnit.DAYS);
		}
		sessionUtils.setupSession(member, LoginType.PC_LOGIN);
		
		return "redirect:" + redirect;
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout() {
		sessionUtils.cleanSession();
		
		return "redirect:/";
	}
}
