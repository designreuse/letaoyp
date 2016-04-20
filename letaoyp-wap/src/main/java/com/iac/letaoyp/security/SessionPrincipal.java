package com.iac.letaoyp.security;

import org.apache.commons.lang3.StringUtils;

import com.iac.letaoyp.entity.user.Cart;
import com.iac.letaoyp.entity.user.Member;
import com.opentech.cloud.sox.common.configuration.annotation.SessionConfiguration;

@SessionConfiguration(key = SessionPrincipal.SESSION_KEY)
public class SessionPrincipal extends Principal {
	
	private static final long serialVersionUID = -6700903758172894385L;

	/**
	 * 
	 */
	public static final String SESSION_KEY = "_letaoyp_u_";
	
	private Member member;
	
	private LoginType loginType;
	
	private Cart cart;
	
	/**
	 * 如果有更新用户时，记录最后更新时间 以更新session信息
	 */
	private long lastUpdateTimestamp = System.currentTimeMillis();

	public SessionPrincipal() {
		super();
	}

	public SessionPrincipal(Member member, LoginType loginType) {
		super();
		this.member = member;
		this.loginType = loginType;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public long getLastUpdateTimestamp() {
		return lastUpdateTimestamp;
	}

	public void setLastUpdateTimestamp(long lastUpdateTimestamp) {
		this.lastUpdateTimestamp = lastUpdateTimestamp;
	}

	public LoginType getLoginType() {
		return loginType;
	}

	public void setLoginType(LoginType loginType) {
		this.loginType = loginType;
	}


	public enum LoginType {
		PC_LOGIN, COOKIE_AUTO_LOGIN, WECHAT_AUTO_LOGIN;
	}
	
	@Override
	public boolean isBind() {
		return member != null && StringUtils.isNotBlank(member.getPhone());
	}

	@Override
	public boolean isActualLogin() {
		return this.loginType == LoginType.PC_LOGIN;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}
}
