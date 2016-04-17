package com.iac.letaoyp.entity;

import java.util.Date;

import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

public class EntityListener {

	@PreUpdate
	public void preUpdate(IdEntity entity) {
		if(entity.getCreated() == null)
			entity.setCreated(new Date());
		
		if(entity.getModified() == null)
			entity.setModified(new Date());
	}
	
	@PrePersist
	public void PrePersist(IdEntity entity) {
		if(entity.getCreated() == null)
			entity.setCreated(new Date());
		
		if(entity.getModified() == null)
			entity.setModified(new Date());
		
		if(entity.getActive() == null) 
			entity.setActive(true);
	}
}
