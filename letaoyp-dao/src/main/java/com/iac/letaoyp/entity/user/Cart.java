package com.iac.letaoyp.entity.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.iac.letaoyp.entity.IdEntity;

/**
 *
 * @author dingp email:dingp@51box.cn
 * @version 1.0
 * @since 1.0
 * * 购物车
 */
@Entity
@Table(name = "cart")
public class Cart extends IdEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9104436953024843944L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 购物车唯一编码 未注册用户也可体验购物车功能       db_column: cart_key 
     */ 	
	@NotBlank @Length(max=255)
	private java.lang.String cartKey;
	//columns END
	
	@Column(name = "cart_key")
	public java.lang.String getCartKey() {
		return this.cartKey;
	}
	
	public void setCartKey(java.lang.String value) {
		this.cartKey = value;
	}
	
	private Member member;
	public void setMember(Member member){
		this.member = member;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "member") 
	})
	public Member getMember() {
		return member;
	}
}

