package com.iac.letaoyp.security;

import java.io.PrintWriter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.web.filter.authc.AuthenticationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springside.modules.mapper.JsonMapper;

import com.iac.letaoyp.biz.web.AjaxResult;

public class AjaxAuthenticationFilter extends AuthenticationFilter {

	final static Logger logger = LoggerFactory.getLogger(AjaxAuthenticationFilter.class);
	private JsonMapper jsonMapper = JsonMapper.nonEmptyMapper();
	
	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		String requestedContentType = request.getContentType();
		boolean isAjaxRequest = "XMLHttpRequest".equals(((HttpServletRequest) request).getHeader("X-Requested-With"));
		if ((requestedContentType != null && requestedContentType.startsWith("application/json")) || isAjaxRequest) {
			logger.info("Access denied - probably a session expiration - on a json type request.  "
					+ "Sending redirect request message.");
			setSuccessUrl("/");
			response.setContentType("application/json");
			PrintWriter writer = response.getWriter();
			writer.print(jsonMapper.toJson(AjaxResult.SESSION_EXPIRED));
            
			HttpServletResponse httpServletResponse = (HttpServletResponse) response;
			httpServletResponse.sendError(HttpServletResponse.SC_UNAUTHORIZED);
			return false;
		}
		return true;
	}

}
