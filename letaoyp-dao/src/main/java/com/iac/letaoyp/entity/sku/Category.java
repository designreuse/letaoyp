package com.iac.letaoyp.entity.sku;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.validation.constraints.Max;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.iac.letaoyp.entity.IdEntity;

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
	private java.lang.Integer sort;
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
     * treeName       db_column: tree_name 
     */ 
	@NotBlank @Length(max=1024)
	private String treeName;
    /**
     * parent       db_column: parent 
     */ 	
	private java.lang.Long parent;
	/**
     * isLeaf       db_column: is_leaf 
     */ 
	private Boolean isLeaf;
	/**
     * level        db_column: level 
     */ 
	private Integer level;
	/**
     * icon         db_column: icon 
     */ 
	private String icon;
	/**
     * top       	db_column: top 
     */ 
	private Boolean top;
	/**
     * logo 类目logo db_column: logo 
     */ 
	private String logo;
	//columns END
	
	@Column(name = "sort")
	public java.lang.Integer getSort() {
		return sort;
	}
	
	public void setSort(java.lang.Integer sort) {
		this.sort = sort;
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
	
	@Column(name = "tree_name")
	public String getTreeName() {
		return treeName;
	}

	public void setTreeName(String treeName) {
		this.treeName = treeName;
	}

	@Column(name = "parent")
	public java.lang.Long getParent() {
		return this.parent;
	}
	
	public void setParent(java.lang.Long value) {
		this.parent = value;
	}

	@Column(name = "is_leaf")
	public Boolean getIsLeaf() {
		return isLeaf != null && isLeaf;
	}

	public void setIsLeaf(Boolean isLeaf) {
		this.isLeaf = isLeaf;
	}

	@Column(name = "level")
	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	@Column(name = "icon")
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Boolean getTop() {
		return top;
	}

	public void setTop(Boolean top) {
		this.top = top;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	@PrePersist
	public void prepersist() {
		if(this.top == null) {
			this.setTop(false);
		}
		if(this.isLeaf == null) {
			this.setIsLeaf(true);
		}
	}
}

