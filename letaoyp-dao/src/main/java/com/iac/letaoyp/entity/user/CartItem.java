package com.iac.letaoyp.entity.user;

import java.util.Collections;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;
import org.springside.modules.mapper.JsonMapper;

import com.iac.letaoyp.entity.IdEntity;
import com.iac.letaoyp.entity.sku.Goods;

@Entity
@Table(name = "cart_item")
public class CartItem extends IdEntity {
	private JsonMapper jsonMapper = JsonMapper.nonDefaultMapper();
	
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
	
	private Cart cart;
	
	private Goods goods;
	
	@Length(max=255)
	private String choosen;
	
	@Length(max=255)
	private String choosenDescription;
	
	@NotNull
	private Long price;
	//columns END
	
	@Column(name = "quantity")
	public java.lang.Integer getQuantity() {
		return this.quantity;
	}
	
	public void setQuantity(java.lang.Integer value) {
		this.quantity = value;
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

	@Column(name = "choosen")
	public String getChoosen() {
		return choosen;
	}

	public void setChoosen(String choosen) {
		this.choosen = choosen;
	}

	@Column(name = "choosen_description")
	public String getChoosenDescription() {
		return choosenDescription;
	}

	/**
	 * @deprecated using {@link #setChoosenDescription(Map)} 
	 */
	@Deprecated
	public void setChoosenDescription(String choosenDescription) {
		this.choosenDescription = choosenDescription;
	}
	
	public void setChoosenDescription(Map<String, Object> property) {
		this.setChoosenDescription(jsonMapper.toJson(property));
	}
	
	@Transient
	public Map<String, Object> getMappedChoosenDescription() {
		if(StringUtils.isBlank(this.choosenDescription)) 
			return Collections.EMPTY_MAP;
		
		return jsonMapper.fromJson(this.getChoosenDescription(), jsonMapper.contructMapType(Map.class, String.class, String.class));
	}

	@Column(name = "price")
	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}
	
	@PrePersist
	private void prePersist() {
		if(this.quantity == null) this.quantity = 1;
		
		if(this.price == null) this.price = 0L;
	}
}

