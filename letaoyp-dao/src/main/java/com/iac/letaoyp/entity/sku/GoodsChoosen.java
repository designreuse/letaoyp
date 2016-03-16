package com.iac.letaoyp.entity.sku;

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
 * * 商品选择条件
 */
@Entity
@Table(name = "goods_choosen")
public class GoodsChoosen extends IdEntity {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -4364494749104720286L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 选择条件名称 eg: 尺码       db_column: name 
     */ 	
	@Length(max=255)
	private java.lang.String name;
    /**
     * 选择条件值 eg: S M L XL       db_column: value 
     */ 	
	@Length(max=255)
	private java.lang.String value;
    /**
     * 选择该条件后 额外需要支付价格       db_column: cost 
     */ 	
	private java.lang.Long cost;
	
	private Goods goods;
	//columns END

	@Column(name = "name")
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	@Column(name = "value")
	public java.lang.String getValue() {
		return this.value;
	}
	
	public void setValue(java.lang.String value) {
		this.value = value;
	}
	
	@Column(name = "cost")
	public java.lang.Long getCost() {
		return this.cost;
	}
	
	public void setCost(java.lang.Long value) {
		this.cost = value;
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
}

