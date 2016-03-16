package com.iac.letaoyp.security;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.iac.letaoyp.entity.sku.Goods;

public class GoodsHistory implements Serializable {

	/**
	 * 浏览历史
	 */
	public static final String KEY_VISIT_HISTORY = "_key_visit_history";
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7439490184745872602L;

	private List<Goods> list = new ArrayList<Goods>();
	
	public void addVisit(Goods goods) {
		if(list.size() > 5) {
			list.remove(0);
		}
		
		boolean exists = false;
		for(Goods g : list) {
			if(g.getId().longValue() == goods.getId().longValue()) {
				exists = true;
				break;
			}
		}
		
		if(!exists)
			list.add(goods);
	}

	public List<Goods> getList() {
		return list;
	}

	public void setList(List<Goods> list) {
		this.list = list;
	}
	
}
