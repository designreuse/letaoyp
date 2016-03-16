package com.iac.letaoyp.util;

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
}
