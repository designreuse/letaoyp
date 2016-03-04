package com.iac.letaoyp.entity.admin;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.iac.letaoyp.entity.IdEntity;


/**
 *
 * @author dingp email:dingp@51box.cn
 * @version 1.0
 * @since 1.0
 * * 字典表
 */
@Entity
@Table(name = "s_dict")
public class Dict extends IdEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8395857371379862255L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 标签名       db_column: label 
     */ 	
	@NotBlank @Length(max=100)
	private java.lang.String label;
    /**
     * 数据值       db_column: value 
     */ 	
	@NotBlank @Length(max=100)
	private java.lang.String value;
    /**
     * 类型       db_column: type 
     */ 	
	@NotBlank @Length(max=100)
	private java.lang.String type;
    /**
     * 描述       db_column: description 
     */ 	
	@NotBlank @Length(max=256)
	private java.lang.String description;
    /**
     * 排序（升序）       db_column: sort 
     */ 	
	@NotNull @Max(9999999999L)
	private java.lang.Integer sort;
    /**
     * 备注信息       db_column: remarks 
     */ 	
	@Length(max=256)
	private java.lang.String remarks;
    /**
     * active       db_column: active 
     */ 	
	//columns END

	@Column(name = "label")
	public java.lang.String getLabel() {
		return this.label;
	}
	
	public void setLabel(java.lang.String value) {
		this.label = value;
	}
	
	@Column(name = "value")
	public java.lang.String getValue() {
		return this.value;
	}
	
	public void setValue(java.lang.String value) {
		this.value = value;
	}
	
	@Column(name = "type")
	public java.lang.String getType() {
		return this.type;
	}
	
	public void setType(java.lang.String value) {
		this.type = value;
	}
	
	@Column(name = "description")
	public java.lang.String getDescription() {
		return this.description;
	}
	
	public void setDescription(java.lang.String value) {
		this.description = value;
	}
	
	@Column(name = "sort")
	public java.lang.Integer getSort() {
		return this.sort;
	}
	
	public void setSort(java.lang.Integer value) {
		this.sort = value;
	}
	
	@Column(name = "remarks")
	public java.lang.String getRemarks() {
		return this.remarks;
	}
	
	public void setRemarks(java.lang.String value) {
		this.remarks = value;
	}
	
}

