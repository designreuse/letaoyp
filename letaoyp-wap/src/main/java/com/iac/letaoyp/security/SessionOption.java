package com.iac.letaoyp.security;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 
 * @author sihai
 *
 */
@Target({ElementType.TYPE, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SessionOption {
	
	/**
	 * 
	 * @return default true
	 */
	boolean value() default true;
	
	/**
	 * 需要绑定手机号
	 * @return default false
	 */
	boolean needBind() default false;
	
	/**
	 * @return default false
	 */
	boolean actualLogin() default false;
}
