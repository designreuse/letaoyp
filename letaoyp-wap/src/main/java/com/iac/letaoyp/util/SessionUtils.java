package com.iac.letaoyp.util;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.iac.letaoyp.entity.sku.Goods;
import com.iac.letaoyp.entity.user.Cart;
import com.iac.letaoyp.entity.user.CartItem;
import com.iac.letaoyp.entity.user.Member;
import com.iac.letaoyp.security.GoodsHistory;
import com.iac.letaoyp.security.SessionPrincipal;
import com.iac.letaoyp.security.SessionPrincipal.LoginType;
import com.iac.letaoyp.service.ServiceException;
import com.iac.letaoyp.service.user.CartService;

/**
 * 
 * @author sihai
 *
 */
@Service
public class SessionUtils {
	
	@Autowired
	private CartService cartService;

	/**
	 * 
	 * @param request
	 * @param user
	 */
	public final void setupSession(Member member, LoginType login) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		SessionPrincipal sp = new SessionPrincipal(member, login);
		
		Cart cart = cartService.findByMemberWhitItems(member);
		sp.setCart(cart);
		request.getSession().setAttribute(SessionPrincipal.SESSION_KEY, sp);
	}
	
	public final void addSessionCart(CartItem cartItem) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		SessionPrincipal sp = (SessionPrincipal)request.getSession().getAttribute(SessionPrincipal.SESSION_KEY);
		
		if(sp == null || sp.getCart() == null) {
			throw new ServiceException("Wrong invoke for add cart , session is null");
		}
		sp.getCart().getItems().add(cartItem);
	}
	
	public void clearSessionCart(Long id) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		SessionPrincipal sp = (SessionPrincipal)request.getSession().getAttribute(SessionPrincipal.SESSION_KEY);
		if(id == null) {
			sp.getCart().getItems().clear();
		} else {
			Iterator<CartItem> iter = sp.getCart().getItems().iterator();
			while(iter.hasNext()) {
				CartItem item = iter.next();
				if(item.getId().longValue() == id.longValue()) {
					iter.remove();
					break;
				}
			}
		}
	}
	
	public SessionPrincipal getSessionPrincipal() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		SessionPrincipal sp = (SessionPrincipal)request.getSession().getAttribute(SessionPrincipal.SESSION_KEY);
		return sp;
	}
	
	/**
	 * 
	 * @param request
	 */
	public final void cleanSession() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		request.getSession().removeAttribute(SessionPrincipal.SESSION_KEY);
		
		clearVisitHistory();
	}

	/**
	 * visit list
	 */
	public void addVisitHistory(Goods goods) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		GoodsHistory history = (GoodsHistory)request.getSession().getAttribute(GoodsHistory.KEY_VISIT_HISTORY);
		if(history == null)
			history = new GoodsHistory();
		
		history.addVisit(goods);
		request.getSession().setAttribute(GoodsHistory.KEY_VISIT_HISTORY, history);
	}
	
	public void clearVisitHistory() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		request.getSession().removeAttribute(GoodsHistory.KEY_VISIT_HISTORY);
	}

} 
