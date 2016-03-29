package com.iac.letaoyp.entity.sku;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.iac.letaoyp.entity.IdEntity;

@Entity
@Table(name = "hot_key")
public class HotKey extends IdEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3253536628736042530L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * key       db_column: key 
     */ 	
	@NotBlank @Length(max=125)
	private java.lang.String key;
    /**
     * 搜索次数       db_column: times 
     */ 	
	@NotNull @Max(9999999999L)
	private java.lang.Integer times;
	//columns END
	
	@Column(name = "key")
	public java.lang.String getKey() {
		return this.key;
	}
	
	public void setKey(java.lang.String value) {
		this.key = value;
	}
	
	@Column(name = "times")
	public java.lang.Integer getTimes() {
		return this.times;
	}
	
	public void setTimes(java.lang.Integer value) {
		this.times = value;
	}
	
}

