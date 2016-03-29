package com.iac.letaoyp.entity.admin;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;

import com.iac.letaoyp.entity.IdEntity;

@Entity
@Table(name = "s_log")
public class Log extends IdEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1884513114670748569L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 日志类型       db_column: type 
     */ 	
	@Length(max=64)
	private java.lang.String type;
    /**
     * 日志内容       db_column: content 
     */ 	
	@Length(max=512)
	private java.lang.String content;
    /**
     * 操作IP地址       db_column: remote_addr 
     */ 	
	@Length(max=64)
	private java.lang.String remoteAddr;
    /**
     * 用户代理       db_column: user_agent 
     */ 	
	@Length(max=256)
	private java.lang.String userAgent;
    /**
     * 请求URI       db_column: request_uri 
     */ 	
	@Length(max=256)
	private java.lang.String requestUri;
    /**
     * 操作方式       db_column: method 
     */ 	
	@Length(max=5)
	private java.lang.String method;
    /**
     * 参数       db_column: params 
     */ 	
	@Length(max=256)
	private java.lang.String params;
    /**
     * 异常信息       db_column: exception 
     */ 	
	@Length(max=65535)
	private java.lang.String exception;
    /**
     * 创建者       db_column: creator 
     */ 	
	@Length(max=64)
	private java.lang.String creator;
	//columns END

	@Column(name = "type")
	public java.lang.String getType() {
		return this.type;
	}
	
	public void setType(java.lang.String value) {
		this.type = value;
	}
	
	@Column(name = "content")
	public java.lang.String getContent() {
		return this.content;
	}
	
	public void setContent(java.lang.String value) {
		this.content = value;
	}
	
	@Column(name = "remote_addr")
	public java.lang.String getRemoteAddr() {
		return this.remoteAddr;
	}
	
	public void setRemoteAddr(java.lang.String value) {
		this.remoteAddr = value;
	}
	
	@Column(name = "user_agent")
	public java.lang.String getUserAgent() {
		return this.userAgent;
	}
	
	public void setUserAgent(java.lang.String value) {
		this.userAgent = value;
	}
	
	@Column(name = "request_uri")
	public java.lang.String getRequestUri() {
		return this.requestUri;
	}
	
	public void setRequestUri(java.lang.String value) {
		this.requestUri = value;
	}
	
	@Column(name = "method")
	public java.lang.String getMethod() {
		return this.method;
	}
	
	public void setMethod(java.lang.String value) {
		this.method = value;
	}
	
	@Column(name = "params")
	public java.lang.String getParams() {
		return this.params;
	}
	
	public void setParams(java.lang.String value) {
		this.params = value;
	}
	
	@Column(name = "exception")
	public java.lang.String getException() {
		return this.exception;
	}
	
	public void setException(java.lang.String value) {
		this.exception = value;
	}
	
	@Column(name = "creator")
	public java.lang.String getCreator() {
		return this.creator;
	}
	
	public void setCreator(java.lang.String value) {
		this.creator = value;
	}
	
}

