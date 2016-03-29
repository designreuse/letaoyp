package com.iac.letaoyp.entity.info;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.iac.letaoyp.entity.IdEntity;

/**
 * Advertise
 *
 * @author Markin email:iacdingping@gmail.com
 * @version 1.0
 * */
@Entity
@Table(name = "advertise")
public class Advertise extends IdEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8071965830807982309L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 模块       db_column: model 
     */ 	
	@NotNull
	private Model model;
    /**
     * 广告图片       db_column: image 
     */ 	
	@NotBlank @Length(max=256)
	private java.lang.String image;
    /**
     * 广告内容       db_column: text 
     */ 	
	@Length(max=256)
	private java.lang.String text;
    /**
     * 链接地址       db_column: link 
     */ 	
	@Length(max=256)
	private java.lang.String link;
	
	/**
	 * 索引值或者业务ID
	 */
	@NotNull
	private Long index;
	
	/**
	 * 排序
	 */
	private Long sort;
	//columns END

	@Column(name = "model")
	@Enumerated(EnumType.STRING)
	public Model getModel() {
		return this.model;
	}
	
	public void setModel(Model value) {
		this.model = value;
	}
	
	@Column(name = "image")
	public java.lang.String getImage() {
		return this.image;
	}
	
	public void setImage(java.lang.String value) {
		this.image = value;
	}
	
	@Column(name = "text")
	public java.lang.String getText() {
		return this.text;
	}
	
	public void setText(java.lang.String value) {
		this.text = value;
	}
	
	@Column(name = "link")
	public java.lang.String getLink() {
		return this.link;
	}
	
	public void setLink(java.lang.String value) {
		this.link = value;
	}
	
	@Column(name = "index")
	public Long getIndex() {
		return index;
	}

	public void setIndex(Long index) {
		this.index = index;
	}

	@Column(name = "sort")
	public Long getSort() {
		return sort;
	}

	public void setSort(Long sort) {
		this.sort = sort;
	}

	public enum Model {
		HOME_TOP_SLIDE("首页顶部滑块", 1920, 500),
		HOME_CATEGORY("首页类目下广告", 1200, 120)
		;
		
		private String description;
		private int width;
		private int height;
		
		private Model(String description, int width, int height) {
			this.description = description;
			this.width = width;
			this.height = height;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public int getWidth() {
			return width;
		}
		public void setWidth(int width) {
			this.width = width;
		}
		public int getHeight() {
			return height;
		}
		public void setHeight(int height) {
			this.height = height;
		}
	}
}

