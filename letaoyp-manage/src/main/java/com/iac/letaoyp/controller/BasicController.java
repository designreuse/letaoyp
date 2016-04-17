package com.iac.letaoyp.controller;

import java.beans.PropertyEditorSupport;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.iac.letaoyp.util.DateUtil;
import com.iac.letaoyp.util.HtmlFilter;

public class BasicController {

	protected final static String DEFAULT_PAGE_SIZE = "20";
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_TYPE = "id desc";
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(text == null ? null : HtmlFilter.filter(text));
			}
			@Override
			public String getAsText() {
				Object value = getValue();
				return value != null ? value.toString() : "";
			}
		});
		
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(StringUtils.isBlank(text) ? null : DateUtil.parse(text));
			}
			@Override
			public String getAsText() {
				Object value = getValue();
				return value != null ? DateUtil.format((Date)value) : "";
			}
		});
	}
}
