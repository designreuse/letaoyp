package com.iac.letaoyp.util;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class Servlets extends org.springside.modules.web.Servlets {

	public static final String X_REAL_IP = "X-Real-IP";
    public static final String X_FORWARDED_FOR = "X-Forwarded-For";
	
	public static void setCookie(String key, String value, int time, TimeUnit unit) {
		HttpServletResponse response = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getResponse();
		Cookie cookie = new Cookie(key, value);
		cookie.setMaxAge((int)unit.toSeconds(time));
		response.addCookie(cookie);
	}
	
	public static String getCookie(String key) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		Cookie[] cookies = request.getCookies();
		
		for(Cookie c : cookies) {
			if(c.getName().equals(key)) {
				return c.getValue();
			}
		}
		
		return "";
	}
	
	/**
	 * 获取远程访问IP 前段有负载均衡时获取负载服务转发后的IP地址
	 */
	public static String getRemoteAddress() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        String remoteIp = request.getHeader(X_REAL_IP); //nginx反向代理
        if (StringUtils.isNotBlank(remoteIp)) {
            return remoteIp;
        } else {
            remoteIp = request.getHeader(X_FORWARDED_FOR);//apache反射代理
            if (StringUtils.isNotBlank(remoteIp)) {
                String[] ips = remoteIp.split(",");
                for (String ip : ips) {
                    if (!"null".equalsIgnoreCase(ip)) {
                        return ip;
                    }
                }
            }
            return request.getRemoteAddr();
        }
    }
	
	/**
	 * 获取相对地址与参数
	 * 
	 * @param request
	 * @return	example /activity?from=llgj return /activity
	 * @throws IOException
	 */
	public static String getRelativeUrl(HttpServletRequest request) {
		String result = request.getRequestURI().substring(request.getContextPath().length());
		int index = result.indexOf(";");
		if(index != -1) {
			result = result.substring(0, index);
		}
		return result;
	}
	
	/**
	 * 获取访问全地址 不包括参数
	 * 
	 * @param request
	 * @return example http://3g.k189.cn:8100/flow-service-wap/index
	 */
	public static String getCompleteUrl(HttpServletRequest request) {
		return getDomainUrl(request) + request.getRequestURI();
	}
	
	public static String getDomainUrl(HttpServletRequest request) {
		return request.getScheme() + "://"
				+ request.getServerName() + 
				(request.getServerPort() == 80 ? "" : ":" + request.getServerPort())
				;
	}
	
	/**
	 * 获取 http://域名：端口/context
	 * 
	 * @param request
	 * @return	example http://3g.k189.cn:8100/flow-service-assets-query
	 */
	public static String getRequestContext(HttpServletRequest request) {
		return getDomainUrl(request) + request.getContextPath();
	}
}
