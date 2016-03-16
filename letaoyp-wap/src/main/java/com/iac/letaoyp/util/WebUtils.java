package com.iac.letaoyp.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.iac.letaoyp.entity.sku.Goods;
import com.iac.letaoyp.entity.user.Member;
import com.iac.letaoyp.security.GoodsHistory;
import com.iac.letaoyp.security.SessionPrincipal;
import com.iac.letaoyp.security.SessionPrincipal.LoginType;

/**
 * 
 * @author sihai
 *
 */
public class WebUtils {

	/**
	 * 
	 * @param request
	 * @param user
	 */
	public static final void setupSession(Member member, LoginType login) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		SessionPrincipal sp = new SessionPrincipal(member, login);
		
		request.getSession().setAttribute(SessionPrincipal.SESSION_KEY, sp);
	}
	
	/**
	 * 
	 * @param request
	 */
	public static final void cleanSession() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		request.getSession().removeAttribute(SessionPrincipal.SESSION_KEY);
		
		clearVisitHistory();
	}

	/**
	 * visit list
	 */
	public static void addVisitHistory(Goods goods) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		GoodsHistory history = (GoodsHistory)request.getSession().getAttribute(GoodsHistory.KEY_VISIT_HISTORY);
		if(history == null)
			history = new GoodsHistory();
		
		history.addVisit(goods);
		request.getSession().setAttribute(GoodsHistory.KEY_VISIT_HISTORY, history);
	}
	
	public static void clearVisitHistory() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		request.getSession().removeAttribute(GoodsHistory.KEY_VISIT_HISTORY);
	}
} 
