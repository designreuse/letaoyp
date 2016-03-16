package com.iac.letaoyp.controller.user;

import org.hibernate.validator.constraints.NotBlank;

public class LoginForm {

	@NotBlank
	private String username;
	@NotBlank
	private String password;
	/**
	 * when try more than 3 times
	 */
	private String captchas;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCaptchas() {
		return captchas;
	}
	public void setCaptchas(String captchas) {
		this.captchas = captchas;
	}
}
