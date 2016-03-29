package com.iac.letaoyp.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.iac.letaoyp.security.ShiroDbRealm.ShiroUser;

@Service
@Aspect
public class LogAspect {
	
//	@Pointcut(value="execution (* com.box.smart.hangzhou.controller..*.*(..)) "
//			+ "&& @annotation(requestMapping)")  
	public void controllerLogging(RequestMapping requestMapping) {}
	
	//@Around(value="controllerLogging(requestMapping)")
	
	@Around("execution (* com.iac.letaoyp.controller..*.*(..)) "
			+ "&& @annotation(requestMapping)")
    public Object controllerLoggingAround(ProceedingJoinPoint joinPoint, RequestMapping requestMapping) throws Throwable {
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        Throwable ex = null;
        Object result = null;
        try {
        	result = joinPoint.proceed();
        	return result;
        } catch(Throwable t) {
        	ex = t;
        	throw t;
        } finally {
	        stopWatch.stop();
	        try {
	        	logging(joinPoint, stopWatch.getTotalTimeMillis(), ex, result);
	        } catch(Throwable t) {
	        	//ignore it
	        	t.printStackTrace();
	        }
        }
    }
	
	private void logging(ProceedingJoinPoint joinPoint, long millis, Throwable ex, Object result) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		String action = request.getMethod();
		if(action.equalsIgnoreCase(HttpMethod.GET.name())) {
			//get 不要记录日志
			return;
		}
//		String url = WebUtils.getRelativeUrl(request);
		ShiroUser user = (ShiroUser)SecurityUtils.getSubject().getPrincipal();
		String method = joinPoint.getSignature().getName();
		
		System.out.println(String.format("************** ::: User [%s] opertaion method[%s] cost [%s]", user.getName(), method, millis));
//		Log log = new Log();
//		log.setType(LogType.MANAGER.name());
//		log.setRemoteAddr(WebUtils.getRemoteAddr(request));
//		log.setUserAgent(request.getHeader("User-Agent"));
//		log.setRequestUri(url);
//		log.setAction(action);
//		log.setMethod(method);
//		log.setClassName(joinPoint.getTarget().getClass().getName());
//		int beginIndex = url.startsWith("/") ? 1 : 0;
//		int endIndex = url.indexOf("/", 1);
//		endIndex = endIndex == -1 ? url.length() : endIndex;
//		log.setException(ex == null ? null : Exceptions.getStackTraceAsString(ex));
//		log.setCreatedBy(user == null ? "" : user.getName());
//		log.setCost(millis);
//		
//        String param = request.getQueryString();
//        String message = null;
//        // append args
//        Object[] args = joinPoint.getArgs();
//        for (int i = 0; i < args.length; i++) {
//        	Object arg = args[i];
//        	if(arg instanceof IdEntity) {
//        		param = "id:" + ((IdEntity)arg).getId();
//        	} else if(arg instanceof RedirectAttributes) {
//        		RedirectAttributes ra = (RedirectAttributes)arg;
//        		Map<String, ?> messages = ra.getFlashAttributes();
//        		if(!messages.isEmpty()) {
//        			message = (String)messages.get("message");
//        		}
//        	}
//        }
//        log.setMessage(message);
//        log.setParams(param);
	}
}
