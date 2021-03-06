package com.iac.letaoyp.entity.info;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Max;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.iac.letaoyp.entity.IdEntity;

/**
 * Area
 *
 * @author Markin email:iacdingping@gmail.com
 * @version 1.0
 * */
@Entity
@Table(name = "area")
public class Area extends IdEntity {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -5353698182501525089L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 排序       db_column: sort 
     */ 	
	@Max(9999999999L)
	private java.lang.Integer sort;
    /**
     * 全名       db_column: full_name 
     */ 	
	@NotBlank @Length(max=2147483647)
	private java.lang.String fullName;
    /**
     * 地名       db_column: name 
     */ 	
	@NotBlank @Length(max=100)
	private java.lang.String name;
    /**
     * 树路径       db_column: tree_path 
     */ 	
	@NotBlank @Length(max=255)
	private java.lang.String treePath;
    /**
     * 父节点       db_column: parent 
     */ 	
	@Max(9223372036854775807L)
	private java.lang.Long parent;
	//columns END

	@Column(name = "sort")
	public java.lang.Integer getSort() {
		return this.sort;
	}
	
	public void setSort(java.lang.Integer value) {
		this.sort = value;
	}
	
	@Column(name = "full_name")
	public java.lang.String getFullName() {
		return this.fullName;
	}
	
	public void setFullName(java.lang.String value) {
		this.fullName = value;
	}
	
	@Column(name = "name")
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
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

