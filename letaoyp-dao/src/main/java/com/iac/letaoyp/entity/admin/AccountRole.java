package com.iac.letaoyp.entity.admin;

import com.iac.letaoyp.entity.IdEntity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


/**
 *
 * @author dingp email:dingp@51box.cn
 * @version 1.0
 * @since 1.0
 * * 用户角色表
 */
@Entity
@Table(name = "s_account_role")
public class AccountRole extends IdEntity {
	private static final long serialVersionUID = -5244220188686107038L;
	private Account account;
	private Role role;
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "account")
	})
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "role") 
	})
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
}

