package com.iac.letaoyp.entity.sku;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Max;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.iac.letaoyp.entity.IdEntity;

@Entity
@Table(name = "goods_top")
public class GoodsTop extends IdEntity {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -8714313102064096072L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	/**
	 * goods		   db_column: goods
	 */
	private Goods goods;
	
	/**
	 * goods一级类目	   db_column: category
	 */
	private Category category;
	
    /**
     * goodsName       db_column: goods_name 
     */ 	
	@Length(max=255)
	private java.lang.String goodsName;
    /**
     * 销售价       db_column: sales_price 
     */ 	
	@Max(9223372036854775807L)
	private java.lang.Long salesPrice;
    /**
     * 市场价       db_column: market_price 
     */ 	
	@Max(9223372036854775807L)
	private java.lang.Long marketPrice;
    /**
     * 评论数       db_column: comments 
     */ 	
	@Max(9999999999L)
	private java.lang.Integer comments;
    /**
     * topImage       db_column: top_image 
     */ 	
	@NotBlank @Length(max=255)
	private java.lang.String topImage;
    /**
     * 置顶位置 HOME_1 首页置顶位置1(785*368); HOME_2 首页置顶位置2(242*184)       db_column: position 
     */ 	
	@Length(max=20)
	private Position position;
	//columns END

	@Column(name = "goods_name")
	public java.lang.String getGoodsName() {
		return this.goodsName;
	}
	
	public void setGoodsName(java.lang.String value) {
		this.goodsName = value;
	}
	
	@Column(name = "sales_price")
	public java.lang.Long getSalesPrice() {
		return this.salesPrice;
	}
	
	public void setSalesPrice(java.lang.Long value) {
		this.salesPrice = value;
	}
	
	@Column(name = "market_price")
	public java.lang.Long getMarketPrice() {
		return this.marketPrice;
	}
	
	public void setMarketPrice(java.lang.Long value) {
		this.marketPrice = value;
	}
	
	@Column(name = "comments")
	public java.lang.Integer getComments() {
		return this.comments;
	}
	
	public void setComments(java.lang.Integer value) {
		this.comments = value;
	}
	
	@Column(name = "top_image")
	public java.lang.String getTopImage() {
		return this.topImage;
	}
	
	public void setTopImage(java.lang.String value) {
		this.topImage = value;
	}
	
	@Column(name = "position")
	@Enumerated(EnumType.STRING)
	public Position getPosition() {
		return this.position;
	}
	
	public void setPosition(Position value) {
		this.position = value;
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
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "category") 
	})
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public enum Position {
		HOME_SLIDE(785, 368, "首页滑动大图"), HOME_VERTICAL(242 , 184, "首页垂直中图"), HOME_HORIZONTAL(310, 310, "首页水平平铺商品图");
		
		private Integer width;
		private Integer height;
		private String desc;
		private Position(int width, int height, String desc) {
			this.width = width;
			this.height = height;
			this.desc = desc;
		}
		public Integer getWidth() {
			return width;
		}
		public void setWidth(Integer width) {
			this.width = width;
		}
		public Integer getHeight() {
			return height;
		}
		public void setHeight(Integer height) {
			this.height = height;
		}
		public String getDesc() {
			return desc;
		}
		public void setDesc(String desc) {
			this.desc = desc;
		}
	}
}

