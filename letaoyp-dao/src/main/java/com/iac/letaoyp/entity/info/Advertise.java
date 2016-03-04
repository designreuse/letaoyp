package com.iac.letaoyp.entity.info;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.iac.letaoyp.entity.IdEntity;

/**
 *
 * @author dingp email:dingp@51box.cn
 * @version 1.0
 * @since 1.0
 * * Advertise
 */
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
     * HOME       db_column: model 
     */ 	
	@Length(max=25)
	private java.lang.String model;
    /**
     * image       db_column: image 
     */ 	
	@NotBlank @Length(max=256)
	private java.lang.String image;
    /**
     * text       db_column: text 
     */ 	
	@Length(max=256)
	private java.lang.String text;
    /**
     * link       db_column: link 
     */ 	
	@Length(max=256)
	private java.lang.String link;
	//columns END

	@Column(name = "model")
	public java.lang.String getModel() {
		return this.model;
	}
	
	public void setModel(java.lang.String value) {
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
	
}

