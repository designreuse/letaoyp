package com.iac.letaoyp.entity.goods;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Max;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.iac.letaoyp.entity.IdEntity;


/**
 *
 * @author dingp email:dingp@51box.cn
 * @version 1.0
 * @since 1.0
 * * 类目
 */
@Entity
@Table(name = "category")
public class Category extends IdEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8468858561944398640L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 降序排列       db_column: order 
     */ 	
	@Max(9999999999L)
	private java.lang.Integer order;
    /**
     * name       db_column: name 
     */ 	
	@NotBlank @Length(max=255)
	private java.lang.String name;
    /**
     * seoDescription       db_column: seo_description 
     */ 	
	@Length(max=255)
	private java.lang.String seoDescription;
    /**
     * seoKeywords       db_column: seo_keywords 
     */ 	
	@Length(max=255)
	private java.lang.String seoKeywords;
    /**
     * seoTitle       db_column: seo_title 
     */ 	
	@Length(max=255)
	private java.lang.String seoTitle;
    /**
     * treePath       db_column: tree_path 
     */ 	
	@NotBlank @Length(max=255)
	private java.lang.String treePath;
    /**
     * parent       db_column: parent 
     */ 	
	private java.lang.Long parent;
	//columns END
	
	@Column(name = "order")
	public java.lang.Integer getOrder() {
		return this.order;
	}
	
	public void setOrder(java.lang.Integer value) {
		this.order = value;
	}
	
	@Column(name = "name")
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	@Column(name = "seo_description")
	public java.lang.String getSeoDescription() {
		return this.seoDescription;
	}
	
	public void setSeoDescription(java.lang.String value) {
		this.seoDescription = value;
	}
	
	@Column(name = "seo_keywords")
	public java.lang.String getSeoKeywords() {
		return this.seoKeywords;
	}
	
	public void setSeoKeywords(java.lang.String value) {
		this.seoKeywords = value;
	}
	
	@Column(name = "seo_title")
	public java.lang.String getSeoTitle() {
		return this.seoTitle;
	}
	
	public void setSeoTitle(java.lang.String value) {
		this.seoTitle = value;
	}
	
	@Column(name = "tree_path")
	public java.lang.String getTreePath() {
		return this.treePath;
	}
	
	public void setTreePath(java.lang.String value) {
		this.treePath = value;
	}
	
	@Column(name = "parent")
	public java.lang.Long getParent() {
		return this.parent;
	}
	
	public void setParent(java.lang.Long value) {
		this.parent = value;
	}
}

