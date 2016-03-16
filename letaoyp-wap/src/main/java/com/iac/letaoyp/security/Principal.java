package com.iac.letaoyp.security;

import java.io.Serializable;

public abstract class Principal implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5330115710055152580L;
	/**
	 *	/user/login?redirect=encode(original url)
	 */
	public static final String PARAMETER_REDIRECT_KEY = "redirect";

	public static final String ACCOUNT_COOKIE_KEY = "login_account";
	
	public abstract boolean isBind();
	
	/**
	 * Unsupported now
	 * @return
	 */
	public abstract boolean isActualLogin();
}
