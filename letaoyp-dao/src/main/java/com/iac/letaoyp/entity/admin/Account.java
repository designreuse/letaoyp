package com.iac.letaoyp.entity.admin;

import com.iac.letaoyp.entity.IdEntity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Lists;

@Entity
@Table(name = "s_account")
public class Account extends IdEntity {

	private static final long serialVersionUID = -7157548468768046998L;
	private String name;
	private String loginName;
	private String password;
	private String plainPassword;
	private String salt;
	
	private List<AccountRole> accountRoles = Lists.newArrayList();
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@NotBlank
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Transient
	@JsonIgnore
	public String getPlainPassword() {
		return plainPassword;
	}
	public void setPlainPassword(String plainPassword) {
		this.plainPassword = plainPassword;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account", cascade=CascadeType.ALL)
	@Fetch(FetchMode.SUBSELECT)
	public List<AccountRole> getAccountRoles() {
		return accountRoles;
	}
	public void setAccountRoles(List<AccountRole> accountRoles) {
		this.accountRoles = accountRoles;
	}
	
	@Transient
	@JsonIgnore
	public List<String> getRoleNames() {
		List<String> result = new ArrayList<String>();
		for(AccountRole ar : accountRoles) {
			Role role = ar.getRole();
			result.add(role.getName());
		}
		return result;
	}
	
	@Transient
	@JsonIgnore
	public Collection<String> getPermissinNames() {
		List<String> result = new ArrayList<String>();
		for(AccountRole ar : accountRoles) {
			Role role = ar.getRole();
			result.addAll(role.getPermissionNames());
		}
		return result;
	}
}
