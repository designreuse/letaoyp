package com.iac.letaoyp.entity.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

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
	@NotBlank @Length(max=255)
	private java.lang.String password;
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
	private java.lang.String gender;
    /**
     * isLocked       db_column: is_locked 
     */ 	
	@NotNull 
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
	@NotNull @Max(9999999999L)
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
	@NotBlank @Length(max=255)
	private java.lang.String registerIp;
    /**
     * zipCode       db_column: zip_code 
     */ 	
	@Length(max=255)
	private java.lang.String zipCode;
    /**
     * attributeValue0       db_column: attribute_value0 
     */ 	
	@Length(max=255)
	private java.lang.String attributeValue0;
    /**
     * attributeValue1       db_column: attribute_value1 
     */ 	
	@Length(max=255)
	private java.lang.String attributeValue1;
    /**
     * attributeValue2       db_column: attribute_value2 
     */ 	
	@Length(max=255)
	private java.lang.String attributeValue2;
    /**
     * attributeValue3       db_column: attribute_value3 
     */ 	
	@Length(max=255)
	private java.lang.String attributeValue3;
    /**
     * attributeValue4       db_column: attribute_value4 
     */ 	
	@Length(max=255)
	private java.lang.String attributeValue4;
    /**
     * attributeValue5       db_column: attribute_value5 
     */ 	
	@Length(max=255)
	private java.lang.String attributeValue5;
    /**
     * attributeValue6       db_column: attribute_value6 
     */ 	
	@Length(max=255)
	private java.lang.String attributeValue6;
    /**
     * attributeValue7       db_column: attribute_value7 
     */ 	
	@Length(max=255)
	private java.lang.String attributeValue7;
    /**
     * attributeValue8       db_column: attribute_value8 
     */ 	
	@Length(max=255)
	private java.lang.String attributeValue8;
    /**
     * attributeValue9       db_column: attribute_value9 
     */ 	
	@Length(max=255)
	private java.lang.String attributeValue9;
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
	public java.lang.String getGender() {
		return this.gender;
	}
	
	public void setGender(java.lang.String value) {
		this.gender = value;
	}
	
	@Column(name = "is_locked")
	public java.lang.Boolean getIsLocked() {
		return this.isLocked;
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
	
	@Column(name = "attribute_value0")
	public java.lang.String getAttributeValue0() {
		return this.attributeValue0;
	}
	
	public void setAttributeValue0(java.lang.String value) {
		this.attributeValue0 = value;
	}
	
	@Column(name = "attribute_value1")
	public java.lang.String getAttributeValue1() {
		return this.attributeValue1;
	}
	
	public void setAttributeValue1(java.lang.String value) {
		this.attributeValue1 = value;
	}
	
	@Column(name = "attribute_value2")
	public java.lang.String getAttributeValue2() {
		return this.attributeValue2;
	}
	
	public void setAttributeValue2(java.lang.String value) {
		this.attributeValue2 = value;
	}
	
	@Column(name = "attribute_value3")
	public java.lang.String getAttributeValue3() {
		return this.attributeValue3;
	}
	
	public void setAttributeValue3(java.lang.String value) {
		this.attributeValue3 = value;
	}
	
	@Column(name = "attribute_value4")
	public java.lang.String getAttributeValue4() {
		return this.attributeValue4;
	}
	
	public void setAttributeValue4(java.lang.String value) {
		this.attributeValue4 = value;
	}
	
	@Column(name = "attribute_value5")
	public java.lang.String getAttributeValue5() {
		return this.attributeValue5;
	}
	
	public void setAttributeValue5(java.lang.String value) {
		this.attributeValue5 = value;
	}
	
	@Column(name = "attribute_value6")
	public java.lang.String getAttributeValue6() {
		return this.attributeValue6;
	}
	
	public void setAttributeValue6(java.lang.String value) {
		this.attributeValue6 = value;
	}
	
	@Column(name = "attribute_value7")
	public java.lang.String getAttributeValue7() {
		return this.attributeValue7;
	}
	
	public void setAttributeValue7(java.lang.String value) {
		this.attributeValue7 = value;
	}
	
	@Column(name = "attribute_value8")
	public java.lang.String getAttributeValue8() {
		return this.attributeValue8;
	}
	
	public void setAttributeValue8(java.lang.String value) {
		this.attributeValue8 = value;
	}
	
	@Column(name = "attribute_value9")
	public java.lang.String getAttributeValue9() {
		return this.attributeValue9;
	}
	
	public void setAttributeValue9(java.lang.String value) {
		this.attributeValue9 = value;
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
}

