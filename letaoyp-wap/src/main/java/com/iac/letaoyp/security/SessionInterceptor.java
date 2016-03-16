package com.iac.letaoyp.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springside.modules.mapper.JsonMapper;
import org.springside.modules.utils.Encodes;

import com.iac.letaoyp.biz.web.AjaxResult;

/**
 * Store in session with {@code sessionKey} must be subclass of {@link Principal}
 * @author sihai
 *
 */
public class SessionInterceptor extends HandlerInterceptorAdapter {

	private JsonMapper jsonMapper = JsonMapper.nonEmptyMapper();
	
	//
	public static interface LoginURLProvider {
		
		/**
		 * 
		 * @param request
		 * @return
		 */
		String getURL(HttpServletRequest request);
		
		String getBindURL(HttpServletRequest request);
	}
	
	/**
	 * 
	 */
	private String defaultLoginURL;
	
	private String defaultBindURL;
	
	/**
	 * 
	 */
	private LoginURLProvider loginURLProvider;
	
	/**
	 * 
	 */
	private String sessionKey;
	
	/**
	 * 
	 */
	private boolean isForceAjax = false;
	
	public void setDefaultLoginURL(String defaultLoginURL) {
		this.defaultLoginURL = defaultLoginURL;
	}
	
	public void setLoginURLProvider(LoginURLProvider loginURLProvider) {
		this.loginURLProvider = loginURLProvider;
	}
	
	public void setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
	}

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		if (handler instanceof HandlerMethod == false) {
            return true;
        }
		//方法级SessionOption 高于class层次
        HandlerMethod hm = (HandlerMethod) handler;
        SessionOption so = hm.getMethodAnnotation(SessionOption.class);
        
        if (null == so) {
        	so = hm.getBean().getClass().getAnnotation(SessionOption.class);
		}
        
        if(null == so || !so.value()) {
        	return true;
        }
        
        Principal principal = (Principal)request.getSession().getAttribute(this.sessionKey);
        
        if(principal == null || (so.actualLogin() && !principal.isActualLogin())) {
        	if(this.isAjax(request)) {
				AjaxResult result = AjaxResult.SESSION_EXPIRED.setRedirect(this.getLoginURL(request));
				if(principal != null) {
					result.setMsg("为确保账户安全，请先登录");
				}
				
        		response.getOutputStream().write(jsonMapper.toJson(result).getBytes());
        		response.addHeader("status", "access_denied");
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
        	} else {
        		response.sendRedirect(this.getLoginURL(request));
        	}
        	
        	return false;
        }
        
        if(so.needBind() && !principal.isBind()) {
        	if(this.isAjax(request)) {
				String json = jsonMapper.toJson(AjaxResult.fail("Need bind").setRedirect(this.getBindURL(request)));
				response.getOutputStream().write(json.getBytes());
				
				response.addHeader("status", "not_bind");
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
        	} else {
        		response.sendRedirect(this.getBindURL(request));
        	}
        	
        	return false;
        }
        
        return true;
	}
	
	/**
	 * 
	 * @param request
	 * @return Be careful, here havn't prepend url with request context (project name) 
	 */
	private String getBindURL(HttpServletRequest request) {
		String url = null;
		
		if(null == this.loginURLProvider) {
			url = this.defaultBindURL;
		} else {
			url = StringUtils.defaultIfBlank(this.loginURLProvider.getBindURL(request), this.defaultBindURL);
		}
		
		return url;
	}

	/**
	 * 
	 * @param request
	 * @return Be careful, here havn't prepend url with request context (project name) 
	 */
	private String getLoginURL(HttpServletRequest request) {
		String url = null;
		
		if(null == this.loginURLProvider) {
			url = this.defaultLoginURL;
		} else {
			url = StringUtils.defaultIfBlank(this.loginURLProvider.getURL(request), this.defaultLoginURL);
		}
		
		if (request.getMethod().equalsIgnoreCase("GET")) {
			String redirectUrl = request.getQueryString() != null ? request.getRequestURI() + "?" + request.getQueryString() : request.getRequestURI();
			url = url + "?" + Principal.PARAMETER_REDIRECT_KEY + "=" + Encodes.urlEncode(redirectUrl);
		} else {
			//post delete or other method , let return index page after login
		}
		
		return url;
	}
	
	/**
	 * 
	 * @param request
	 */
	private boolean isAjax(HttpServletRequest request) {
		return this.isForceAjax || StringUtils.equals("XMLHttpRequest", request.getHeader("X-Requested-With"));
	}
	
	public void setForceAjax(boolean isForceAjax) {
		this.isForceAjax = isForceAjax;
	}

	public void setDefaultBindURL(String defaultBindURL) {
		this.defaultBindURL = defaultBindURL;
	}
}
