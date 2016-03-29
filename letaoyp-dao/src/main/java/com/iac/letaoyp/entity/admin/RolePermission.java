package com.iac.letaoyp.entity.admin;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.iac.letaoyp.entity.IdEntity;

@Entity
@Table(name = "s_role_permission")
public class RolePermission extends IdEntity {
	private static final long serialVersionUID = -4408463024322504251L;
	private Permission permission;
	private Role role;
	
	public void setPermission(Permission permission){
		this.permission = permission;
	}
	
	@ManyToOne(cascade = {CascadeType.MERGE}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "permission") 
	})
	public Permission getPermission() {
		return permission;
	}
	
	public void setRole(Role role){
		this.role = role;
	}
	
	@ManyToOne(cascade = {CascadeType.MERGE}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "role") 
	})
	public Role getRole() {
		return role;
	}
}

