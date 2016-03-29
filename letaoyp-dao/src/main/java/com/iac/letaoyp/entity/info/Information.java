package com.iac.letaoyp.entity.info;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;

import com.iac.letaoyp.entity.IdEntity;

/**
 * 公告|帮助
 *
 * @author Markin email:iacdingping@gmail.com
 * @version 1.0
 * */
@Entity
@Table(name = "information")
public class Information extends IdEntity {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -8573457478661083890L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * title       db_column: title 
     */ 	
	@Length(max=50)
	private java.lang.String title;
    /**
     * description       db_column: description 
     */ 	
	@Length(max=256)
	private java.lang.String description;
    /**
     * detail       db_column: detail 
     */ 	
	@Length(max=2147483647)
	private java.lang.String detail;
    /**
     * ANNOUNCEMENT 公告; HELP 帮助       db_column: model 
     */ 	
	@Length(max=20)
	private java.lang.String model;
    /**
     * top       db_column: top 
     */ 	
	private java.lang.Boolean top;
    /**
     * topImage       db_column: top_image 
     */ 	
	@Length(max=256)
	private java.lang.String topImage;
	//columns END

	@Column(name = "title")
	public java.lang.String getTitle() {
		return this.title;
	}
	
	public void setTitle(java.lang.String value) {
		this.title = value;
	}
	
	@Column(name = "description")
	public java.lang.String getDescription() {
		return this.description;
	}
	
	public void setDescription(java.lang.String value) {
		this.description = value;
	}
	
	@Column(name = "detail")
	public java.lang.String getDetail() {
		return this.detail;
	}
	
	public void setDetail(java.lang.String value) {
		this.detail = value;
	}
	
	@Column(name = "model")
	public java.lang.String getModel() {
		return this.model;
	}
	
	public void setModel(java.lang.String value) {
		this.model = value;
	}
	
	@Column(name = "top")
	public java.lang.Boolean getTop() {
		return this.top;
	}
	
	public void setTop(java.lang.Boolean value) {
		this.top = value;
	}
	
	@Column(name = "top_image")
	public java.lang.String getTopImage() {
		return this.topImage;
	}
	
	public void setTopImage(java.lang.String value) {
		this.topImage = value;
	}
	
}

