package com.iac.letaoyp.entity.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.iac.letaoyp.entity.IdEntity;
import com.iac.letaoyp.entity.sku.Goods;

@Entity
@Table(name = "order_item")
public class OrderItem extends IdEntity {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 3054018639868186222L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 商品名称       db_column: name 
     */ 	
	@NotBlank @Length(max=255)
	private java.lang.String name;
    /**
     * 价格       db_column: price 
     */ 	
	@NotNull @Max(9223372036854775807L)
	private java.lang.Long price;
    /**
     * 数量       db_column: quantity 
     */ 	
	@NotNull @Max(9999999999L)
	private java.lang.Integer quantity;
    /**
     * 商品缩略图       db_column: thumbnail 
     */ 	
	@Length(max=255)
	private java.lang.String thumbnail;
    /**
     * 重量       db_column: weight 
     */ 	
	@Max(9999999999L)
	private java.lang.Integer weight;
	private Goods goods;
	private Order order;
	//columns END

	@Column(name = "name")
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	@Column(name = "price")
	public java.lang.Long getPrice() {
		return this.price;
	}
	
	public void setPrice(java.lang.Long value) {
		this.price = value;
	}
	
	@Column(name = "quantity")
	public java.lang.Integer getQuantity() {
		return this.quantity;
	}
	
	public void setQuantity(java.lang.Integer value) {
		this.quantity = value;
	}
	
	@Column(name = "thumbnail")
	public java.lang.String getThumbnail() {
		return this.thumbnail;
	}
	
	public void setThumbnail(java.lang.String value) {
		this.thumbnail = value;
	}
	
	@Column(name = "weight")
	public java.lang.Integer getWeight() {
		return this.weight;
	}
	
	public void setWeight(java.lang.Integer value) {
		this.weight = value;
	}
	
	public void setGoods(Goods goods){
		this.goods = goods;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "goods") 
	})
	public Goods getGoods() {
		return goods;
	}
	
	public void setOrder(Order order){
		this.order = order;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "[order]") 
	})
	public Order getOrder() {
		return order;
	}
}

