package com.iac.letaoyp.entity.admin;

import com.iac.letaoyp.entity.IdEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;


/**
 * 
 * @author dingp email:dingp@51box.cn
 * @version 1.0
 * @since 1.0
 *
 * 权限表
 */
@Entity
@Table(name = "s_permission")
public class Permission extends IdEntity {
	private static final long serialVersionUID = 3297374015234364727L;
	/**
     * name       db_column: name 
     */ 	
	@NotBlank @Length(max=100)
	private java.lang.String name;
    /**
     * description       db_column: description 
     */ 	
	@NotBlank @Length(max=255)
	private java.lang.String description;
    /**
     * menu       db_column: menu 
     */ 	
	private java.lang.Long menu;
	//columns END

	@Column(name = "name", unique = false, nullable = false, insertable = true, updatable = true, length = 100)
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	@Column(name = "description", unique = false, nullable = false, insertable = true, updatable = true, length = 255)
	public java.lang.String getDescription() {
		return this.description;
	}
	
	public void setDescription(java.lang.String value) {
		this.description = value;
	}
	
	@Column(name = "menu", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.lang.Long getMenu() {
		return this.menu;
	}
	
	public void setMenu(java.lang.Long value) {
		this.menu = value;
	}
}

