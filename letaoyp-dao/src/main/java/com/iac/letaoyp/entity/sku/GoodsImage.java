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
@Table(name = "goods_image")
public class GoodsImage extends IdEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8079313538282439711L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 降序排列       db_column: sort 
     */ 	
	@Max(9999999999L)
	private java.lang.Integer sort;
    /**
     * src       db_column: src 
     */ 	
	@NotBlank @Length(max=255)
	private java.lang.String src;
	
	/**
	 * 路径
	 */
	@Length(max=255)
	private java.lang.String path;
	
    /**
     * goods       db_column: goods 
     */ 	
	@NotNull @Max(9223372036854775807L)
	private java.lang.Long goods;
	//columns END

	@Column(name = "sort")
	public java.lang.Integer getSort() {
		return sort;
	}
	
	public void setSort(java.lang.Integer sort) {
		this.sort = sort;
	}
	
	@Column(name = "src")
	public java.lang.String getSrc() {
		return this.src;
	}
	
	public void setSrc(java.lang.String value) {
		this.src = value;
	}
	
	@Column(name = "path")
	public java.lang.String getPath() {
		return path;
	}

	public void setPath(java.lang.String path) {
		this.path = path;
	}

	@Column(name = "goods")
	public java.lang.Long getGoods() {
		return this.goods;
	}
	
	public void setGoods(java.lang.Long value) {
		this.goods = value;
	}
	
}

