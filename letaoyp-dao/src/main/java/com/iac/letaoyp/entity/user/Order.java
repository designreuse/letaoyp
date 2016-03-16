package com.iac.letaoyp.entity.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.iac.letaoyp.entity.IdEntity;
import com.iac.letaoyp.entity.admin.Account;
import com.iac.letaoyp.entity.info.Area;


/**
 *
 * @author dingp email:dingp@51box.cn
 * @version 1.0
 * @since 1.0
 * * Order
 */
@Entity
@Table(name = "[order]")
public class Order extends IdEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8526297477809340864L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * address       db_column: address 
     */ 	
	@NotBlank @Length(max=255)
	private java.lang.String address;
    /**
     * 收货人       db_column: consignee 
     */ 	
	@NotBlank @Length(max=255)
	private java.lang.String consignee;
    /**
     * expire       db_column: expire 
     */ 	
	private java.util.Date expire;
    /**
     * 货品金额       db_column: amount 
     */ 	
	@NotNull @Max(9223372036854775807L)
	private java.lang.Long amount;
    /**
     * 运费       db_column: freight 
     */ 	
	@NotNull @Max(9223372036854775807L)
	private Long freight;
    /**
     * 税金       db_column: tax 
     */ 	
	@NotNull @Max(9223372036854775807L)
	private java.lang.Long tax;
    /**
     * 支付金额       db_column: fee 
     */ 	
	@NotNull @Max(9223372036854775807L)
	private java.lang.Long fee;
    /**
     * 是否开具发票       db_column: is_invoice 
     */ 	
	@NotNull 
	private java.lang.Boolean isInvoice;
    /**
     * 发票抬头       db_column: invoice_title 
     */ 	
	@Length(max=255)
	private java.lang.String invoiceTitle;
    /**
     * 是否已分配库存       db_column: is_allocated_stock 
     */ 	
	@NotNull 
	private java.lang.Boolean isAllocatedStock;
    /**
     * 附言       db_column: memo 
     */ 	
	@Length(max=255)
	private java.lang.String memo;
    /**
     * 调整金额       db_column: offset_amount 
     */ 	
	@NotNull @Max(9223372036854775807L)
	private java.lang.Long offsetAmount;
    /**
     * 订单状态       db_column: status 
     */ 	
	private Status status;
    /**
     * 支付渠道       db_column: channel 
     */ 	
	private Channel channel;
    /**
     * phone       db_column: phone 
     */ 	
	@NotBlank @Length(max=20)
	private java.lang.String mobile;
    /**
     * 交易编号       db_column: trade_no 
     */ 	
	@NotBlank @Length(max=100)
	private java.lang.String tradeNo;
    /**
     * 外部（支付系统）交易标号       db_column: out_trade_no 
     */ 	
	@Length(max=100)
	private java.lang.String outTradeNo;
    /**
     * couponCode       db_column: coupon_code 
     */ 	
	@Max(9223372036854775807L)
	private java.lang.Long couponCode;
	//columns END

	
	@Column(name = "address")
	public java.lang.String getAddress() {
		return this.address;
	}
	
	public void setAddress(java.lang.String value) {
		this.address = value;
	}
	
	@Column(name = "consignee")
	public java.lang.String getConsignee() {
		return this.consignee;
	}
	
	public void setConsignee(java.lang.String value) {
		this.consignee = value;
	}
	
	@Column(name = "expire")
	public java.util.Date getExpire() {
		return this.expire;
	}
	
	public void setExpire(java.util.Date value) {
		this.expire = value;
	}
	
	@Column(name = "amount")
	public java.lang.Long getAmount() {
		return this.amount;
	}
	
	public void setAmount(java.lang.Long value) {
		this.amount = value;
	}
	
	@Column(name = "freight")
	public Long getFreight() {
		return this.freight;
	}
	
	public void setFreight(Long value) {
		this.freight = value;
	}
	
	@Column(name = "tax")
	public java.lang.Long getTax() {
		return this.tax;
	}
	
	public void setTax(java.lang.Long value) {
		this.tax = value;
	}
	
	@Column(name = "fee")
	public java.lang.Long getFee() {
		return this.fee;
	}
	
	public void setFee(java.lang.Long value) {
		this.fee = value;
	}
	
	@Column(name = "is_invoice")
	public java.lang.Boolean getIsInvoice() {
		return this.isInvoice;
	}
	
	public void setIsInvoice(java.lang.Boolean value) {
		this.isInvoice = value;
	}
	
	@Column(name = "invoice_title")
	public java.lang.String getInvoiceTitle() {
		return this.invoiceTitle;
	}
	
	public void setInvoiceTitle(java.lang.String value) {
		this.invoiceTitle = value;
	}
	
	@Column(name = "is_allocated_stock")
	public java.lang.Boolean getIsAllocatedStock() {
		return this.isAllocatedStock;
	}
	
	public void setIsAllocatedStock(java.lang.Boolean value) {
		this.isAllocatedStock = value;
	}
	
	@Column(name = "memo")
	public java.lang.String getMemo() {
		return this.memo;
	}
	
	public void setMemo(java.lang.String value) {
		this.memo = value;
	}
	
	@Column(name = "offset_amount")
	public java.lang.Long getOffsetAmount() {
		return this.offsetAmount;
	}
	
	public void setOffsetAmount(java.lang.Long value) {
		this.offsetAmount = value;
	}
	
	@Column(name = "status")
	@Enumerated(EnumType.STRING)
	public Status getStatus() {
		return this.status;
	}
	
	public void setStatus(Status value) {
		this.status = value;
	}
	
	@Column(name = "channel")
	@Enumerated(EnumType.STRING)
	public Channel getChannel() {
		return this.channel;
	}
	
	public void setChannel(Channel value) {
		this.channel = value;
	}
	
	@Column(name = "mobile")
	public java.lang.String getMobile() {
		return mobile;
	}

	public void setMobile(java.lang.String mobile) {
		this.mobile = mobile;
	}

	@Column(name = "trade_no")
	public java.lang.String getTradeNo() {
		return this.tradeNo;
	}
	
	public void setTradeNo(java.lang.String value) {
		this.tradeNo = value;
	}
	
	@Column(name = "out_trade_no")
	public java.lang.String getOutTradeNo() {
		return this.outTradeNo;
	}
	
	public void setOutTradeNo(java.lang.String value) {
		this.outTradeNo = value;
	}
	
	@Column(name = "coupon_code")
	public java.lang.Long getCouponCode() {
		return this.couponCode;
	}
	
	public void setCouponCode(java.lang.Long value) {
		this.couponCode = value;
	}
	
	private Account operator;
	public void setOperator(Account operator){
		this.operator = operator;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "operator") 
	})
	public Account getOperator() {
		return operator;
	}
	
	private Area area;
	public void setArea(Area area){
		this.area = area;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "area") 
	})
	public Area getArea() {
		return area;
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
	
	public enum Channel {
		WECHAT, ALIPAY
	}
	
	public enum Status {
		START("初始化"), WAIT_FOR_PAY("等待支付"), PAIED("已支付"), SUCCESS("成功"), FAIL("失败");
		
		private String description = "失败";

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
	
	@PrePersist
	private void prePersist() {
		if(this.address == null) this.address = "N/A";
		
		if(this.isInvoice == null) this.isInvoice = true;
		
		if(this.isAllocatedStock == null) this.isAllocatedStock = false;
		
		if(this.status == null) this.status = Status.START;
		
		if(this.channel == null) this.channel = Channel.ALIPAY;
	}
}

