package com.iac.letaoyp;

import java.lang.reflect.Field;

import org.springside.modules.utils.Reflections;

import com.iac.letaoyp.entity.sku.Goods;

public class EnumTest {

	public static void main(String[] args) {
		Goods.Status status = Goods.Status.OFFLINE;
		
		System.out.println("status . class" + status.getClass().getSuperclass());
		
		Goods goods = new Goods();
		
		Field field = Reflections.getAccessibleField(goods, "status");
		
		Enum e = Enum.valueOf(field.getType().asSubclass(Enum.class), "");
		System.out.println(e);
		
		System.out.println(Enum.class.isAssignableFrom(field.getType()));
		Reflections.setFieldValue(goods, "status", Enum.valueOf(field.getType().asSubclass(Enum.class), ""));
		System.out.println(goods.getStatus());
	}
}
