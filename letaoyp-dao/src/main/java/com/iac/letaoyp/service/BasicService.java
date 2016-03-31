package com.iac.letaoyp.service;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;

import com.iac.letaoyp.repository.BasicRepository;

public abstract class BasicService<E, pk extends Serializable> {
	public abstract BasicRepository<E, pk> getRepository();
	
	public E get(pk id) {
		return getRepository().findOne(id);
	}

	public void save(E entity) {
		getRepository().save(entity);
	}

	public void delete(pk id) {
		getRepository().delete(id);
	}

	public List<E> listAll() {
		return (List<E>) getRepository().findAll();
	}

	/**
	 * 
	 * @param searchParams	key : OPERATOR_FIELDNAME 
	 * @param pageNumber
	 * @param pageSize
	 * @param sortType
	 * @return
	 */
	public Page<E> findPage(Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
		Specification<E> spec = buildSpecification(searchParams);
		return getRepository().findAll(spec, pageRequest);
	}

	/**
	 * 创建分页请求. PageRequest start index with 0
	 */
	private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
		Sort sort = parse(sortType);

		return new PageRequest(pageNumber - 1, pagzSize, sort);
	}
	
	/**
	 * 创建sort
	 * @param sort	: 字段 asc|desc
	 * @return
	 */
	public Sort parse(String sort) {
		Sort result = null;
		if(StringUtils.isBlank(sort)) return null;
		
		for(String tmp : sort.split(",")) {
			Sort sortTmp = from(tmp);
			
			if(result == null) {
				result = sortTmp;
			} else {
				result.and(sortTmp);
			}
		}
		
		return result;
	}
	
	private Sort from(String single) {
		String[] sortTypeGroup = single.trim().split(" ");

		String dirctionStr = sortTypeGroup.length == 1
				|| StringUtils.isBlank(sortTypeGroup[1]) ? "asc"
				: sortTypeGroup[1];
		Direction dirction = Direction.fromString(dirctionStr);
		return new Sort(dirction, sortTypeGroup[0]);
	}

	/**
	 * 创建动态查询条件组合.
	 */
	@SuppressWarnings("unchecked")
	private Specification<E> buildSpecification(Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		Class<E> entityClass = (Class<E>)((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
		Specification<E> spec = DynamicSpecifications.bySearchFilter(filters.values(), entityClass);
		return spec;
	}

}
