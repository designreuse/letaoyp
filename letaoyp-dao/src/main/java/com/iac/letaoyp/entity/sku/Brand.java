package com.iac.letaoyp.entity.sku;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Max;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.iac.letaoyp.entity.IdEntity;

@Entity
@Table(name = "brand")
public class Brand extends IdEntity {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 8637530645204035481L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 降序 越大越靠前       db_column: order 
     */ 	
	@Max(9999999999L)
	private java.lang.Integer sort;
    /**
     * introduction       db_column: introduction 
     */ 	
	private java.lang.String introduction;
    /**
     * logo       db_column: logo 
     */ 	
	@Length(max=255)
	private java.lang.String logo;
    /**
     * name       db_column: name 
     */ 	
	@NotBlank @Length(max=255)
	private java.lang.String name;
    /**
     * url       db_column: url 
     */ 	
	@Length(max=255)
	private java.lang.String url;
	//columns END

	@Column(name = "sort")
	public java.lang.Integer getSort() {
		return sort;
	}

	public void setSort(java.lang.Integer sort) {
		this.sort = sort;
	}
	
	@Column(name = "introduction")
	public java.lang.String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(java.lang.String value) {
		this.introduction = value;
	}
	
	@Column(name = "logo")
	public java.lang.String getLogo() {
		return this.logo;
	}
	
	public void setLogo(java.lang.String value) {
		this.logo = value;
	}
	
	@Column(name = "name")
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	@Column(name = "url")
	public java.lang.String getUrl() {
		return this.url;
	}
	
	public void setUrl(java.lang.String value) {
		this.url = value;
	}
}

