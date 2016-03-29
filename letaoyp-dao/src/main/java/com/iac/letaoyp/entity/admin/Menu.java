package com.iac.letaoyp.entity.admin;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.iac.letaoyp.entity.IdEntity;

@Entity
@Table(name = "s_menu")
public class Menu extends IdEntity {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -1500539225287893606L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * name       db_column: name 
     */ 	
	@NotBlank @Length(max=64)
	private java.lang.String name;
    /**
     * description       db_column: description 
     */ 	
	@NotBlank @Length(max=255)
	private java.lang.String description;
    /**
     * icon       db_column: icon 
     */ 	
	@Length(max=64)
	private java.lang.String icon;
    /**
     * parent referce on menu(id) which 0 is root menu       db_column: parent 
     */ 	
	@Max(9223372036854775807L)
	@NotNull
	private java.lang.Long parent;
    /**
     * desc       db_column: sort 
     */ 	
	@Max(9999999999L)
	private java.lang.Integer sort;
    /**
     * link       db_column: link 
     */ 	
	@Length(max=255)
	@NotBlank
	private java.lang.String link;
    /**
     * permission       db_column: permission 
     */ 	
	@Length(max=255)
	@NotBlank
	private java.lang.String permission;
	//columns END
	
	private List<Menu> subMenus;

	@Column(name = "name")
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	@Column(name = "description")
	public java.lang.String getDescription() {
		return this.description;
	}
	
	public void setDescription(java.lang.String value) {
		this.description = value;
	}
	
	@Column(name = "icon")
	public java.lang.String getIcon() {
		return this.icon;
	}
	
	public void setIcon(java.lang.String value) {
		this.icon = value;
	}
	
	@Column(name = "parent")
	public java.lang.Long getParent() {
		return this.parent;
	}
	
	public void setParent(java.lang.Long value) {
		this.parent = value;
	}
	
	@Column(name = "sort")
	public java.lang.Integer getSort() {
		return this.sort;
	}
	
	public void setSort(java.lang.Integer value) {
		this.sort = value;
	}
	
	@Column(name = "link")
	public java.lang.String getLink() {
		return this.link;
	}
	
	public void setLink(java.lang.String value) {
		this.link = value;
	}
	
	@Column(name = "permission")
	public java.lang.String getPermission() {
		return this.permission;
	}
	
	public void setPermission(java.lang.String value) {
		this.permission = value;
	}

	@Transient
	public List<Menu> getSubMenus() {
		return subMenus;
	}

	public void setSubMenus(List<Menu> subMenus) {
		this.subMenus = subMenus;
	}
	
}

