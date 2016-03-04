package com.iac.letaoyp.entity.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

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
 * * 收货地址
 */
@Entity
@Table(name = "shipping_address")
public class ShippingAddress extends IdEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7126778469015569292L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 收货人       db_column: receiver 
     */ 	
	@Length(max=64)
	private java.lang.String receiver;
    /**
     * 详细地址       db_column: address 
     */ 	
	@Length(max=255)
	private java.lang.String address;
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
     * 标志建筑       db_column: buliding_flag 
     */ 	
	@Length(max=255)
	private java.lang.String bulidingFlag;
    /**
     * email       db_column: email 
     */ 	
	@Email @Length(max=64)
	private java.lang.String email;
    /**
     * zipCode       db_column: zip_code 
     */ 	
	@Length(max=255)
	private java.lang.String zipCode;
    /**
     * 预约送货时间       db_column: receive_time 
     */ 	
	@Length(max=255)
	private java.lang.String receiveTime;
	//columns END

	
	@Column(name = "receiver")
	public java.lang.String getReceiver() {
		return this.receiver;
	}
	
	public void setReceiver(java.lang.String value) {
		this.receiver = value;
	}
	
	@Column(name = "address")
	public java.lang.String getAddress() {
		return this.address;
	}
	
	public void setAddress(java.lang.String value) {
		this.address = value;
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
	
	@Column(name = "buliding_flag")
	public java.lang.String getBulidingFlag() {
		return this.bulidingFlag;
	}
	
	public void setBulidingFlag(java.lang.String value) {
		this.bulidingFlag = value;
	}
	
	@Column(name = "email")
	public java.lang.String getEmail() {
		return this.email;
	}
	
	public void setEmail(java.lang.String value) {
		this.email = value;
	}
	
	@Column(name = "zip_code")
	public java.lang.String getZipCode() {
		return this.zipCode;
	}
	
	public void setZipCode(java.lang.String value) {
		this.zipCode = value;
	}
	
	@Column(name = "receive_time")
	public java.lang.String getReceiveTime() {
		return this.receiveTime;
	}
	
	public void setReceiveTime(java.lang.String value) {
		this.receiveTime = value;
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
	
	private Member member;
	public void setMember(Member member){
		this.member = member;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "member") 
	})
	public Member getMember() {
		return member;
	}
}

