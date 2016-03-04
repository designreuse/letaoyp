package com.iac.letaoyp.entity.admin;

import com.iac.letaoyp.entity.IdEntity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;


/**
 *
 * @author dingp email:dingp@51box.cn
 * @version 1.0
 * @since 1.0
 * * 角色表
 */
@Entity
@Table(name = "s_role")
public class Role extends IdEntity {
	
	private static final long serialVersionUID = -2572445669427322056L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * name       db_column: name 
     */ 	
	@NotBlank @Length(max=32)
	private java.lang.String name;
    /**
     * description       db_column: description 
     */ 	
	@Length(max=255)
	private java.lang.String description;
    /**
     * active       db_column: active 
     */ 	
	//columns END
	
	private List<AccountRole> accountRoles;
	
	private List<RolePermission> rolePermissions;

	@Column(name = "name", unique = false, nullable = false, insertable = true, updatable = true, length = 32)
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	@Column(name = "description", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getDescription() {
		return this.description;
	}
	
	public void setDescription(java.lang.String value) {
		this.description = value;
	}
	
	public void setAccountRoles(List<AccountRole> accountRole){
		this.accountRoles = accountRole;
	}
	
	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "role")
	@Fetch(FetchMode.SUBSELECT)
	public List<AccountRole> getAccountRoles() {
		return accountRoles;
	}

	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "role")
	@Fetch(FetchMode.SUBSELECT)
	public List<RolePermission> getRolePermissions() {
		return rolePermissions;
	}

	public void setRolePermissions(List<RolePermission> rolePermissions) {
		this.rolePermissions = rolePermissions;
	}
	
	@Transient	
	@JsonIgnore
	public List<String> getPermissionNames() {
		List<String> result = new ArrayList<String>();
		for(RolePermission rolePermission : rolePermissions) {
			Permission p = rolePermission.getPermission();
			result.add(p.getName());
		}
		return result;
	}
}

