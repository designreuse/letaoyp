package com.iac.letaoyp.entity.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;

import com.iac.letaoyp.entity.IdEntity;
import com.iac.letaoyp.entity.sku.Goods;

@Entity
@Table(name = "visit_history")
public class VisitHistory extends IdEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1040970598013878414L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * goodsName       db_column: goods_name 
     */ 	
	@Length(max=256)
	private java.lang.String goodsName;
	//columns END

	@Column(name = "goods_name")
	public java.lang.String getGoodsName() {
		return this.goodsName;
	}
	
	public void setGoodsName(java.lang.String value) {
		this.goodsName = value;
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
}

