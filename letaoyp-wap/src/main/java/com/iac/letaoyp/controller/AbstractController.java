package com.iac.letaoyp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.iac.letaoyp.entity.user.Member;
import com.iac.letaoyp.security.SessionPrincipal;

public abstract class AbstractController {
	
	protected final String DEFAULT_PAGE_SIZE = "20";
	protected static final String DEFAULT_SORT_TYPE = "id desc";
	
	/**
	 * 判断是否登录
	 * @param request
	 * @return
	 */
	protected boolean isLogined() {
		return null != this.getCurrentUser();
	}
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	protected Member getCurrentUser() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		SessionPrincipal sp = (SessionPrincipal)request.getSession().getAttribute(SessionPrincipal.SESSION_KEY);
		return sp == null ? null : sp.getMember();
	}

}
