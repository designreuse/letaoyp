package com.iac.letaoyp.controller.admin;

import com.iac.letaoyp.biz.web.AjaxResult;

public class FileUploadResut extends AjaxResult {
	private Integer error;
	private String message;
	private String url;
	public FileUploadResut() {
	}
	
	public FileUploadResut(Integer error, String message) {
		super(error == 0, message, null);
		
		this.error = error;
		this.message = message;
	}
	
	public FileUploadResut(Integer error, String message, String url) {
		super(error == 0, message, url);
		this.error = error;
		this.message = message;
		this.url = url;
	}
	
	public FileUploadResut(Integer error, String message, String url, String redirect) {
		super(error == 0, message, url);
		super.setRedirect(redirect);
		this.error = error;
		this.message = message;
		this.url = url;
	}
	public Integer getError() {
		return error;
	}
	public void setError(Integer error) {
		this.error = error;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
