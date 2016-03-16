package com.iac.letaoyp.entity.user;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Max;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.iac.letaoyp.entity.IdEntity;
import com.iac.letaoyp.entity.info.Area;

/**
 *
 * @author dingp email:dingp@51box.cn
 * @version 1.0
 * @since 1.0
 * * 人员表
 */
@Entity
@Table(name = "member")
public class Member extends IdEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8309276260206282026L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * username       db_column: username 
     */ 	
	@NotBlank @Length(max=64)
	private java.lang.String username;
    /**
     * password       db_column: password 
     */ 	
	@Length(max=255)
	private java.lang.String password;
	
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
	private Gender gender;
    /**
     * isLocked       db_column: is_locked 
     */ 	
	private java.lang.Boolean isLocked;
    /**
     * lockedDate       db_column: locked_date 
     */ 	
	private java.util.Date lockedDate;
    /**
     * loginDate       db_column: login_date 
     */ 	
	private java.util.Date loginDate;
    /**
     * loginFailureCount       db_column: login_failure_count 
     */ 	
	@Max(9999999999L)
	private java.lang.Integer loginFailureCount;
    /**
     * loginIp       db_column: login_ip 
     */ 	
	@Length(max=255)
	private java.lang.String loginIp;
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
	@Length(max=255)
	private java.lang.String registerIp;
    /**
     * zipCode       db_column: zip_code 
     */ 	
	@Length(max=255)
	private java.lang.String zipCode;
	//columns END
	
	@Column(name = "username")
	public java.lang.String getUsername() {
		return this.username;
	}
	
	public void setUsername(java.lang.String value) {
		this.username = value;
	}
	
	@Column(name = "password")
	public java.lang.String getPassword() {
		return this.password;
	}
	
	public void setPassword(java.lang.String value) {
		this.password = value;
	}
	
	@Transient
	public String getPlainPassword() {
		return plainPassword;
	}

	public void setPlainPassword(String plainPassword) {
		this.plainPassword = plainPassword;
	}

	@Column(name = "salt")
	public java.lang.String getSalt() {
		return this.salt;
	}
	
	public void setSalt(java.lang.String value) {
		this.salt = value;
	}
	
	@Column(name = "address")
	public java.lang.String getAddress() {
		return this.address;
	}
	
	public void setAddress(java.lang.String value) {
		this.address = value;
	}
	
	@Column(name = "birth")
	public java.util.Date getBirth() {
		return this.birth;
	}
	
	public void setBirth(java.util.Date value) {
		this.birth = value;
	}
	
	@Column(name = "email")
	public java.lang.String getEmail() {
		return this.email;
	}
	
	public void setEmail(java.lang.String value) {
		this.email = value;
	}
	
	@Column(name = "gender")
	@Enumerated(EnumType.STRING)
	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	@Column(name = "is_locked")
	public java.lang.Boolean getIsLocked() {
		return this.isLocked != null && isLocked;
	}
	
	public void setIsLocked(java.lang.Boolean value) {
		this.isLocked = value;
	}
	
	@Column(name = "locked_date")
	public java.util.Date getLockedDate() {
		return this.lockedDate;
	}
	
	public void setLockedDate(java.util.Date value) {
		this.lockedDate = value;
	}
	
	@Column(name = "login_date")
	public java.util.Date getLoginDate() {
		return this.loginDate;
	}
	
	public void setLoginDate(java.util.Date value) {
		this.loginDate = value;
	}
	
	@Column(name = "login_failure_count")
	public java.lang.Integer getLoginFailureCount() {
		return this.loginFailureCount;
	}
	
	public void setLoginFailureCount(java.lang.Integer value) {
		this.loginFailureCount = value;
	}
	
	@Column(name = "login_ip")
	public java.lang.String getLoginIp() {
		return this.loginIp;
	}
	
	public void setLoginIp(java.lang.String value) {
		this.loginIp = value;
	}
	
	@Column(name = "mobile")
	public java.lang.String getMobile() {
		return this.mobile;
	}
	
	public void setMobile(java.lang.String value) {
		this.mobile = value;
	}
	
	@Column(name = "phone")
	public java.lang.String getPhone() {
		return this.phone;
	}
	
	public void setPhone(java.lang.String value) {
		this.phone = value;
	}
	
	@Column(name = "nick")
	public java.lang.String getNick() {
		return this.nick;
	}
	
	public void setNick(java.lang.String value) {
		this.nick = value;
	}
	
	@Column(name = "register_ip")
	public java.lang.String getRegisterIp() {
		return this.registerIp;
	}
	
	public void setRegisterIp(java.lang.String value) {
		this.registerIp = value;
	}
	
	@Column(name = "zip_code")
	public java.lang.String getZipCode() {
		return this.zipCode;
	}
	
	public void setZipCode(java.lang.String value) {
		this.zipCode = value;
	}
	
	private Area area;
	public void setArea(Area area){
		this.area = area;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "area") 
	})
	public Area getArea() {
		return area;
	}
	
	@PrePersist
	public void prePersistence() {
		if(this.created == null) 
			this.created = new Date();
		
		if(this.modified == null)
			this.modified = new Date();
		
		if(this.gender == null) 
			this.gender = Gender.MALE;
		
		if(this.loginDate == null)
			this.loginDate = new Date();
		
		this.loginFailureCount = 0;
		this.isLocked = false;
		this.active = true;
	}
	
	@PreUpdate
	public void preUpdate() {
		this.modified = new Date();
	}
	
	public enum Gender {
		MALE, FEMALE
	}
}

