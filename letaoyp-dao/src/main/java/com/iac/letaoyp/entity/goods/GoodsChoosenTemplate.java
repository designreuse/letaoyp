package com.iac.letaoyp.entity.goods;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;

import com.iac.letaoyp.entity.IdEntity;

/**
 *
 * @author dingp email:dingp@51box.cn
 * @version 1.0
 * @since 1.0
 * * 商品选择条件模板 FIXME : not enough property
 */
@Entity
@Table(name = "goods_choosen_template")
public class GoodsChoosenTemplate extends IdEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6876107173391298962L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 模板名       db_column: name 
     */ 	
	@Length(max=255)
	private java.lang.String name;
	//columns END
	
	@Column(name = "name")
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	private Category category;
	public void setCategory(Category category){
		this.category = category;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "category") 
	})
	public Category getCategory() {
		return category;
	}
	
	private Brand brand;
	public void setBrand(Brand brand){
		this.brand = brand;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "brand") 
	})
	public Brand getBrand() {
		return brand;
	}
}

