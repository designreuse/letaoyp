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

import com.iac.letaoyp.entity.IdEntity;
import com.iac.letaoyp.entity.goods.Goods;

/**
 *
 * @author dingp email:dingp@51box.cn
 * @version 1.0
 * @since 1.0
 * * 购物车item
 */
@Entity
@Table(name = "cart_item")
public class CartItem extends IdEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1123194089581107461L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 数量       db_column: quantity 
     */ 	
	@NotNull @Max(9999999999L)
	private java.lang.Integer quantity;
	//columns END
	
	@Column(name = "quantity")
	public java.lang.Integer getQuantity() {
		return this.quantity;
	}
	
	public void setQuantity(java.lang.Integer value) {
		this.quantity = value;
	}
	
	private Goods goods;
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
	
	private Cart cart;
	public void setCart(Cart cart){
		this.cart = cart;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "cart") 
	})
	public Cart getCart() {
		return cart;
	}
}

