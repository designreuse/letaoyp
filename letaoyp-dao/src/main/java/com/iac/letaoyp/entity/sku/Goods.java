package com.iac.letaoyp.entity.sku;

import java.util.Collections;
import java.util.Date;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springside.modules.mapper.JsonMapper;

import com.iac.letaoyp.entity.IdEntity;

@Entity
@Table(name = "goods")
public class Goods extends IdEntity {
	
	private JsonMapper jsonMapper = JsonMapper.nonEmptyMapper();

	public enum Status {
		OFFLINE("已下架"), ONLINE("上架");
		private String description;

		private Status(String description) {
			this.description = description;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = -8059005126021282358L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 上架 下架      db_column: status 
     */ 	
	private Status status;
    /**
     * name       db_column: name 
     */ 	
	@NotBlank @Length(max=255)
	private java.lang.String name;
    /**
     * baseHits       db_column: base_hits 
     */ 	
	@NotNull 
	private java.lang.Long baseHits;
    /**
     * 点击数       db_column: hits 
     */ 	
	@NotNull 
	private java.lang.Long hits;
    /**
     * 商品图标 取上传图片的第一张       db_column: image 
     */ 	
	@Length(max=255)
	private java.lang.String image;
    /**
     * 销售价       db_column: sales_price 
     */ 	
	private java.lang.Long salesPrice;
    /**
     * 市场价       db_column: market_price 
     */ 	
	private java.lang.Long marketPrice;
    /**
     * 成本价       db_column: cost 
     */ 	
	private java.lang.Long cost;
    /**
     * 星级       db_column: star 
     */ 	
	@Max(9999999999L)
	private java.lang.Integer star;
    /**
     * 重量       db_column: weight 
     */ 	
	@Max(9999999999L)
	private java.lang.Integer weight;
    /**
     * unit描述       db_column: unit 
     */ 	
	@Length(max=20)
	private java.lang.String unit;
    /**
     * description       db_column: description 
     */ 	
	private java.lang.String description;
    /**
     * 键值对属性       db_column: property 
     */ 	
	private java.lang.String property;
	
	private Date onlineTime;
	
	private Integer comments;
	
	private Long category;
	//columns END

	@Column(name = "status")
	@Enumerated(EnumType.STRING)
	public Status getStatus() {
		return this.status;
	}
	
	public void setStatus(Status value) {
		this.status = value;
	}
	
	@Column(name = "name")
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	@Column(name = "base_hits")
	public java.lang.Long getBaseHits() {
		return this.baseHits;
	}
	
	public void setBaseHits(java.lang.Long value) {
		this.baseHits = value;
	}
	
	@Column(name = "hits")
	public java.lang.Long getHits() {
		return this.hits;
	}
	
	public void setHits(java.lang.Long value) {
		this.hits = value;
	}
	
	@Column(name = "image")
	public java.lang.String getImage() {
		return this.image;
	}
	
	public void setImage(java.lang.String value) {
		this.image = value;
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
	
	@Column(name = "cost")
	public java.lang.Long getCost() {
		return this.cost;
	}
	
	public void setCost(java.lang.Long value) {
		this.cost = value;
	}
	
	@Column(name = "star")
	public java.lang.Integer getStar() {
		return this.star;
	}
	
	public void setStar(java.lang.Integer value) {
		this.star = value;
	}
	
	@Column(name = "weight")
	public java.lang.Integer getWeight() {
		return this.weight;
	}
	
	public void setWeight(java.lang.Integer value) {
		this.weight = value;
	}
	
	@Column(name = "unit")
	public java.lang.String getUnit() {
		return this.unit;
	}
	
	public void setUnit(java.lang.String value) {
		this.unit = value;
	}
	
	@Column(name = "description")
	public java.lang.String getDescription() {
		return this.description;
	}
	
	public void setDescription(java.lang.String value) {
		this.description = value;
	}
	
	@Column(name = "property")
	public java.lang.String getProperty() {
		return this.property;
	}
	
	public void setProperty(java.lang.String value) {
		this.property = value;
	}
	
	@Transient
	public Map<String, String> getParsedProperty() {
		if(StringUtils.isBlank(property)) 
			return Collections.EMPTY_MAP;
		
		return jsonMapper.fromJson(this.property, jsonMapper.contructMapType(Map.class, String.class, String.class));
	}
	
	public void setParsedProperty(Map<String, String> property) {
		this.setProperty(jsonMapper.toJson(property));
	}
	
	@Column(name = "online_time")
	public Date getOnlineTime() {
		return onlineTime;
	}

	public void setOnlineTime(Date onlineTime) {
		this.onlineTime = onlineTime;
	}
	
	@Column(name = "category")
	public Long getCategory() {
		return category;
	}

	public void setCategory(Long category) {
		this.category = category;
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

	public Integer getComments() {
		return comments;
	}

	public void setComments(Integer comments) {
		this.comments = comments;
	}
}

