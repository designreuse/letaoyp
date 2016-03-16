package com.iac.letaoyp.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.PropertyUtils;
import org.springside.modules.utils.Reflections;

public class CollectionsUtil {

	/**
	 * Collect list with same KeyProperty as value
	 * @param src
	 * @param keyProperty
	 * @return
	 */
	public static <T> Map<Object, List<T>> extract(Collection<T> src, String keyProperty) {
		Map<Object, List<T>> result = new HashMap<Object, List<T>>();
		if(src.isEmpty()) return result;
		
		Iterator<T> i = src.iterator();
		try {
			while(i.hasNext()) {
				T t = i.next();
				Object key = PropertyUtils.getProperty(t, keyProperty);
				List<T> temp = result.get(key);
				
				if(temp == null) {
					temp = new ArrayList<T>();
					result.put(key, temp);
				}
				
				temp.add(t);
			}
		} catch (Exception e) {
			throw Reflections.convertReflectionExceptionToUnchecked(e);
		}
		
		return result;
	}

	public static <T> Map<Object, List<T>> extractToMap(Collection<T> collection, String keyProperty) {
		Map<Object, List<T>> map = new HashMap<Object, List<T>>(collection.size());

		try {
			for (Object obj : collection) {
				Object key = PropertyUtils.getProperty(obj, keyProperty);
				
				List list = map.get(key);
				if(list == null) {
					list = new ArrayList<Object> ();
					map.put(key, list);
				}
				
				list.add(obj);
			}
		} catch (Exception e) {
			throw Reflections.convertReflectionExceptionToUnchecked(e);
		}

		return map;
	}
	
}
