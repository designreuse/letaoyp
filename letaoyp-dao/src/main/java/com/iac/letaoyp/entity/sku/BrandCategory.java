package com.iac.letaoyp.entity.sku;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.iac.letaoyp.entity.IdEntity;

@Entity
@Table(name = "brand_category")
public class BrandCategory extends IdEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3557847364721881924L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * brand       db_column: brand 
     */ 	
	@NotNull
	private java.lang.Long brand;
	
	/**
     * brandName   db_column: brand_name 
     */ 	
	@NotNull @Length(max = 255)
	private String brandName;
	
    /**
     * category       db_column: category 
     */ 	
	@NotNull
	private java.lang.Long category;
	//columns END
	
	@Column(name = "brand")
	public java.lang.Long getBrand() {
		return this.brand;
	}
	
	public void setBrand(java.lang.Long value) {
		this.brand = value;
	}
	
	@Column(name = "brand_name")
	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	@Column(name = "category")
	public java.lang.Long getCategory() {
		return this.category;
	}
	
	public void setCategory(java.lang.Long value) {
		this.category = value;
	}
}

