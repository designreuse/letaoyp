package com.iac.letaoyp.service;

import java.util.HashMap;
import java.util.Map;

import org.springside.modules.mapper.JsonMapper;

public class T {

	public static void main(String[] args) {
		Map<String, String> p = new HashMap<String, String>();
		p.put("衣门襟", "拉链");
		p.put("组合形式", "单件");
		p.put("袖长", "长袖");
		p.put("裙长", "短裙");
		System.out.println(JsonMapper.nonEmptyMapper().toJson(p));
	}
}
