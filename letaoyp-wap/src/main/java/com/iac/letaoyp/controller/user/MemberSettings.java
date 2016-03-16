package com.iac.letaoyp.controller.user;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.iac.letaoyp.entity.user.Member;

public class MemberSettings {

	@Length(max=255)
	private String plainPassword;
    /**
     * 加密salt       db_column: salt 
     */ 	
	@Length(max=64)
	private java.lang.String salt;
    /**
     * 详细地址       db_column: address 
     */ 	
	@Length(max=255)
	private java.lang.String address;
    /**
     * birth       db_column: birth 
     */ 	
	private java.util.Date birth;
    /**
     * email       db_column: email 
     */ 	
	@NotBlank @Email @Length(max=64)
	private java.lang.String email;
    /**
     * gender       db_column: gender 
     */ 	
	@Length(max=20)
	private Member.Gender gender;
    /**
     * 电话       db_column: mobile 
     */ 	
	@NotBlank @Length(max=20)
	private java.lang.String mobile;
    /**
     * 手机       db_column: phone 
     */ 	
	@Length(max=20)
	private java.lang.String phone;
    /**
     * nick       db_column: nick 
     */ 	
	@Length(max=255)
	private java.lang.String nick;
    /**
     * registerIp       db_column: register_ip 
     */ 	
	@NotBlank @Length(max=255)
	private java.lang.String registerIp;
    /**
     * zipCode       db_column: zip_code 
     */ 	
	@Length(max=255)
	private java.lang.String zipCode;
	
	public String getPlainPassword() {
		return plainPassword;
	}
	public void setPlainPassword(String plainPassword) {
		this.plainPassword = plainPassword;
	}
	public java.lang.String getSalt() {
		return salt;
	}
	public void setSalt(java.lang.String salt) {
		this.salt = salt;
	}
	public java.lang.String getAddress() {
		return address;
	}
	public void setAddress(java.lang.String address) {
		this.address = address;
	}
	public java.util.Date getBirth() {
		return birth;
	}
	public void setBirth(java.util.Date birth) {
		this.birth = birth;
	}
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		this.email = email;
	}
	public Member.Gender getGender() {
		return gender;
	}
	public void setGender(Member.Gender gender) {
		this.gender = gender;
	}
	public java.lang.String getMobile() {
		return mobile;
	}
	public void setMobile(java.lang.String mobile) {
		this.mobile = mobile;
	}
	public java.lang.String getPhone() {
		return phone;
	}
	public void setPhone(java.lang.String phone) {
		this.phone = phone;
	}
	public java.lang.String getNick() {
		return nick;
	}
	public void setNick(java.lang.String nick) {
		this.nick = nick;
	}
	public java.lang.String getRegisterIp() {
		return registerIp;
	}
	public void setRegisterIp(java.lang.String registerIp) {
		this.registerIp = registerIp;
	}
	public java.lang.String getZipCode() {
		return zipCode;
	}
	public void setZipCode(java.lang.String zipCode) {
		this.zipCode = zipCode;
	}
}
