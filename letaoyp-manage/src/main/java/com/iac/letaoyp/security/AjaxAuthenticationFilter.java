package com.iac.letaoyp.security;

import java.io.PrintWriter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.web.filter.authc.AuthenticationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AjaxAuthenticationFilter extends AuthenticationFilter {

	final static Logger logger = LoggerFactory.getLogger(AjaxAuthenticationFilter.class);
	
	@Override
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {
		String requestedContentType = request.getContentType();
		boolean isAjaxRequest = "XMLHttpRequest".equals(((HttpServletRequest) request).getHeader("X-Requested-With"));
		if ((requestedContentType != null && requestedContentType.startsWith("application/json")) || isAjaxRequest) {
			logger.info("Access denied - probably a session expiration - on a json type request.  "
					+ "Sending redirect request message.");
			setSuccessUrl("/");
			response.setContentType("application/json");
			PrintWriter writer = response.getWriter();
            
			// 偷懒的做法 原本是要跳转到登录页面  但由于是异步请求 边直接跳转到登录成功页面 再由shiro拦截到登录页面
			// 登录成功后 便跳转到首页了  XXX: bad things
            String loginSuccessUrl = this.getSuccessUrl();
            if (loginSuccessUrl.charAt(0) != '/') {
            	loginSuccessUrl = "/" + loginSuccessUrl;
            }
            writer.print("{ \"redirect\": " + "\"" + loginSuccessUrl + "\" }");
            
			return false;
		}
		return true;
	}

}
