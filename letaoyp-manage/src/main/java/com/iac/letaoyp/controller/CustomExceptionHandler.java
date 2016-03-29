package com.iac.letaoyp.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springside.modules.mapper.JsonMapper;
import org.springside.modules.web.MediaTypes;

import com.google.common.collect.Maps;
import com.iac.letaoyp.biz.web.AjaxResult;
import com.iac.letaoyp.security.ShiroDbRealm.ShiroUser;
import com.iac.letaoyp.service.ServiceException;

@ControllerAdvice
public class CustomExceptionHandler {

	private Logger logger = LoggerFactory.getLogger(CustomExceptionHandler.class);
	
	private JsonMapper jsonMapper = new JsonMapper();

	@ExceptionHandler(value = { ServiceException.class })
	public final String handleServiceException(ServiceException ex, HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 注入servletRequest，用于出错时打印请求URL与来源地址  
		logError(ex, request);

		String requestedContentType = request.getContentType();
		boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if ((requestedContentType != null && requestedContentType.startsWith("application/json")) || isAjaxRequest) {
			response.setContentType(MediaTypes.JSON_UTF_8);
			response.getWriter().print(jsonMapper.toJson(AjaxResult.fail(ex.getMessage())));
			return null;
		}
		
		return "error/500";
	}
	
	@ExceptionHandler(value = { Exception.class })
	public final String handleException(Exception ex, HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 注入servletRequest，用于出错时打印请求URL与来源地址  
		logError(ex, request);

		String requestedContentType = request.getContentType();
		boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if ((requestedContentType != null && requestedContentType.startsWith("application/json")) || isAjaxRequest) {
			response.setContentType(MediaTypes.JSON_UTF_8);
			response.getWriter().print(jsonMapper.toJson(AjaxResult.fail(ex.getMessage())));
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return null;
		}
		
		return "error/500";
	}

	public void logError(Exception ex, HttpServletRequest request) {
		Map<String, String> map = Maps.newHashMap();
		map.put("message", ex.getMessage());
		map.put("from", request.getRemoteAddr());
		String queryString = request.getQueryString();
		map.put("path", queryString != null ? (request.getRequestURI() + "?" + queryString) : request.getRequestURI());
		ShiroUser user = (ShiroUser)SecurityUtils.getSubject().getPrincipal();
		map.put("user", user == null ? "" : user.getName());
		
		logger.error(jsonMapper.toJson(map), ex);
	}
}
