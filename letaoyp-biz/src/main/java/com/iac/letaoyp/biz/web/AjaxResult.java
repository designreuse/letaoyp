package com.iac.letaoyp.biz.web;

import java.util.HashMap;
import java.util.Map;

public class AjaxResult {
	
	private boolean success = true;
	private boolean sessionExpired = false;
	private String redirect;
	
	/**
	 * 错误提示
	 */
	private String msg;
	
	/**
	 * 数据
	 */
	private Object data;
	
	/**
	 * 属性
	 */
	private Map<String, Object> attribute;
	
	public static final AjaxResult SUCCEED = AjaxResult.succeed(null);
	public static final AjaxResult ERROR_PARAM = AjaxResult.fail("[ERROR parameter]");
	public static final AjaxResult SESSION_EXPIRED = new AjaxResult(false, true, "session 失效，请重新登录", null);
	
	public AjaxResult() {
		super();
	}

	public AjaxResult(boolean success, String msg, Object data) {
		super();
		this.success = success;
		this.msg = msg;
		this.data = data;
	}

	public AjaxResult(boolean success, boolean sessionExpired, String msg, Object data) {
		super();
		this.success = success;
		this.sessionExpired = sessionExpired;
		this.msg = msg;
		this.data = data;
	}

	public static AjaxResult succeed(Object data) {
		return new AjaxResult(true, null, data);
	}
	
	public static AjaxResult succeed() {
		return SUCCEED;
	}
	
	public static AjaxResult fail(String msg) {
		return new AjaxResult(false, msg, null);
	}
	
	/**
	 * Invoked before using attribute property
	 */
	private void check() {
		if(attribute == null) {
			synchronized (this) {
				if(attribute == null) {
					attribute = new HashMap<String, Object>();
				}
			}
		}
	}
	
	public AjaxResult addAttribute(String key, Object value) {
		check();
		
		attribute.put(key, value);
		return this;
	}
	
	public AjaxResult addAllAttribute(Map<String, Object> map) {
		check();
		
		attribute.putAll(map);
		return this;
	}

	public String getMsg() {
		return msg;
	}

	public AjaxResult setMsg(String msg) {
		this.msg = msg;
		return this;
	}

	public Object getData() {
		return data;
	}

	public AjaxResult setData(Object data) {
		this.data = data;
		return this;
	}

	public Map<String, Object> getAttribute() {
		return attribute;
	}

	public AjaxResult setAttribute(Map<String, Object> attribute) {
		this.attribute = attribute;
		return this;
	}

	public boolean isSuccess() {
		return success;
	}

	public AjaxResult setSuccess(boolean success) {
		this.success = success;
		return this;
	}

	public boolean isSessionExpired() {
		return sessionExpired;
	}

	public void setSessionExpired(boolean sessionExpired) {
		this.sessionExpired = sessionExpired;
	}

	public String getRedirect() {
		return redirect;
	}

	public AjaxResult setRedirect(String redirect) {
		this.redirect = redirect;
		return this;
	}
	
}
